

class Eletroposto {
  final int id;
  final String nome;
  final String endereco;
  final String? telefone;
  final double? latitude;
  final double? longitude;
  final bool ativo;
  final List<String> conectores;

  Eletroposto({
    required this.id,
    required this.nome,
    required this.endereco,
    this.telefone,
    this.latitude,
    this.longitude,
    this.ativo = false, 
    required this.conectores,
  });

  factory Eletroposto.fromJson(Map<String, dynamic> json) {
    return Eletroposto(
      id: json['id'],
      nome: json['nome'],
      endereco: json['endereco'],
      telefone: json['telefone'],
      latitude: json['latitude'] != null ? json['latitude'].toDouble() : null,
      longitude: json['longitude'] != null ? json['longitude'].toDouble() : null,
      ativo: json['ativo'] == null ? false : json['ativo'],
      conectores: List<String>.from(json['conectores'] ?? []),
    );
  }
}
