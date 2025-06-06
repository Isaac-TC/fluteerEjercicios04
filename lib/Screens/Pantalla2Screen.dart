import 'package:flutter/material.dart';

class Pantalla2 extends StatefulWidget {
  const Pantalla2({super.key});

  @override
  State<Pantalla2> createState() => _Pantalla2State();
}

class _Pantalla2State extends State<Pantalla2> {
  final capitalController = TextEditingController();
  final tasaController = TextEditingController();
  final tiempoController = TextEditingController();

  String resultado = "";

  void calcularInteres() {
    final capital = double.tryParse(capitalController.text) ?? -1;
    final tasa = double.tryParse(tasaController.text) ?? -1;
    final tiempo = double.tryParse(tiempoController.text) ?? -1;

    if (capital <= 0 || tasa <= 0 || tiempo <= 0) {
      mostrarAlerta("⚠️ Todos los valores deben ser numéricos y positivos.");
      return;
    }

    final interes = capital * tasa * tiempo / 100;
    final montoFinal = capital + interes;

    setState(() {
      resultado =
          "💰 Capital inicial: \$${capital.toStringAsFixed(2)}\n"
          "📈 Interés generado: \$${interes.toStringAsFixed(2)}\n"
          "🧮 Monto final: \$${montoFinal.toStringAsFixed(2)}";
    });
  }

  void limpiarCampos() {
    capitalController.clear();
    tasaController.clear();
    tiempoController.clear();
    setState(() {
      resultado = "";
    });
  }

  void mostrarAlerta(String mensaje) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Atención"),
        content: Text(mensaje),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text("OK"))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("PANTALLA 2 - Interés Simple")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: capitalController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Capital inicial",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: tasaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Tasa de interés anual (%)",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: tiempoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Tiempo (años)",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: calcularInteres,
              child: Text("Calcular"),
            ),
            TextButton(
              onPressed: limpiarCampos,
              child: Text("Limpiar"),
            ),
            SizedBox(height: 24),
            Text(
              resultado,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 18, color: Colors.indigo),
            ),
          ],
        ),
      ),
    );
  }
}
