import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const GuessNumberApp());
}

class GuessNumberApp extends StatelessWidget {
  const GuessNumberApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  String buttonText='Guess';
 CreateAlertDialog(BuildContext context, String message) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text("You guessed right"),
            content: Text(message),
              actions: <Widget> [TextButton(
                child: const Text('Try again'),
                onPressed: () {
                  Navigator.pop(context);
                  randomNumber=Random().nextInt(101);
                  _controller.clear();
                },
              ),
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                  _controller.clear();
                  randomNumber=Random().nextInt(101);
                  buttonText='Reset';
                },
              )],
          );
        });
  }

  String text1='';
  String text2='';
  int randomNumber=Random().nextInt(101);
  int? generateRandom() {
    Random random = new Random();
    int randomNumber = random.nextInt(101);
    return randomNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Scaffold(
            appBar:
                AppBar(title: const Text("Guess my number"), centerTitle: true),
            body: Column(children: <Widget>[
              Container(
                padding: const EdgeInsets.only(left: 12, right: 9, top: 12),
                //cum fac spatiu mai mare la margini
                child: const Text(
                  "I'm thinking of a number between 1 and 100.",
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 12, right: 9, top: 12),
                child: const Text(
                  "It's your turn to guess my number!",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),Text(text1,style:TextStyle(fontSize:48,color:Colors.grey,),textAlign: TextAlign.center,),Text(text2,style:TextStyle(fontSize:48,color:Colors.grey,),textAlign: TextAlign.center,),
              Container(
                padding: EdgeInsets.only(top: 16, left: 8, right: 8),
                child: Card(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    children: <Widget>[
                      Text("Try a number!",
                          style: TextStyle(fontSize: 30, color: Colors.grey),
                          textAlign: TextAlign.center),
                      Container(
                        padding: EdgeInsets.only(
                            left: 16, right: 16, bottom: 16, top: 16),
                        child: TextField(
                          controller: _controller,
                          keyboardType: TextInputType.number,
                        ),
                      )
                      ,Container(
                          padding: EdgeInsets.only(bottom: 32),
                          child: Builder(builder: (context) {
                            return ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.white54,
                                    onPrimary: Colors.black),
                                onPressed: () {
                                  final bool valid =
                                      Form.of(context)!.validate();
                                  int ok = 1;

                                  //while (ok == 1) {
                                    //if (valid) {
                                      final int userinput =
                                      int.parse(_controller.text);
                                      setState(() {
                                          // if(buttonText=='Reset')
                                          //    buttonText='Guess';

                                        if (userinput < randomNumber)

                                          {buttonText='Guess';
                                            text1 = "You tried $userinput";
                                             text2= "Try higher!";
                                              }
                                        else
                                          if(userinput==randomNumber)
                                            {text1 = "You tried $userinput";
                                            text2= "You guessed right!";
                                            CreateAlertDialog(context, "It was $randomNumber");


                                            }
                                          else
                                            if(userinput>randomNumber)
                                            {text1 = "You tried $userinput";
                                            text2= "Try lower!";}


                                      });

                                    //}
                                  //}
                                },
                                child: Text(buttonText));
                          }))
                    ],
                  ),
                )),
              )
              ])));
  }
}
