
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myapp/eletroposto.dart';

class ApiService {
  static const String _baseUrl = 'https://eletropostos.azurewebsites.net/api';

  Future<List<Eletroposto>> fetchEletropostos() async {
    final response = await http.get(Uri.parse('$_baseUrl/eletroposto'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Eletroposto.fromJson(json)).toList();
    } else {
      throw Exception('Erro ao carregar eletropostos');
    }
  }
}
