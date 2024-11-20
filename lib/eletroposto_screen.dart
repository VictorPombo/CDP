import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myapp/eletropostoProvider.dart';

class EletropostoScreen extends StatefulWidget {
  @override
  _EletropostoScreenState createState() => _EletropostoScreenState();
}

class _EletropostoScreenState extends State<EletropostoScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<EletropostoProvider>(context, listen: false).fetchEletropostos());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Eletropostos Próximos a Sua Localização (Victor86974 -- Guilherme93309)',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Consumer<EletropostoProvider>(
        builder: (context, eletropostoProvider, child) {
          if (eletropostoProvider.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (eletropostoProvider.errorMessage != null) {
            return Center(child: Text(eletropostoProvider.errorMessage!,
                style: TextStyle(color: Colors.red, fontSize: 16)));
          } else if (eletropostoProvider.eletropostos.isEmpty) {
            return Center(child: Text(
              'Nenhum eletroposto encontrado',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ));
          } else {
            final eletropostos = eletropostoProvider.eletropostos;
            return ListView.builder(
              padding: EdgeInsets.all(16.0),
              itemCount: eletropostos.length,
              itemBuilder: (context, index) {
                final eletroposto = eletropostos[index];
                return Card(
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(16.0),
                    title: Text(
                      eletroposto.nome,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 8.0),
                        Text(
                          'Endereço: ${eletroposto.endereco}',
                          style: TextStyle(color: Colors.black54),
                        ),
                        if (eletroposto.telefone != null)
                          Text(
                            'Telefone: ${eletroposto.telefone}',
                            style: TextStyle(color: Colors.black54),
                          ),
                        Text(
                          'Conectores: ${eletroposto.conectores.join(', ')}',
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
