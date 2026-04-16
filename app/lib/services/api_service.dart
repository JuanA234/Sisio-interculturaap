import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import '../models/bird_model.dart';

/// Servicio para comunicación con el backend FastAPI en localhost:8000
class ApiService {
  static const String baseUrl = 'http://localhost:8000';

  /// Identifica un ave desde una foto
  /// Retorna BirdSpecies si se identificó correctamente
  /// Lanza excepción si falla
  static Future<BirdSpecies> identifyBirdFromPhoto(File imageFile) async {
    try {
      final request = http.MultipartRequest(
        'POST',
        Uri.parse('$baseUrl/photo/identify'),
      );

      request.files.add(
        await http.MultipartFile.fromPath('file', imageFile.path),
      );

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return BirdSpecies.fromJson(json);
      } else if (response.statusCode == 404) {
        final json = jsonDecode(response.body);
        throw Exception(json['detail'] ?? 'Ave no identificada');
      } else {
        throw Exception('Error en la identificación: ${response.statusCode}');
      }
    } on SocketException {
      throw Exception('Error de conexión. Verifica que el backend esté corriendo en localhost:8000');
    }
  }

  /// Identifica un ave desde un archivo de audio WAV
  /// Retorna BirdSpecies si se identificó correctamente
  /// Lanza excepción si falla
  static Future<BirdSpecies> identifyBirdFromAudio(File audioFile) async {
    try {
      final request = http.MultipartRequest(
        'POST',
        Uri.parse('$baseUrl/audio/identify'),
      );

      request.files.add(
        await http.MultipartFile.fromPath('file', audioFile.path),
      );

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return BirdSpecies.fromJson(json);
      } else if (response.statusCode == 404) {
        final json = jsonDecode(response.body);
        throw Exception(json['detail'] ?? 'Ave no identificada');
      } else {
        throw Exception('Error en la identificación: ${response.statusCode}');
      }
    } on SocketException {
      throw Exception('Error de conexión. Verifica que el backend esté corriendo en localhost:8000');
    }
  }

  /// Verifica la salud del backend
  static Future<bool> checkBackendHealth() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/')).timeout(
        const Duration(seconds: 5),
      );
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
}
