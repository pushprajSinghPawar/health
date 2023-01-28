// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, unused_element, unused_import, prefer_const_literals_to_create_immutables, avoid_print, must_be_immutable, unused_local_variable, unnecessary_null_comparison, avoid_unnecessary_containers
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
  List<dynamic> info = [];

  Future<List<dynamic>> fetchData(String foodText) async {
    http.Response response;
    final head = {'X-Api-Key': 'o0SDOwQIQeyghG1B2n0tRFfNRLCqL6u65yWdrMzx'};
    response = await http.get(
        Uri.parse('https://api.api-ninjas.com/v1/nutrition?query=$foodText'),
        headers: head);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return [];
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
                info = await fetchData(fud.text);
                if (info != null) {
                  setState(() {
                    // info = info.

                    print(info);
                    print(info[0]["name"]);
                    print(info[0]["serving_size_g"]);
                    print(info[0]["calories"]);
                    print(info[0]["protein_g"]);
                    print(info[0]["carbohydrates_total_g"]);
                    print(info[0]["fat_total_g"]);
                    print(info[0]["suagr_g"]);
                    print(info[0]["cholesterol_mg"]);
                    // print(info[0][""])
                  });
                }
              },
              child: Text('food analyze')),
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: Container(
              // width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  border: Border.all(
                color: Colors.black,
                width: 2,
              )),
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                      columnSpacing: 15,
                      columns: [
                        DataColumn(label: Text('Name')),
                        DataColumn(label: Text('Serving ')),
                        DataColumn(label: Text('Calories')),
                        DataColumn(label: Text('Protein Content')),
                        DataColumn(label: Text('Carbohydrate content')),
                        DataColumn(label: Text('Fat Content')),
                        DataColumn(label: Text('Sugar content')),
                        DataColumn(label: Text('Cholestrol content')),
                      ],
                      rows: info
                          .map((e) => DataRow(cells: [
                                DataCell(Text(e['name'].toString())),
                                DataCell(Text(e['serving_size_g'].toString())),
                                DataCell(Text(e['calories'].toString())),
                                DataCell(Text(e['protein_g'].toString())),
                                DataCell(Text(
                                    e['carbohydrates_total_g'].toString())),
                                DataCell(Text(e['fat_total_g'].toString())),
                                DataCell(Text(e['sugar_g'].toString())),
                                DataCell(Text(e['cholesterol_mg'].toString())),
                              ]))
                          .toList()),
                ),
              ),
            ),
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
  TextEditingController lpFood = TextEditingController();
  List<dynamic> info = [];

  Future<List<dynamic>> fetchData(String foodText) async {
    http.Response response;
    final head = {'X-Api-Key': 'o0SDOwQIQeyghG1B2n0tRFfNRLCqL6u65yWdrMzx'};
    response = await http.get(
        Uri.parse('https://api.api-ninjas.com/v1/nutrition?query=$foodText'),
        headers: head);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Diett"),
          toolbarHeight: 40,
          backgroundColor: Color.fromRGBO(0, 0, 128, 0.7)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: const Color(0xffeeee00),
              height: 100.0,
              alignment: Alignment.center,
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Color.fromARGB(255, 255, 255, 255),
                alignment: Alignment.center,
                child: TextField(
                  controller: lpFood,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter Food Item",
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Color.fromARGB(255, 255, 255, 255),
                alignment: Alignment.center,
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width/5,
                      child: ElevatedButton(
                          onPressed: () async {
                            info = await fetchData(lpFood.text);
                            if (info != null) {
                              setState(() {});
                            }
                          },
                          child: Icon(Icons.analytics)),
                    ),

                    SizedBox(
                      width: MediaQuery.of(context).size.width/10,
                    ),

                    SizedBox(
                      width: MediaQuery.of(context).size.width/5,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Icon(Icons.food_bank),
                      ),
                    ),

                    SizedBox(
                      width: MediaQuery.of(context).size.width/10,
                    ),

                    SizedBox(
                      width: MediaQuery.of(context).size.width/5,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            lpFood.clear();
                          });
                        },
                        child: Icon(Icons.clear)
                      ),
                      
                    ),
                  ],
                ),
              ),
            ),

            
            Container(
              color: Color.fromARGB(255, 255, 255, 255),
              // height: 2000,
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  // width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Colors.black,
                    width: 2,
                  )),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                        columnSpacing: 15,
                        columns: [
                          DataColumn(label: Text('Name')),
                          DataColumn(label: Text('Serving ')),
                          DataColumn(label: Text('Calories')),
                          DataColumn(label: Text('Protein Content')),
                          DataColumn(label: Text('Carbohydrate content')),
                          DataColumn(label: Text('Fat Content')),
                          DataColumn(label: Text('Sugar content')),
                          DataColumn(label: Text('Cholestrol content')),
                        ],
                        rows: info.map((e) => DataRow(cells: [
                          DataCell(Text(e['name'].toString())),
                          DataCell(Text(e['serving_size_g'].toString())),
                          DataCell(Text(e['calories'].toString())),
                          DataCell(Text(e['protein_g'].toString())),
                          DataCell(Text(e['carbohydrates_total_g'].toString())),
                          DataCell(Text(e['fat_total_g'].toString())),
                          DataCell(Text(e['sugar_g'].toString())),
                         DataCell(Text(e['cholesterol_mg'].toString())),
                        ])).toList()),
                    ),
                ),
              ),
            ),
            
            SizedBox(
              width: MediaQuery.of(context).size.width/2,
              child:ElevatedButton(onPressed: (){
                setState(() {
                  info.clear();
                });
              },child: Text('Clear Table')),
            ),


            Container(
              height: 1000,
            ),

          ],
        ),
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
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              // controller: lpFood,
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
