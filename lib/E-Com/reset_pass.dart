import 'package:e_commerce/E-Com/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class ResetScreen extends StatefulWidget {
  @override
  _ResetScreenState createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  String _email;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFFAF38),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top:100.0,left: 20),
              child: IconButton(
                  icon: Icon(Icons.arrow_back_ios_sharp),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Sign_in()));
                  }
              ),
            ),

            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20.0,right: 20,left: 20),
                child: SingleChildScrollView(
                  child: Container(
                    height: 450,
                    width: 500,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0XFFFF9900),
                    ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, bottom: 20),
                          child: Text("Reset Password",
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text("Enter your e-mail",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: TextField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: "Email",
                              hintStyle: TextStyle(fontSize: 15.0, color: Colors.white),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                _email = value.trim();
                              });
                            },
                          ),
                        ),



                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: FlatButton(
                              minWidth: 300,
                              height: 50,
                              onPressed: () {
                                auth.sendPasswordResetEmail(email: _email);
                                showDialog(context: context, builder: (BuildContext context) {
                                  return new AlertDialog(
                                    title: new Text("Message"),
                                    content: new Text("Check your email"),
                                    actions: [
                                      FlatButton(
                                        onPressed: (){

                                          Navigator.push(context, MaterialPageRoute(builder: (context) => Sign_in()));

                                        },
                                        child: Text("OK"),
                                      ),
                                    ],
                                    scrollable: true,
                                  );
                                });
                              },
                              child: Text("Reset ",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                              color: Colors.white,
                              splashColor: Colors.grey,
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),


          ],
        ),


      ),


      // Column(
      //   children: [
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: TextField(
      //         keyboardType: TextInputType.emailAddress,
      //         decoration: InputDecoration(
      //             hintText: 'Email'
      //         ),
      //         onChanged: (value) {
      //           setState(() {
      //             _email = value.trim();
      //           });
      //         },
      //       ),
      //     ),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [
      //         RaisedButton(
      //           child: Text('Send Request'),
      //           onPressed: () {
      //             auth.sendPasswordResetEmail(email: _email);
      //             Navigator.of(context).pop();
      //           },
      //           color: Theme.of(context).accentColor,
      //         ),
      //
      //       ],
      //     ),
      //
      //   ],),
    );
  }
}