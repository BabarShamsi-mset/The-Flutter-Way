import 'package:flutter/material.dart';
import 'package:my_flutter_calculator/bill_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(TipCalculatorApp());
}

class TipCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BillModel>(
      create: (context) => BillModel(),
      child: MaterialApp(
      title: 'Tip Calculator',
      theme: ThemeData(primarySwatch: Colors.red),
      home: TipCalculator(),
    ));
  }
}

class TipCalculator extends StatefulWidget {
  @override
  _TipCalculatorState createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {

  double myBillAmount = 0.0;

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
                myBillAmount = double.parse(value);
              },
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Tip Percentage: ${Provider.of<BillModel>(context).tipPercentage}%'),
                Slider(
                  value: Provider.of<BillModel>(context, listen: false).tipPercentage.toDouble(),
                  min: 0,
                  max: 20,
                  divisions: 20,
                  label: '${Provider.of<BillModel>(context).tipPercentage}%',
                  onChanged: (value) {
                    Provider.of<BillModel>(context, listen: false).tipPercentage = value;
                  },
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Consumer<BillModel>(builder: (context, billModel, child)  {
              return Text('Tip Amount: \$${billModel.calculateTotalTip().toStringAsFixed(2)}');
              },
            ),

            SizedBox(height: 16.0),
            Consumer<BillModel>(builder: (context, billModel, child){
              return Text('Total Amount: \$${billModel.calculateTotalAmount().toStringAsFixed(2)}');

            },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Provider.of<BillModel>(context, listen: false).billAmount = myBillAmount;
            },
              child: Text('Calculate Tip'),
            ),
          ],
        ),
      ),
    );
  }
}
