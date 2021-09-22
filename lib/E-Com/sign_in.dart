import 'package:e_commerce/E-Com/admin_sign_in.dart';
import 'package:e_commerce/E-Com/design.dart';
import 'package:e_commerce/E-Com/reset_pass.dart';
import 'package:e_commerce/E-Com/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Sign_in extends StatefulWidget {
  @override
  _Sign_inState createState() => _Sign_inState();
}

class _Sign_inState extends State<Sign_in> {
  String _email, _password;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Future<void> SignIn() async {
    final formstate = _formkey.currentState;
    if (formstate.validate()) {
      formstate.save();
      try {
        FirebaseUser user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Design()));
      } catch (e) {
        if(e.message == 'The password is invalid or the user does not have a password.' ||
        e.message == 'Ignoring header X-Firebase-Locale because its value was null.' ||
        e.message == 'We have blocked all requests from this device due to unusual activity. Try again later. [ Access to this account has been temporarily disabled due to many failed login attempts. You can immediately restore it by resetting your password or you can try again later. ]'){
          showDialog(context: context, builder: (BuildContext context) {
            return new AlertDialog(
              title: new Text("Please Enter Valid Password"),
            );
          }
          );
        }

        if(e.message == 'There is no user record corresponding to this identifier. The user may have been deleted.' ||
            e.message == 'Ignoring header X-Firebase-Locale because its value was null.'){
          showDialog(context: context, builder: (BuildContext context) {
            return new AlertDialog(
              title: new Text("Please Enter Valid E-Mail"),
            );
          }
          );
        }
        print(e.message);
      }
    }
  }

  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(left: 115),
          child: Text(
            "Get Started",
            style: TextStyle(
                fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          FlatButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Admin_Sign_In()));
          }, child: Text('An Admin'))
        ],
      ),
      body: Form(
        key: _formkey,
        //scrollDirection: Axis.vertical,
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width * 0.9,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text("Start with signing in"),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                      child: Image(image: AssetImage('assets/images/sign_in_up/sign_in1.png'))),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child:
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "E-Mail",
                      ),
                      onSaved: (input) {
                        setState(() {
                          _email = input;
                        });
                      },
                      // validator: (input) {
                      //   if (input.isEmpty) {
                      //     return "Please Enter Your Email";
                      //   }
                      //   return null;
                      // },
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                  Column(
                    children: [
                      //SizedBox(width: MediaQuery.of(context).size.width*0.2,),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: TextFormField(
                          onSaved: (input){
                            setState(() {
                              _password=input;
                            });
                          },
                          // validator: (input){
                          //   if(input.length<6){
                          //     return "Password is too small";
                          //   }
                          //   return null;
                          // },
                          style: TextStyle(color: Colors.black),
                          obscureText: _obscureText,

                          decoration: InputDecoration(
                              labelText: "Password",
                              suffixIcon: InkWell(
                                //onTap: VisiblePassword,
                                onTap: _toggle,
                                child: _obscureText? Icon(Icons.visibility_off):Icon(Icons.visibility),
                              ),
                              labelStyle: TextStyle(color: Colors.black)
                          ),
                        ),
                      )
                    ],
                  ),
                  // SizedBox(
                  //   height: MediaQuery.of(context).size.height * 0.03,
                  // ),

                  Padding(
                    padding: const EdgeInsets.only(left: 200.0),
                    child: FlatButton(
                        onPressed: () {
                          setState(() {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> ResetScreen()));
                          });
                        },
                        child: Text("Forget Password",
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        )),
                  ),



                  FlatButton(
                      color: Color(0xFFb7bdb9),
                      minWidth: MediaQuery.of(context).size.width * 0.5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      onPressed: () {
                        setState(() {
                          SignIn();
                          if(_email.isEmpty){
                            showDialog(context: context, builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Please Enter an Email"),
                              );});
                          }
                          else if(_password.isEmpty){
                            showDialog(context: context, builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Please Enter an Password"),
                              );});
                          }
                          // else{
                          //   showDialog(context: context, builder: (BuildContext context) {
                          //     return AlertDialog(
                          //       title: Text("Please Enter an Valid Password"),
                          //     );});
                          // }
                        });
                      },
                      child: Text("Sign In")),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Text("Don't have an Account?"),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  FlatButton(
                      color: Color(0xFFb7bdb9),
                      minWidth: MediaQuery.of(context).size.width * 0.5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      onPressed: () {
                        // if(_email.isEmpty && _password.isEmpty || _email.isEmpty || _password.isEmpty){
                        // _showDeleteDialog() {
                        //   showDialog(
                        //       context: context,
                        //       builder: (context) {
                        //         return AlertDialog(
                        //           title: Text('Delete'),
                        //           content: Text('Are you sure want to delete?'),
                        //           actions: [
                        //             FlatButton(
                        //                 onPressed: () {
                        //                   Navigator.pop(context);
                        //                 },
                        //                 child: Text('Ok')),
                        //           ],
                        //         );
                        //       });
                        // }}
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Sign_up()));
                      },
                      child: Text("Sign Up",style: TextStyle(color: Colors.black),))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
