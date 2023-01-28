
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';


void main() {
  runApp(LandingPage());
}
class LandingPage extends StatefulWidget{
  const LandingPage({Key? key}) : super(key: key);
  final ress='';
  @override
  State<LandingPage> createState() => _LandingPage();

}
// ignore: must_be_immutable
class _LandingPage extends State<LandingPage>{
  TextEditingController passwordControl = TextEditingController();
  TextEditingController usernameControl = TextEditingController();
  TextEditingController inp  = TextEditingController();
  // LandingPage({Key? key}) : super(key: key);
  @override 
  Widget build (BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/picone.jpg"),
                  fit: BoxFit.cover,
                  alignment: Alignment.topLeft,
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: ListView(
                padding: const EdgeInsets.all(15),
                children: <Widget>[
                  SizedBox(
                    height: 100,
                  ),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  <Widget>[
                        Icon(
                          size:90,
                          color : Colors.yellow,
                          Icons.person_outline,
                        ),
                        Expanded(
                          child: TextField(
                            maxLength: 8,
                            controller: usernameControl,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Username",
                            ),
                        )
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Row(
                      children:  <Widget>[
                        Icon(
                          size:90,
                          color : Colors.yellow,
                          Icons.key
                        ),
                        Expanded(
                          child: TextField(
                            obscureText: true,
                            maxLength: 10,
                            controller: passwordControl,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Password",
                            ),
                        )),
                      ],
                    ),
                  ),
                  ElevatedButton(onPressed: (){
                    String uname  = usernameControl.text;
                    String pword = passwordControl.text;
                    if(uname == "lopez" && pword == "brad"){
                      setState(() {
                        inp.text = 'sucess';
                      });
                    }
                    else{
                      setState(() {
                        inp.text = 'error';
                      });
                    }
                  }, child: Text('Login')),
                  ElevatedButton(onPressed: (){}, child: Text('Create an Account')),
                  ElevatedButton(onPressed: (){}, child: Text('Forgot my password')),
                  SizedBox(
                    height: 100,
                    child: Text(inp.text),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

