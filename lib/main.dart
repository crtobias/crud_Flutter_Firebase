import 'package:flutter/material.dart';
import './components/icon.dart'; //IMPORTO MI COMOPONENTE :)

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print('Firebase inicializado correctamente');
  } catch (e) {
    print('Error al inicializar Firebase: $e');
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Constructor de la clase MyApp
  // Este widget es la raíz de tu aplicación.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo', // Título de la aplicación
      theme: ThemeData(
        // Este es el tema de tu aplicación.
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 238, 4, 4)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'TreeNote'),
      // Página inicial de la aplicación
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage(
      {super.key, required this.title}); // Constructor de la clase MyHomePage
  final String title;
  @override
  State<MyHomePage> createState() =>
      _MyHomePageState(); // Crea el estado de la página de inicio
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      //setState indica a fluter que hay cambios asi hace build de nuevo
      _counter++;
    });
  }

  @override // responsable de crear y devolver la estructura de widgets que define la interfaz de usuario de tu widget
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        // Center es un widget de layout. centra
        child: Column(
          // Column también es un widget de layout. columna
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Has presionado el botón esta cantidad de veces:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            MyStatelessWidget(
                title:
                    'Componente Personalizado'), //componente creado por mi :)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Incrementar',
        child: const Icon(Icons.add),
      ), // Esta coma final hace que el auto-formato sea más agradable para los métodos build.
    );
  }
}
