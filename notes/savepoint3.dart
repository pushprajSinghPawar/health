// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, unused_element, unused_import, prefer_const_literals_to_create_immutables, avoid_print, must_be_immutable, unused_local_variable
// import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(LandingPage());
}

class Suggestions extends StatefulWidget {
  const Suggestions({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SuggestionsState createState() => _SuggestionsState();
}

class _SuggestionsState extends State<Suggestions> {
  TextEditingController fud = TextEditingController();
  TextEditingController fudres = TextEditingController();

  Future<String?> fetchData(String foodText) async {
    try {
      http.Response response;
      final headers = {'X-Api-Key': 'o0SDOwQIQeyghG1B2n0tRFfNRLCqL6u65yWdrMzx'};
      response = await http.get(Uri.parse('https://api.api-ninjas.com/v1/nutrition?query=$foodText'),headers: headers);
      if (response.statusCode == 200){
        return response.body;
      }else{
        return "SORRY CANNOT FIND YOUR DESIRED RESULT";
      }
    } catch (e) {
      return "SORRY CANNOT FIND YOUR DESIRED RESULT";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextField(
              controller: fud,
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              String? info = await fetchData(fud.text);
              if (info != null) {
                setState(() {
                  fudres.text = info;
                  print(info);
                });
              }
            },
            child: Text('food analyze')
          ),
          SizedBox(
            child: Text(fudres.text),
          ),
        ],
      ),
    );
  }
}


class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Diett"),
          toolbarHeight: 40,
          backgroundColor: Color.fromRGBO(0, 0, 128, 0.7)),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Color.fromRGBO(255, 119, 34, 1),
              child: ListView.builder(
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(5),
                  child: SizedBox(
                    width: 100,
                    child: CircleAvatar(
                      backgroundColor: Colors.cyan,
                    ),
                  ),
                ),
                itemCount: 21,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              color: Color.fromARGB(255, 255, 255, 255),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Inpputer(),
                  CalorieMeter(),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.amber,
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Suggestions(),
                        ),
                      );
                    },
                    child: Text('Go through Suggestions')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);
  final ress = '';
  @override
  State<LandingPage> createState() => _LandingPage();
}

// ignore: must_be_immutable
class _LandingPage extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.transparent,
        body: Homepage(),
      ),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);
  @override
  State<Homepage> createState() => _Homepage();
}

class _Homepage extends State<Homepage> {
  TextEditingController passwordControl = TextEditingController();
  TextEditingController usernameControl = TextEditingController();
  TextEditingController inp = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Backimage(),
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
                  children: <Widget>[
                    Expanded(
                        child: TextField(
                      maxLength: 8,
                      controller: usernameControl,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Username",
                      ),
                    )),
                  ],
                ),
              ),
              SizedBox(
                child: Row(
                  children: <Widget>[
                    // Icon(size: 90, color: Colors.yellow, Icons.key),
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
              ElevatedButton(
                  onPressed: () {
                    String uname = usernameControl.text;
                    String pword = passwordControl.text;
                    if (uname == "lopez" && pword == "brad") {
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Dashboard(),
                          ),
                        );
                      });
                    } else {
                      setState(() {
                        inp.text = 'error';
                      });
                    }
                  },
                  child: Text('Login')),
              ElevatedButton(
                  onPressed: () {}, child: Text('Create an Account')),
              ElevatedButton(
                  onPressed: () {}, child: Text('Forgot my password')),
            ],
          ),
        ),
      ],
    );
  }
}

class Backimage extends StatelessWidget {
  const Backimage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/picone.jpg"),
          fit: BoxFit.cover,
          alignment: Alignment.topLeft,
        ),
      ),
    );
  }
}

class Inpputer extends StatelessWidget {
  const Inpputer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.green,
          width: 2,
        ),
      ),
      child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter Food Item",
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton(
                    onPressed: () {}, child: Icon(Icons.food_bank)),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton(
                    onPressed: () {}, child: Icon(Icons.analytics)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CalorieMeter extends StatefulWidget {
  const CalorieMeter({Key? key}) : super(key: key);
  @override
  State<CalorieMeter> createState() => _CalorieMeter();
}

// ignore: must_be_immutable
class _CalorieMeter extends State<CalorieMeter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blue,
          width: 2,
        ),
      ),
    );
  }
}
