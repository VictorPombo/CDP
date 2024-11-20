// providers/eletroposto_provider.dart

import 'package:flutter/material.dart';
import 'package:myapp/eletroposto.dart';
import 'package:myapp/api_service.dart';

class EletropostoProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();

  List<Eletroposto> _eletropostos = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Eletroposto> get eletropostos => _eletropostos;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchEletropostos() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners(); 

    try {
    
      await Future.delayed(Duration(seconds: 2));
      
      _eletropostos = await _apiService.fetchEletropostos();
    } catch (e) {
      _errorMessage = 'Erro ao carregar eletropostos: $e';
    } finally {
      _isLoading = false;
      notifyListeners(); 
    }
  }
}
