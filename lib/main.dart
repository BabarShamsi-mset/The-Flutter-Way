import 'package:flutter/material.dart';

void main() {
  runApp(TipCalculatorApp());
}

class TipCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tip Calculator',
      theme: ThemeData(primarySwatch: Colors.red),
      home: TipCalculator(),
    );
  }
}

class TipCalculator extends StatefulWidget {
  @override
  _TipCalculatorState createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {
  double billAmount = 0.0;
  double tipPercentage = 0;
  double tipAmount = 0.0;
  double totalAmount = 0.0;

  void calculateTip() {
    setState(() {
      tipAmount = billAmount * (tipPercentage / 100);
      totalAmount = billAmount + tipAmount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tip Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Bill Amount',
              ),
              onChanged: (value) {
                setState(() {
                  billAmount = double.parse(value);
                });
              },
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Tip Percentage: $tipPercentage%'),
                Slider(
                  value: tipPercentage.toDouble(),
                  min: 0,
                  max: 20,
                  divisions: 20,
                  onChanged: (value) {
                    setState(() {
                      tipPercentage = value.round().toDouble();
                    });
                    calculateTip();
                  },
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text('Tip Amount: \$${tipAmount.toStringAsFixed(1)}'),
            SizedBox(height: 16.0),
            Text('Total Amount: \$${totalAmount.toStringAsFixed(1)}'),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: calculateTip,
              child: Text('Calculate Tip'),
            ),
          ],
        ),
      ),
    );
  }
}
