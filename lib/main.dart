import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: 'Calculator',
      theme: ThemeData(primaryColor: Colors.teal),
      home: Calculator(),
    ));

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final _operation = ["Add", "Substraction", "Multiply", "Divide"];
  var _values = "Add";
  var _displayText = "";

  TextEditingController textBox1 = TextEditingController();
  TextEditingController textBox2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Simple Calculator rciejbcrrej'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              DropdownButton<String>(
                value: "Substraction",
                items: _operation.map((String values) {
                  return DropdownMenuItem<String>(
                      value: values, child: Text(values));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _values = value.toString();
                    print("value changed to $value");
                  });
                },
              ),
              //second item
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
              ),
              TextField(
                  controller: textBox1,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "first number",
                    hintText: "100",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  )
                  //third item
                  ),
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
              ),

              TextField(
                controller: textBox2,
                keyboardType: TextInputType.number,

                decoration: InputDecoration(
                  labelText: "second number",
                  hintText: "200",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                //fourth item
              ),

              //fifth item
              Text(
                _displayText,
                style: const TextStyle(
                  fontSize: 15.0,
                ),
              ),
              //fifth item
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // ignore: deprecated_member_use
                  RaisedButton(
                      child: const Text('Calculate'),
                      onPressed: () {
                        setState(() {
                          double first = double.parse(textBox1.text);
                          double second = double.parse(textBox1.text);

                          switch (_values) {
                            case "Add":
                              var sum = first + second;
                              _displayText =
                                  "the sum is" + sum.toStringAsFixed(0);

                              break;

                            case "Substraction":
                              var dif = first - second;
                              _displayText =
                                  "the difference is" + dif.toStringAsFixed(0);

                              break;
                            case "Multiply":
                              var mul = first * second;
                              _displayText = "the multiplication is" +
                                  mul.toStringAsFixed(0);

                              break;
                            case "Divide":
                              var divide = first / second;
                              _displayText =
                                  "the division is" + divide.toStringAsFixed(0);
                              break;
                            default:
                              _displayText = "something went wrong";
                          }
                        });
                      }),
                  // ignore: deprecated_member_use
                  RaisedButton(
                      child: const Text('Clear'),
                      onPressed: () {
                        setState(() {
                          _clearAll();
                        });
                      }),
                ],
              )
            ],
          ),
        ));
  }

  void _clearAll() {
    textBox1.text = "";
    textBox2.text = "";
  }

  void _calculateResult(value) {}
}
