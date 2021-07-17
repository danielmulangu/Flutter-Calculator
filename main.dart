import 'package:flutter/material.dart';
import 'package:gbcalc_app/Dark.dart';
import 'About.dart';
import 'Darkabout.dart';

void main()
{
  runApp(Calculator());
}

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Daniel Calculator',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: Calc(),
    );
  }
}
class Calc extends StatefulWidget {
  @override
  _CalcState createState() => _CalcState();
}

class _CalcState extends State<Calc> {

  String equation = "0";
  String result ="0";
  String expression ="0";
  double num1=0.0;
  double num2=0.0;
  double equationSize=38.0;
  double resultFontSize= 48.0;
  buttonPressed(String buttonText){
    setState(() {
      if(buttonText == "C")
      {
        equation="0";
        result="0";
        equationSize=38.0;
        resultFontSize= 48.0;
      }else if( buttonText == "⌫")
      {
        equationSize=38.0;
        resultFontSize= 48.0;
        equation=equation.substring(0, equation.length-1);
        if(equation == ""){ equation="0";}
      }else if( buttonText == "=")
      {
        num2= double.parse(equation);
        if(expression =="+"){result =(num1 + num2).toString();}
        if(expression =="-"){result =(num1 - num2).toString();}
        if(expression =="X"){result =(num1 * num2).toString();}
        if(expression =="/"){result =(num1 / num2).toString();}
        num1=0.0;
        num2=0.0;
        expression="";
        equation= result;
        equationSize=38.0;
        resultFontSize= 48.0;
      }else if(buttonText == "+/-")
      {
        if(equation != '0'){ equation=(equation.contains('-') ? equation.substring(1):'-' +equation );}
      }else if(buttonText =="%"){  equation = (double.parse(equation) / 100).toString();}
       else if(buttonText =="+" ||buttonText=="-" ||buttonText == "X"|| buttonText=="/")
          {
         num1= double.parse(equation); expression= buttonText; equation="0";
          }else if(buttonText ==".")
            {
              if(equation.contains(".")){print("Already Contains a decimal");return;}
              else {equation= equation+buttonText;}
            }
      else
      { equationSize=38.0;
      resultFontSize= 48.0;
      if(equation=="0"){ equation= buttonText; return;}
      equation= equation +buttonText;
      }
    }
    );

  }

  Widget buildButton(String buttonText, double buttonHeight, Color buttonColor)
  {
    return Container(
      height: MediaQuery.of(context).size.height *0.1*buttonHeight,
      color: buttonColor,
      child: FlatButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular( 0),
              side: BorderSide(color: Colors.white, width: 1, style: BorderStyle.solid)
          ),
          padding: EdgeInsets.all(16.0),
          onPressed: ()=> buttonPressed(buttonText),
          child: Text(
            buttonText,
            style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.normal,
                color: Colors.white
            ),
          )
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('gbCalculator'
           ),
        ),

      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 170,
              color: Colors.purpleAccent,
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 10.0),),
                  SizedBox(height: 20.0,),

                  Text("Calculator",
                    style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat'
                    ),
                  ),

                ],
              ),
            ),
              ListTile(
                title: Text("About Us"),
                 onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder:(context)
                    {return AboutScreen();} ) );
                          },
              ),
            ListTile(
              title: Text("Dark Theme"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder:(context)
                        {return DarkCalculator();} ) );
              },
            ),
          ],
        ),


      ),



      body: Column(
        children: <Widget>[
          Container(

            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(equation,style: TextStyle(fontSize: equationSize),),
          ),

          Container(

            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: Text(result,style: TextStyle(fontSize: resultFontSize),),
          ),

          Expanded(
            child: Divider(),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width *.75,
                child: Table(
                  children: [
                    TableRow(
                        children: [
                          buildButton("C", 1, Colors.redAccent),
                          buildButton("+/-", 1, Colors.indigo),
                          buildButton("⌫", 1, Colors.indigo),
                        ]
                    ),

                    TableRow(
                        children: [
                          buildButton("(", 1, Colors.indigo),
                          buildButton(")", 1, Colors.indigo),
                          buildButton("%", 1, Colors.indigo),
                        ]
                    ),
                    TableRow(
                        children: [
                          buildButton("7", 1, Colors.grey),
                          buildButton("8", 1, Colors.grey),
                          buildButton("9", 1, Colors.grey),
                        ]
                    ),

                    TableRow(
                        children: [
                          buildButton("4", 1, Colors.grey),
                          buildButton("5", 1, Colors.grey),
                          buildButton("6", 1, Colors.grey),
                        ]
                    ),

                    TableRow(
                        children: [
                          buildButton("1", 1, Colors.grey),
                          buildButton("2", 1, Colors.grey),
                          buildButton("3", 1, Colors.grey),
                        ]
                    ),

                    TableRow(
                        children: [
                          buildButton(".", 1, Colors.grey),
                          buildButton("0", 1, Colors.grey),
                          buildButton("00", 1, Colors.grey),
                        ]
                    ),
                  ],
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width *0.25,
                child:Table(
                  children: [
                    TableRow(
                        children: [
                          buildButton("+", 1, Colors.deepOrangeAccent),
                        ]
                    ),

                    TableRow(
                        children: [
                          buildButton("-", 1, Colors.deepOrangeAccent),
                        ]
                    ),

                    TableRow(
                        children: [
                          buildButton("X", 1, Colors.deepOrangeAccent),
                        ]
                    ),

                    TableRow(
                        children: [
                          buildButton("/", 1, Colors.deepOrangeAccent),
                        ]
                    ),

                    TableRow(
                        children: [
                          buildButton("=", 2, Colors.red),
                        ]
                    ),

                  ] ,
                ) ,
              )
            ],
          ),
        ],
      ),
    );
  }
}
