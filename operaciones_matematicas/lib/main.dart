import 'package:flutter/material.dart';

void main() {
  runApp(OperacionesMatematicasApp());
}

class OperacionesMatematicasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OperacionesMatematicasScreen(),
    );
  }
}

class OperacionesMatematicasScreen extends StatefulWidget {
  @override
  _OperacionesMatematicasScreenState createState() =>
      _OperacionesMatematicasScreenState();
}

class _OperacionesMatematicasScreenState
    extends State<OperacionesMatematicasScreen> {
  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();
  final TextEditingController num3Controller = TextEditingController();
  String result = "";

  // Funciones de cálculo
  void calcularMayor() {
    final num1 = double.tryParse(num1Controller.text) ?? 0;
    final num2 = double.tryParse(num2Controller.text) ?? 0;
    final num3 = double.tryParse(num3Controller.text) ?? 0;

    setState(() {
      result = "El número mayor es: ${[
        num1,
        num2,
        num3
      ].reduce((a, b) => a > b ? a : b)}";
    });
  }

  void calcularMenor() {
    final num1 = double.tryParse(num1Controller.text) ?? 0;
    final num2 = double.tryParse(num2Controller.text) ?? 0;
    final num3 = double.tryParse(num3Controller.text) ?? 0;

    setState(() {
      result = "El número menor es: ${[
        num1,
        num2,
        num3
      ].reduce((a, b) => a < b ? a : b)}";
    });
  }

  void calcularCuadrado() {
    final num1 = double.tryParse(num1Controller.text) ?? 0;

    setState(() {
      result = "El cuadrado de $num1 es: ${num1 * num1}";
    });
  }

  void calcularCubo() {
    final num1 = double.tryParse(num1Controller.text) ?? 0;

    setState(() {
      result = "El cubo de $num1 es: ${num1 * num1 * num1}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Operaciones Matemáticas"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Número 1"),
            ),
            TextField(
              controller: num2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Número 2"),
            ),
            TextField(
              controller: num3Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Número 3"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calcularMayor,
              child: Text("Calcular Número Mayor"),
            ),
            ElevatedButton(
              onPressed: calcularMenor,
              child: Text("Calcular Número Menor"),
            ),
            ElevatedButton(
              onPressed: calcularCuadrado,
              child: Text("Calcular Cuadrado del Número 1"),
            ),
            ElevatedButton(
              onPressed: calcularCubo,
              child: Text("Calcular Cubo del Número 1"),
            ),
            SizedBox(height: 20),
            Text(
              result,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
