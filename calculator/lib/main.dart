import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  int num1;
  int num2;
  String textdisp = "";
  String res;
  String optoper;
  void btnclicked(String btnval){
    if(btnval == "C"){
      textdisp = "";
      num1 = 0;
      num2 = 0;
      res = "";
    }
    else if(btnval == "+" || btnval == "-" || btnval == "x" || btnval == "/"){
      num1 = int.parse(textdisp);
      res = "";
      optoper = btnval;
    }
    else if(btnval == "="){
      num2 = int.parse(textdisp);
      if(optoper == "+"){
        res = (num1 + num2).toString();
      }
      if(optoper == "-"){
        res = (num1 - num2).toString();
      }
      if(optoper == "x"){
        res = (num1 * num2).toString();
      }
      if(optoper == "/"){
        res = (num1 ~/ num2).toString();
      }
    }
    else{
      res = int.parse(textdisp + btnval).toString();
    }

    setState(() {
      textdisp = res;
      });
  }

  Widget custombutton(String btnval){
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(25.0),
        onPressed: () => btnclicked(btnval),
         child: Text(
          "$btnval",
          style: TextStyle(
            fontSize: 25.0,
            ),
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calculator",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            ),
          ),//Text
        ),//AppBar 
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.bottomRight,
                child: Text(
                  "$textdisp",
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w600,
                    ),
                  ),
                ),//Container
              ),//Expanded
            Row(
              children: <Widget>[
                custombutton("9"),
                custombutton("8"),
                custombutton("7"),
                custombutton("+"),
                ],//Widget
              ),//row
            Row(
              children: <Widget>[
                custombutton("6"),
                custombutton("5"),
                custombutton("4"),
                custombutton("-"),
                ],//Widget
              ),//row
            Row(
              children: <Widget>[
                custombutton("3"),
                custombutton("2"),
                custombutton("1"),
                custombutton("x"),
                ],//Widget
              ),//row
            Row(
              children: <Widget>[
                custombutton("C"),
                custombutton("0"),
                custombutton("="),
                custombutton("/"),
                ],//Widget
              ),//row
            ],//widget
          ),//Column
        ),//Container
    );//Scaffold
  }
}
