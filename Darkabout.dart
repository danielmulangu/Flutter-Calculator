import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Dark.dart';
import 'main.dart';

class DarkAboutScreen extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return MaterialApp(
      theme: ThemeData.dark(

      ),
      home: MyDarkAboutPage(title: 'About'),
    );
  }
}

class MyDarkAboutPage extends StatefulWidget {
  MyDarkAboutPage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _MyDarkAboutPageState createState() => _MyDarkAboutPageState();
}

class _MyDarkAboutPageState extends State<MyDarkAboutPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        leading: GestureDetector(
            onTap:() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder:(context)
                      {return MaterialApp(
                        title: 'About',
                        theme: ThemeData(
                          primarySwatch: Colors.purple,
                          visualDensity: VisualDensity.adaptivePlatformDensity,
                        ),

                        home: DarkCalculator(),

                      );;} ) );
            },
            child: Icon(Icons.arrow_back_ios,)
        ),
      ),

      body:
      Column(
        children: <Widget>[
          Text(
              "Test by Me!!!!!"
          ),
        ],
      ),
    );
  }
}
