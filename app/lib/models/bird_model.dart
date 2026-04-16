/// Modelo que representa una ave identificada con su información ancestral
class BirdSpecies {
  final String speciesName; // Nombre científico
  final String? spanishName; // Nombre en español
  final String? nativeName; // Nombre en lengua nativa (Kogui, Wiwa, Arhuaco)
  final String? language; // Lengua indígena
  final String? ancestralMeaning; // Significado ancestral
  final String? cosmovisionRole; // Rol en la cosmovisión
  final String? habitat; // Hábitat en la región
  final String? imageUrl; // URL de imagen de referencia
  final String? audioUrl; // URL de audio de referencia

  BirdSpecies({
    required this.speciesName,
    this.spanishName,
    this.nativeName,
    this.language,
    this.ancestralMeaning,
    this.cosmovisionRole,
    this.habitat,
    this.imageUrl,
    this.audioUrl,
  });

  /// Parsea respuesta JSON del backend
  factory BirdSpecies.fromJson(Map<String, dynamic> json) {
    final ficha = json['ficha_ancestral'] ?? {};
    return BirdSpecies(
      speciesName: json['especie_identificada'] ?? 'Desconocida',
      spanishName: ficha['nombre_espanol'],
      nativeName: ficha['nombre_nativo'],
      language: ficha['lengua'],
      ancestralMeaning: ficha['significado_ancestral'],
      cosmovisionRole: ficha['rol_cosmovision'],
      habitat: ficha['habitat'],
      imageUrl: ficha['imagen_url'],
      audioUrl: ficha['audio_url'],
    );
  }

  /// Convierte a JSON para envíos (si es necesario)
  Map<String, dynamic> toJson() => {
        'especie_identificada': speciesName,
        'ficha_ancestral': {
          'nombre_espanol': spanishName,
          'nombre_nativo': nativeName,
          'lengua': language,
          'significado_ancestral': ancestralMeaning,
          'rol_cosmovision': cosmovisionRole,
          'habitat': habitat,
          'imagen_url': imageUrl,
          'audio_url': audioUrl,
        },
      };
}
