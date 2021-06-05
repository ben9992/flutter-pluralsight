import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trip Cost Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new FuelForm(),
    );
  }
}

class FuelForm extends StatefulWidget {
  @override
  State createState() => _FuelFormState();
}

class _FuelFormState extends State {
  String? result = "";
  final _currencies = ['Dollars', 'Euro', 'Pounds'];
  String? _currency = 'Dollars';
  double spacing = 10;
  TextEditingController distanceController = TextEditingController();
  TextEditingController avgController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.headline6;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Trip Cost Calculator")),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(height: spacing),
            TextField(
                controller: distanceController,
                decoration: InputDecoration(
                    labelText: "Distance",
                    hintText: "e.g. 124",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                    labelStyle: textStyle),
                keyboardType: TextInputType.number),
            SizedBox(height: spacing),
            TextField(
                controller: avgController,
                decoration: InputDecoration(
                    labelText: "Distance Per Unit",
                    hintText: "e.g. 17",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                    labelStyle: textStyle),
                keyboardType: TextInputType.number),
            SizedBox(height: spacing),
            Row(
              children: [
                Expanded(
                    child: TextField(
                        controller: priceController,
                        decoration: InputDecoration(
                            labelText: "Price",
                            hintText: "e.g. 1.65",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                            labelStyle: textStyle),
                        keyboardType: TextInputType.number)),
                SizedBox(width: spacing),
                Expanded(
                    child: DropdownButton<String?>(
                  items: _currencies.map((String? value) {
                    return DropdownMenuItem<String?>(
                        value: value, child: Text(value.toString()));
                  }).toList(),
                  value: _currency,
                  onChanged: (String? newValue) {
                    setState(() {
                      _onDropdownChanged(newValue);
                    });
                  },
                )),
              ],
            ),
            SizedBox(height: spacing),
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColorDark,
                            onPrimary: Theme.of(context).primaryColorLight),
                        onPressed: () {
                          setState(() {
                            result = _calculate();
                          });
                        },
                        child: Text(
                          "Submit",
                          textScaleFactor: 1.5,
                        ))),
                SizedBox(width: spacing),
                Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).buttonColor,
                            onPrimary: Theme.of(context).primaryColorDark),
                        onPressed: () {
                          setState(() {
                            _reset();
                          });
                        },
                        child: Text(
                          "Reset",
                          textScaleFactor: 1.5,
                        )))
              ],
            ),
            SizedBox(height: spacing),
            Text(result.toString())
          ],
        ),
      ),
    );
  }

  _onDropdownChanged(String? value) {
    setState(() {
      this._currency = value;
    });
  }

  String _calculate() {
    double _distance = double.parse(distanceController.text);
    double _fuelCost = double.parse(priceController.text);
    double _consumtion = double.parse(avgController.text);
    double _totalCost = _distance / _consumtion * _fuelCost;
    return 'The total cost of your trip is ${_totalCost.toStringAsFixed(2)} ${_currency.toString()}';
  }

  void _reset() {
    distanceController.text = avgController.text = priceController.text = "";
    setState(() {
      result = '';
    });
  }
}
