import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  const String env = String.fromEnvironment('env', defaultValue: 'production');
  String fileName;

  // Para elegir el env correr flutter run --dart-define=env=test|production
  // Por defecto corre el local
  switch (env) {
    case 'test':
      fileName = '.env.test';
      break;
    case 'production':
      fileName = '.env.production';
      break;
    default:
      fileName = '.env.';
  }

  await dotenv.load(fileName: fileName);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Codemagic Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar:
            AppBar(title: const Text('Probando Codemagic'), centerTitle: true),
        body:
            Center(child: Column(
              children: [
                Text(dotenv.get('TEXTO', fallback: 'No encontrado')),
                Text("Nueva feature")
              ],
            )),
      ),
    );
  }
}
