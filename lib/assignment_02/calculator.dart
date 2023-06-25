import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  TextEditingController _num1Controller = TextEditingController();
  TextEditingController _num2Controller = TextEditingController();

  String _result = '?';
  String _resultOperator = '';

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screeWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 32,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 64,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      width: screeWidth / 3,
                      child: TextField(
                        controller: _num1Controller,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "Num 1",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        _resultOperator,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      width: screeWidth / 3,
                      child: TextField(
                        controller: _num2Controller,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "Num 2",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 32,
            ),

            //Result
            Container(
              margin: EdgeInsets.symmetric(horizontal: 64),
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 32,
              ),
              alignment: Alignment.center,
              width: screeWidth / 1,
              decoration: BoxDecoration(
                // color: Colors.grey,
                border: Border.all(
                  width: 1,
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Text(
                _result,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(
              height: 32,
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 64,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  // Add Buttons
                  FloatingActionButton(
                    child: const Icon(Icons.add),
                    onPressed: () {
                      if(_num1Controller.text.isNotEmpty && _num2Controller.text.isNotEmpty){
                        _add(_num1Controller.text, _num2Controller.text);
                        _resultOperator = "+";
                      }

                      setState(() {

                      });
                    },
                  ),

                  // Subtract Buttons
                  FloatingActionButton(
                    child: const Icon(Icons.remove),
                    onPressed: () {
                      if(_num1Controller.text.isNotEmpty && _num2Controller.text.isNotEmpty){
                        _subtract(_num1Controller.text, _num2Controller.text);
                        _resultOperator = "-";
                      }

                      setState(() {

                      });
                    },
                  ),

                  // Multiply Buttons
                  FloatingActionButton(
                    child: const Text("X"),
                    onPressed: () {
                      if(_num1Controller.text.isNotEmpty && _num2Controller.text.isNotEmpty){
                        _multiply(_num1Controller.text, _num2Controller.text);
                        _resultOperator = "x";
                      }

                      setState(() {

                      });
                    },
                  ),

                  // Subtract Buttons
                  FloatingActionButton(
                    child: const Text("/"),
                    onPressed: () {
                      if(_num1Controller.text.isNotEmpty && _num2Controller.text.isNotEmpty){
                        _divide(_num1Controller.text, _num2Controller.text);
                        _resultOperator = "/";
                      }

                      setState(() {

                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _add(String num1Str, String num2Str) {
    double n1 = double.parse(num1Str);
    double n2 = double.parse(num2Str);
    double resultDouble = n1 + n2;
    int resultInt = 0;

    String resut = resultDouble.toString();
    String valueAfterDecimal = resut.substring(resut.indexOf('.') + 1);
    debugPrint(valueAfterDecimal.toString());
    resultInt = resultDouble.toInt();
    if (valueAfterDecimal == '0') {
      resultInt = resultDouble.toInt();
      _result = resultInt.toString();
    } else {
      _result = resultDouble.toString();
    }
  }

  void _subtract(String num1Str, String num2Str) {
    double n1 = double.parse(num1Str);
    double n2 = double.parse(num2Str);
    double resultDouble = n1 - n2;
    int resultInt = 0;

    String resut = resultDouble.toString();
    String valueAfterDecimal = resut.substring(resut.indexOf('.') + 1);
    debugPrint(valueAfterDecimal.toString());
    resultInt = resultDouble.toInt();
    if (valueAfterDecimal == '0') {
      resultInt = resultDouble.toInt();
      _result = resultInt.toString();
    } else {
      _result = resultDouble.toString();
    }
  }

  void _multiply(String num1Str, String num2Str) {
    double n1 = double.parse(num1Str);
    double n2 = double.parse(num2Str);
    double resultDouble = n1 * n2;
    int resultInt = 0;

    String resut = resultDouble.toString();
    String valueAfterDecimal = resut.substring(resut.indexOf('.') + 1);
    debugPrint(valueAfterDecimal.toString());
    resultInt = resultDouble.toInt();
    if (valueAfterDecimal == '0') {
      resultInt = resultDouble.toInt();
      _result = resultInt.toString();
    } else {
      _result = resultDouble.toString();
    }
  }

  void _divide(String num1Str, String num2Str) {
    double n1 = double.parse(num1Str);
    double n2 = double.parse(num2Str);
    double resultDouble = n1 / n2;
    int resultInt = 0;

    String resut = resultDouble.toString();
    String valueAfterDecimal = resut.substring(resut.indexOf('.') + 1);
    debugPrint(valueAfterDecimal.toString());
    resultInt = resultDouble.toInt();
    if (valueAfterDecimal == '0') {
      resultInt = resultDouble.toInt();
      _result = resultInt.toString();
    } else {
      _result = resultDouble.toString();
    }
  }
}

