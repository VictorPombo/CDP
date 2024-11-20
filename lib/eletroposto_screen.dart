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
        title: Text('Eletropostos Próximos a Sua Localização'),
      ),
      body: Consumer<EletropostoProvider>(
        builder: (context, eletropostoProvider, child) {
          if (eletropostoProvider.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (eletropostoProvider.errorMessage != null) {
            return Center(child: Text(eletropostoProvider.errorMessage!));
          } else if (eletropostoProvider.eletropostos.isEmpty) {
            return Center(child: Text('Nenhum eletroposto encontrado'));
          } else {

            final eletropostos = eletropostoProvider.eletropostos;
            return ListView.builder(
              itemCount: eletropostos.length,
              itemBuilder: (context, index) {
                final eletroposto = eletropostos[index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(eletroposto.nome, style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Endereço: ${eletroposto.endereco}'),
                        if (eletroposto.telefone != null)
                          Text('Telefone: ${eletroposto.telefone}'),
                        Text('Conectores: ${eletroposto.conectores.join(', ')}'),
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
