import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController number1Controller = TextEditingController();
  final TextEditingController number2Controller = TextEditingController();
  double result = 0.0;
  String operation = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kalkulator')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: number1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Bilangan 1'),
            ),
            TextField(
              controller: number2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Bilangan 2'),
            ),
            ElevatedButton(
              onPressed: () {
                calculate("+");
              },
              child: Text('+'),
            ),
            ElevatedButton(
              onPressed: () {
                calculate("-");
              },
              child: Text('-'),
            ),
            ElevatedButton(
              onPressed: () {
                calculate("*");
              },
              child: Text('*'),
            ),
            ElevatedButton(
              onPressed: () {
                calculate("/");
              },
              child: Text('/'),
            ),
            ElevatedButton(
              onPressed: () {
                navigateToNextPage();
              },
              child: Text('Halaman Selanjutnya'),
            ),
            Text('Hasil: $result'),
            Text('Operasi: $operation'),
          ],
        ),
      ),
    );
  }

  void calculate(String operator) {
    final double number1 = double.tryParse(number1Controller.text) ?? 0.0;
    final double number2 = double.tryParse(number2Controller.text) ?? 0.0;

    switch (operator) {
      case '+':
        result = number1 + number2;
        break;
      case '-':
        result = number1 - number2;
        break;
      case '*':
        result = number1 * number2;
        break;
      case '/':
        if (number2 != 0) {
          result = number1 / number2;
        } else {
          result = double.nan;
        }
        break;
    }

    operation = '$number1 $operator $number2';
  }

  void navigateToNextPage() {
    // Pindah ke halaman selanjutnya dan tampilkan hasil
    // Anda dapat membuat halaman baru atau menggunakan Navigator untuk berpindah halaman.
  }
}
