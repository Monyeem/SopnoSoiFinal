import 'package:e_commerce/E-Com/otp_verification.dart';
import 'package:e_commerce/E-Com/sign_in.dart';
import 'package:e_commerce/E-Com/user_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:email_auth/email_auth.dart';

class Sign_up extends StatefulWidget {
  @override
  _Sign_upState createState() => _Sign_upState();
}

class _Sign_upState extends State<Sign_up> {

  String _password,_repassword;
  var count = 0;

  final TextEditingController _emailController = TextEditingController();
  //final TextEditingController _otpController = TextEditingController();

  void sendOTP() async {
    EmailAuth.sessionName = 'Sopno Soi';
    var res = await EmailAuth.sendOtp(receiverMail: _emailController.text);
    if(res){
      print('Sent OTP Successfully');
    }else{
      showDialog(context: context, builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text("Please Enter Valid E-Mail"),
        );
      }
      );
    }
  }

  // void verifyOTP()async{
  //   var res = EmailAuth.validate(receiverMail: _emailController.text, userOTP: _otpController.text);
  //   if(res){
  //     count ++;
  //   }else{
  //     showDialog(context: context, builder: (BuildContext context) {
  //       return new AlertDialog(
  //         title: new Text("Invalid OTP"),
  //         content: new Text("Please Type Valid OTP"),
  //       );
  //     }
  //     );
  //   }
  // }

  final GlobalKey<FormState> _cformkey=GlobalKey<FormState>();
  Future<void> Sign_Up()async{
    final cformkey=_cformkey.currentState;
    if(cformkey.validate()){
      cformkey.save();
      try {
        if (_password == _repassword
            && _password.length >= 6) {
          FirebaseUser newuser = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
              email: _emailController.text, password: _password);
          print(count);
          Navigator.push(context, MaterialPageRoute(builder: (context)=>OTP_Verification(_emailController.text)));
        }
        else if (_password != _repassword) {
          showDialog(context: context, builder: (BuildContext context) {
            return new AlertDialog(
              title: new Text("Please Enter Same Password"),
            );
          }
          );
        }
        else if (_password.length < 6) {
          showDialog(context: context, builder: (BuildContext context) {
            return new AlertDialog(
              title: new Text("Your Password is too Short"),
              content: Text('Please Enter Password More Than 5 Character'),
            );
          }
          );
        }
      }
      catch(e){
        print(e.message);
        if(e.message == 'The email address is already in use by another account.'){
          showDialog(context: context, builder: (BuildContext context) {
            return new AlertDialog(
              title: new Text("The E-Mail Address is Already in Use"),
            );
          }
          );
        }
      }
    }
  }

  bool hidenpass = true;
  void _togglePassView(){
    setState(() {
      hidenpass = !hidenpass;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Stay With Sign Up",
          style: TextStyle(fontSize: 25, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image(image: AssetImage('assets/images/sign_in_up/sign_up.png')),
              Padding(
                padding: const EdgeInsets.only(left: 30,right: 30),
                child: TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      hintText: "E-Mail",
                      // suffixIcon: FlatButton(
                      //   child: Text("Send OTP"),
                      //   onPressed: (){
                      //     sendOTP();
                      //     showDialog(context: context, builder: (BuildContext context) {
                      //       return new AlertDialog(
                      //         title: new Text("Please Check Your E-Mail & Type Your OTP"),
                      //       );
                      //     }
                      //     );
                      //   },
                      // )
                  ),
                  validator: (input){
                    if(input.isEmpty){
                      return "Please Enter an E-Mail";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.04,),
              // Padding(
              //   padding: const EdgeInsets.only(left: 30,right: 30),
              //   child: TextFormField(
              //     controller: _otpController,
              //     //obscureText: hidenpass,
              //     decoration: InputDecoration(
              //         hintText: "Type 6 digit OTP",
              //       labelText: "OTP"
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.06,
              // ),
              // FlatButton(
              //   color: Color(0xFF0fa7d6),
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(20)),
              //   child: Text("Verify OTP"),
              //   onPressed: (){
              //     verifyOTP();
              //   },
              // ),
              Form(
                key: _cformkey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30,right: 30),
                      child: TextFormField(
                        obscureText: hidenpass,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: "Please Enter Password more than 5",
                          suffixIcon: InkWell(
                            //onTap: VisiblePassword,
                            onTap: _togglePassView,
                            child: hidenpass? Icon(Icons.visibility_off):Icon(Icons.visibility),
                          ),
                        ),
                        onSaved: (input){
                          setState(() {
                            _password=input;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.04,),
                    Padding(
                      padding: const EdgeInsets.only(left: 30,right: 30),
                      child: TextFormField(
                        obscureText: hidenpass,
                        decoration: InputDecoration(
                          labelText: 'Re-Type Password',
                          hintText: "Please Enter Password more than 5",
                          suffixIcon: InkWell(
                            //onTap: VisiblePassword,
                            onTap: _togglePassView,
                            child: hidenpass? Icon(Icons.visibility_off):Icon(Icons.visibility),
                          ),
                        ),
                        onSaved: (input){
                          setState(() {
                            _repassword=input;
                          });
                        },
                        // validator: (input) {
                        //   if (input.length<6) {
                        //     showDialog(context: context, builder: (BuildContext context) {
                        //       return new AlertDialog(
                        //         title: new Text("Your Password is too Small"),
                        //         content: Text('Enter Password more than 5'),
                        //       );
                        //     }
                        //     );
                        //   }
                        //   return null;
                        // },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.04,),
              FlatButton(
                color: Color(0xFF0fa7d6),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Text("Create Account"),
                onPressed: (){
                  Sign_Up();
                  sendOTP();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
