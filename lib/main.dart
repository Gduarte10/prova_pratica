import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double idade = 0;
  String resultvida = '';

  TextEditingController idadeController = TextEditingController();

  determinarFaseDaVida() {
    double idade = double.parse(idadeController.text);

    if (idade <= 3) {
      resultvida = 'Infância';
    } else if (idade <= 12) {
      resultvida = 'Pré-adolescência';
    } else if (idade <= 19) {
      resultvida = 'Adolescência';
    } else if (idade <= 35) {
      resultvida = 'Juventude';
    } else if (idade <= 55) {
      resultvida = 'Meia-idade';
    } else if (idade <= 130) {
      resultvida = 'Terceira idade';
    } else {
      resultvida = 'Virou estampa de camisa';
    }

    setState(() {
      resultvida;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fase da vida',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 255, 255),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints:
              const BoxConstraints(maxWidth: 300), // Largura máxima de 300
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: idadeController,
                  decoration: InputDecoration(
                    labelText: 'Digite sua idade',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onSubmitted: (value) => determinarFaseDaVida(),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: determinarFaseDaVida,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Mostrar fases da vida',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(height: 32),
                resultvida == ''
                    ? const Text('')
                    : Text(
                        'Sua fase da vida é: $resultvida',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
