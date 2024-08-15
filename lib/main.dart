import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade600),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Taschenrechner'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// ***
// **
// *  declaration from properties and method
// **
// ***
class _MyHomePageState extends State<MyHomePage> {
  double _result = 0.0;
  double? _no1;
  double? _no2;
  bool _isStarted = true;
  String _operator = '';
  String _output = '';

  // ***
  // *
  // * is executed when a number is pressed.
  // * here the input of the number is saved in "_no1" or "_no2", depending on whether "_no1" is already set
  // * When "_no2" is entered, the mathematical calculation is executed. This is dependent on the "_operator"
  // * The result of the mathematical calculation is set in "_result" and "_no1".
  // *
  // ***
  void getNumber(double no) {
    setState(() {
      // if there is a previous calculation in "_output" then reset it
      if (_output == _result.toString()) {
        _output = '';
        _result = 0;
      }

      if (_isStarted == true) {
        _no1 = no;
        _output = _output + no.toString();
        _result = no.toDouble();
        _isStarted = false;
      } else {
        _no2 = no;
        _output = _output + no.toString();
        _result = no.toDouble();
      }

      if (_no2 != null && _operator != '') {
        _no2 = no;

        switch (_operator) {
          case '÷':
            _result = _division();
            break;
          case '*':
            _result = _multiplication();
            break;
          case '+':
            _result = _addition();
            break;
          case '-':
            _result = _subtraction();
            break;
        }
        _no1 = _result.toDouble();
      }
    });
  }

  // ***
  // *
  // * sets the opator for the calculation
  // *
  // ***
  void getOpators(String operator) {
    setState(() {
      _operator = operator;
      _output = _output + _operator;
    });
  }

  // ***
  // *
  // * add _no1 amd _no2
  // *
  // * @return double result
  // *
  // ***
  double _addition() {
    double result = 0;
    if (_no1 != null) {
      result = _no1! + _no2!;
    }
    return result;
  }

  // ***
  // *
  // * subtraction _no1 amd _no2
  // *
  // * @return double result
  // *
  // ***
  double _subtraction() {
    double result = 0;
    if (_no1 != null) {
      result = _no1! - _no2!;
    }
    return result;
  }

  // ***
  // *
  // * multiplication _no1 amd _no2
  // *
  // * @return double result
  // *
  // ***
  double _multiplication() {
    double result = 0;
    if (_no1 != null) {
      result = _no1! * _no2!;
    }
    return result;
  }

  // ***
  // *
  // * division _no1 amd _no2
  // *
  // * @return double result
  // *
  // ***
  double _division() {
    double result = 0;
    if (_no1 != null) {
      result = _no1! / _no2!;
    }
    return result;
  }

  // ***
  // *
  // * set the properties to the default value
  // *
  // ***
  void clearCalc() {
    setState(() {
      _no1 = null;
      _no2 = null;
      _operator = '';
      _isStarted = true;
      _output = '';
      _result = 0;
    });
  }

  // ***
  // *
  // * Sets the value of "_result" to the proptery _output
  // * and sets the other properties to their default value
  // *
  // ***
  void calc() {
    setState(() {
      _output = _result.toString();
      _no1 = null;
      _no2 = null;
      _operator = '';
      _isStarted = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.black26,
              padding: const EdgeInsets.all(20.0),
              margin: const EdgeInsets.only(top: 20.0),
              alignment: Alignment.center,
              child: Text(_output == '' ? '0' : _output,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold)),
            ),

            // test
            Center(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    // start Button
                    Container(
                      width: 90,
                      height: 90,
                      margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      // padding: EdgeInsets.all(20.0),
                      child: ElevatedButton(
                        onPressed: () => getNumber(1),
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(
                            fontSize: 24, // Schriftgröße auf 24 gesetzt
                          ),
                          backgroundColor: Colors.white70,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          // alignment: Alignment.topLeft,
                        ),
                        child: const Text('1'),
                      ),
                    ),
                    // end Button
                    // start Button
                    Container(
                      width: 90,
                      height: 90,
                      margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      // padding: EdgeInsets.all(20.0),
                      child: ElevatedButton(
                        onPressed: () => getNumber(2),
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(
                            fontSize: 24, // Schriftgröße auf 24 gesetzt
                          ),
                          backgroundColor: Colors.white70,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          // alignment: Alignment.topLeft,
                        ),
                        child: const Text('2'),
                      ),
                    ),
                    // end Button
                    // start Button
                    Container(
                      width: 90,
                      height: 90,
                      margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      // padding: EdgeInsets.all(20.0),
                      child: ElevatedButton(
                        onPressed: () => getNumber(3),
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(
                            fontSize: 24, // Schriftgröße auf 24 gesetzt
                          ),
                          backgroundColor: Colors.white70,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          // alignment: Alignment.topLeft,
                        ),
                        child: const Text('3'),
                      ),
                    ),
                    // end Button
                    // start Button
                    Container(
                      width: 90,
                      height: 90,
                      margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      // padding: EdgeInsets.all(20.0),
                      child: ElevatedButton(
                        onPressed: () => getOpators('÷'),
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(
                            fontSize: 24, // Schriftgröße auf 24 gesetzt
                          ),
                          backgroundColor: Colors.amber.shade800,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          // alignment: Alignment.topLeft,
                        ),
                        child: const Text('÷'),
                      ),
                    ),
                    // end Button
                  ]),
            ),
            // row 2
            Center(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    // start Button
                    Container(
                      width: 90,
                      height: 90,
                      margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      // padding: EdgeInsets.all(20.0),
                      child: ElevatedButton(
                        onPressed: () => getNumber(4),
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(
                            fontSize: 24, // Schriftgröße auf 24 gesetzt
                          ),
                          backgroundColor: Colors.white70,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          // alignment: Alignment.topLeft,
                        ),
                        child: const Text('4'),
                      ),
                    ),
                    // end Button
                    // start Button
                    Container(
                      width: 90,
                      height: 90,
                      margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      // padding: EdgeInsets.all(20.0),
                      child: ElevatedButton(
                        onPressed: () => getNumber(5),
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(
                            fontSize: 24, // Schriftgröße auf 24 gesetzt
                          ),
                          backgroundColor: Colors.white70,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          // alignment: Alignment.topLeft,
                        ),
                        child: const Text('5'),
                      ),
                    ),
                    // end Button
                    // start Button
                    Container(
                      width: 90,
                      height: 90,
                      margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      // padding: EdgeInsets.all(20.0),
                      child: ElevatedButton(
                        onPressed: () => getNumber(6),
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(
                            fontSize: 24, // Schriftgröße auf 24 gesetzt
                          ),
                          backgroundColor: Colors.white70,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          // alignment: Alignment.topLeft,
                        ),
                        child: const Text('6'),
                      ),
                    ),
                    // end Button
                    // start Button
                    Container(
                      width: 90,
                      height: 90,
                      margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      // padding: EdgeInsets.all(20.0),
                      child: ElevatedButton(
                        onPressed: () => getOpators('*'),
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(
                            fontSize: 24, // Schriftgröße auf 24 gesetzt
                          ),
                          backgroundColor: Colors.amber.shade800,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          // alignment: Alignment.topLeft,
                        ),
                        child: const Text('*'),
                      ),
                    ),
                    // end Button
                  ]),
            ),
            // row 3
            Center(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    // start Button
                    Container(
                      width: 90,
                      height: 90,
                      margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      // padding: EdgeInsets.all(20.0),
                      child: ElevatedButton(
                        onPressed: () => getNumber(7),
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(
                            fontSize: 24, // Schriftgröße auf 24 gesetzt
                          ),
                          backgroundColor: Colors.white70,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          // alignment: Alignment.topLeft,
                        ),
                        child: const Text('7'),
                      ),
                    ),
                    // end Button
                    // start Button
                    Container(
                      width: 90,
                      height: 90,
                      margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      // padding: EdgeInsets.all(20.0),
                      child: ElevatedButton(
                        onPressed: () => getNumber(8),
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(
                            fontSize: 24, // Schriftgröße auf 24 gesetzt
                          ),
                          backgroundColor: Colors.white70,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          // alignment: Alignment.topLeft,
                        ),
                        child: const Text('8'),
                      ),
                    ),
                    // end Button
                    // start Button
                    Container(
                      width: 90,
                      height: 90,
                      margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      // padding: EdgeInsets.all(20.0),
                      child: ElevatedButton(
                        onPressed: () => getNumber(9),
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(
                            fontSize: 24, // Schriftgröße auf 24 gesetzt
                          ),
                          backgroundColor: Colors.white70,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          // alignment: Alignment.topLeft,
                        ),
                        child: const Text('9'),
                      ),
                    ),
                    // end Button
                    // start Button
                    Container(
                      width: 90,
                      height: 90,
                      margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      // padding: EdgeInsets.all(20.0),
                      child: ElevatedButton(
                        onPressed: () => getOpators('+'),
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(
                            fontSize: 24, // Schriftgröße auf 24 gesetzt
                          ),
                          backgroundColor: Colors.amber.shade800,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          // alignment: Alignment.topLeft,
                        ),
                        child: const Text('+'),
                      ),
                    ),
                    // end Button
                  ]),
            ),
            // row5
            Center(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    // start Button
                    Container(
                      margin: const EdgeInsets.only(top: 10.0, bottom: 40.0),
                      width: 90,
                      height: 90,
                      // padding: EdgeInsets.all(20.0),
                      child: ElevatedButton(
                        onPressed: clearCalc,
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(
                            fontSize: 24, // Schriftgröße auf 24 gesetzt
                          ),
                          backgroundColor: Colors.white70,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          // alignment: Alignment.topLeft,
                        ),
                        child: const Text('C'),
                      ),
                    ),
                    // end Button
                    // start Button
                    Container(
                      width: 90,
                      height: 90,
                      margin: const EdgeInsets.only(top: 10.0, bottom: 40.0),
                      // padding: EdgeInsets.all(20.0),
                      child: ElevatedButton(
                        onPressed: () => getNumber(0),
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(
                            fontSize: 24, // Schriftgröße auf 24 gesetzt
                          ),
                          backgroundColor: Colors.white70,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          // alignment: Alignment.topLeft,
                        ),
                        child: const Text('0'),
                      ),
                    ),
                    // end Button
                    // start Button
                    Container(
                      width: 90,
                      height: 90,
                      margin: const EdgeInsets.only(top: 10.0, bottom: 40.0),
                      // padding: EdgeInsets.all(20.0),
                      child: ElevatedButton(
                        onPressed: calc,
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(
                            fontSize: 24, // Schriftgröße auf 24 gesetzt
                          ),
                          backgroundColor: Colors.white70,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          // alignment: Alignment.topLeft,
                        ),
                        child: const Text('='),
                      ),
                    ),
                    // end Button
                    // start Button
                    Container(
                      width: 90,
                      height: 90,
                      margin: const EdgeInsets.only(top: 10.0, bottom: 40.0),
                      // padding: EdgeInsets.all(20.0),
                      child: ElevatedButton(
                        onPressed: () => getOpators('-'),
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(
                            fontSize: 24, // Schriftgröße auf 24 gesetzt
                          ),

                          backgroundColor: Colors.amber.shade800,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          // alignment: Alignment.topLeft,
                        ),
                        child: const Text('-'),
                      ),
                    ),
                    // end Button
                  ]),
            ),
          ],
        ),
      ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
