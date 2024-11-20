
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myapp/eletropostoProvider.dart';
import 'package:myapp/eletroposto_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => EletropostoProvider()),
      ],
      child: MaterialApp(
        home: EletropostoScreen(),
      ),
    );
  }
}
