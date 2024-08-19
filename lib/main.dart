import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teste Banking',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Teste Banking'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  final String _msg = "Saldo Insuficiente";
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _money = 2000;
  bool _isVisible = false;
  String _msg = "";

  void _sacarDinheiro(int valor) {
    setState(() {
      if (valor <= _money) {
        _money -= valor;
      } else {
        _msg = "Saldo Insuficiente";
      }
    });
  }

  void _depositarDinheiro(int valor) {
    setState(() {
      _money += valor;

      if (_money > 0) _msg = "";
    });
  }

  void _changeVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(24),
                  height: 240,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.paid,
                            color: Colors.white,
                            size: 32,
                          ),
                          const SizedBox(width: 24),
                          Text(
                            'Test Banking',
                            style: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'R\$ ${_isVisible ? _money : '******'}',
                            style: TextStyle(
                              fontSize: 30,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                          IconButton(
                            onPressed: _changeVisibility,
                            icon: Icon(
                              _isVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                  child: Row(
                    children: [
                      Text(
                        _msg,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.redAccent,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        _sacarDinheiro(100);
                      },
                      icon: const Icon(
                        Icons.arrow_downward,
                        color: Colors.red,
                      ),
                      label: const Text(
                        'Sacar R\$100',
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton.icon(
                      onPressed: () {
                        _depositarDinheiro(100);
                      },
                      icon: const Icon(
                        Icons.arrow_upward,
                        color: Colors.green,
                      ),
                      label: const Text(
                        'Depositar R\$100',
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String get newMethod => _msg;
}
