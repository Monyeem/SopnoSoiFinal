import 'package:e_commerce/E-Com/all_pages.dart';
import 'package:e_commerce/E-Com/profile.dart';
import 'package:flutter/material.dart';

import 'cart.dart';

class Design extends StatefulWidget {
  @override
  _DesignState createState() => _DesignState();
}

class _DesignState extends State<Design> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.78,
              child: TextFormField(
                cursorColor: Colors.black,
                //style: TextStyle(color: Colors.red),
                decoration: InputDecoration(
                  //hoverColor: Colors.black,
                  isDense: true,
                  contentPadding: EdgeInsets.all(15),
                  fillColor: Colors.black,
                  prefixIcon: Icon(Icons.search,size: 30,color:  Colors.purpleAccent,),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(color: Colors.black26, width: 3.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: Colors.black26,
                      width: 3.0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.height * 0.01,
            ),
            Container(
              decoration: BoxDecoration(
                  color:  Colors.purpleAccent,
                  border: Border.all(color:  Colors.purpleAccent, width: 4),
                  borderRadius: BorderRadius.circular(20)),
              child: Icon(
                Icons.camera_alt_outlined,
                color: Colors.white,
                size: 30,
              ),
            )
          ],
        ),
      ),



      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.8,
          width: MediaQuery.of(context).size.width,
          color: Colors.purpleAccent,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 25),
                child: Text(
                  'Categories',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Column(
                      children: [
                        FlatButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>All_Pages('Women')));
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border:
                                  Border.all(color: Colors.white, width: 15),
                                  borderRadius: BorderRadius.circular(80)),
                              child: Image(
                                  image: AssetImage('assets/images/design/woman.png'),
                                  width: 30,
                                  height: 30,
                                  fit: BoxFit.fill)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Text(
                          'Women',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        FlatButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>All_Pages('Men')));
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border:
                                  Border.all(color: Colors.white, width: 15),
                                  borderRadius: BorderRadius.circular(80)),
                              child: Image(
                                  image: AssetImage('assets/images/design/men.png'),
                                  width: 30,
                                  height: 30,
                                  fit: BoxFit.fill)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Text(
                          'Men',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        FlatButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>All_Pages('Devices')));
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border:
                                  Border.all(color: Colors.white, width: 15),
                                  borderRadius: BorderRadius.circular(80)),
                              child: Image(
                                  image: AssetImage('assets/images/design/devices.png'),
                                  width: 30,
                                  height: 30,
                                  fit: BoxFit.fill)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Text(
                          'Devices',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        FlatButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>All_Pages('Gadgets')));
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border:
                                  Border.all(color: Colors.white, width: 15),
                                  borderRadius: BorderRadius.circular(80)),
                              child: Image(
                                  image: AssetImage('assets/images/design/Gadgets.png'),
                                  width: 30,
                                  height: 30,
                                  fit: BoxFit.fill)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Text(
                          'Gadgets',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        FlatButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>All_Pages('Games')));
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border:
                                  Border.all(color: Colors.white, width: 15),
                                  borderRadius: BorderRadius.circular(80)),
                              child: Image(
                                  image: AssetImage('assets/images/design/games.png'),
                                  width: 30,
                                  height: 30,
                                  fit: BoxFit.fill)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Text(
                          'Games',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 25),
                child: Row(
                  children: [
                    Text(
                      'Best Selling',
                      style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.w600),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.56,),
                    Text('See all',style: TextStyle(color: Colors.white,fontSize: 15,),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10,top: 20),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(
                          elevation: 20,
                          color: Colors.white,
                          //BoxDecoration(color: Colors.black)
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15),),
                              side: BorderSide(color: Colors.black)
                          ),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.35,
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: Image(image: AssetImage('assets/images/design/xyz.png')),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10,top: 5,),
                          child: Text('XYZ earphone',style: TextStyle(
                              color: Colors.white
                          ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10,top: 5,),
                          child: Text('XION',style: TextStyle(color: Colors.white),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10,top: 5,),
                          child: Text('2400',style: TextStyle(color: Colors.white),),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(
                          elevation: 20,
                          color: Colors.white,
                          //BoxDecoration(color: Colors.black)
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15),),
                              side: BorderSide(color: Colors.black)
                          ),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.35,
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: Image(image: AssetImage('assets/images/design/watch.png'),),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10,top: 5,),
                          child: Text('ABC smartwatch',style: TextStyle(color: Colors.white),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10,top: 5,),
                          child: Text('XION',style: TextStyle(color: Colors.white),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10,top: 5,),
                          child: Text('2400',style: TextStyle(color: Colors.white),),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              // Text('XYZ earphone'),
              // Text('XION'),
              // Text('2400')
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.06,
        color: Colors.white,
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.03,
            ),
            FlatButton(
                onPressed: () {},
                child: Text(
                  'Explore',
                  style: TextStyle(color: Color(0xFFfca903)),
                )),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.15,
            ),
            FlatButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart()));
                },
                child: Icon(
                  Icons.add_shopping_cart,
                  color: Color(0xFFfca903),
                )),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.08,
            ),
            FlatButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile()));
                },
                child: Icon(
                  Icons.perm_identity_outlined,
                  color: Color(0xFFfca903),
                )),
          ],
        ),
      ),
    );
  }
}
