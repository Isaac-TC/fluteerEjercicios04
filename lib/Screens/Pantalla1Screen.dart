import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Pantalla1 extends StatefulWidget {
  const Pantalla1({super.key});

  @override
  State<Pantalla1> createState() => _Pantalla1State();
}

class _Pantalla1State extends State<Pantalla1> {

  final cuentaController = TextEditingController();
  final personalizadaController = TextEditingController();
  final formatoMoneda = NumberFormat.currency(locale: 'es_EC', symbol: '\$');
  String resultado = "";

  void calcularPropina(double porcentaje) {
    double cuenta = double.tryParse(cuentaController.text) ?? -1;
    if (cuenta <= 0) {
      _mostrarAlerta("⚠️ Ingresa un monto válido mayor a 0.");
      return;
    }

    double propina = cuenta * porcentaje;
    double total = cuenta + propina;

    setState(() {
      resultado =
          "Propina: ${formatoMoneda.format(propina)}\nTotal a pagar: ${formatoMoneda.format(total)}";
    });
  }

  void calcularPersonalizada() {
    double porcentaje = double.tryParse(personalizadaController.text) ?? -1;
    if (porcentaje <= 0) {
      _mostrarAlerta("⚠️ Ingresa un porcentaje válido mayor a 0.");
      return;
    }
    calcularPropina(porcentaje / 100);
  }

  void _mostrarAlerta(String mensaje) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Resultado"),
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
      appBar: AppBar(title: Text("PANTALLA 1 - Propinas")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: cuentaController,
              decoration: InputDecoration(
                labelText: "Monto total de la cuenta",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            Text("Selecciona el porcentaje de propina:", style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(onPressed: () => calcularPropina(0.10), child: Text("10%")),
                ElevatedButton(onPressed: () => calcularPropina(0.15), child: Text("15%")),
                ElevatedButton(onPressed: () => calcularPropina(0.20), child: Text("20%")),
              ],
            ),
            SizedBox(height: 16),
            TextField(
              controller: personalizadaController,
              decoration: InputDecoration(
                labelText: "Propina personalizada (%)",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: calcularPersonalizada,
              child: Text("Aplicar personalizada"),
            ),
            SizedBox(height: 24),
            Text(
              resultado,
              style: TextStyle(fontSize: 18, color: Colors.green),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
