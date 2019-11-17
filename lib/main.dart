import 'package:dzikir_pagi_petang/TampilanAbout.dart';
import 'package:dzikir_pagi_petang/TampilanPagi.dart';
import 'package:dzikir_pagi_petang/TampilanPetang.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.white,
          canvasColor: Colors.white,
          appBarTheme: AppBarTheme(color: Colors.white, elevation: 0)),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(icon: Icon(Icons.info_outline), onPressed: () {
            openNewScreen(context, TampilanAbout());
          }),

          SizedBox(
            width: 20.0,
          )
        ],
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Text("Dzikir", style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),),
        ),
            Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Text("Pagi & Petang",
                    style: TextStyle(
                        fontSize: 30.0, fontWeight: FontWeight.w400))),
            SizedBox(
              height: 20.0,
            ),
            GestureDetector(
              onTap: () {
                openNewScreen(context,TampilanPagi());
              },
              child: Container(
                decoration: BoxDecoration(
                  boxShadow:<BoxShadow>[
                  BoxShadow(
                      color: Colors.black,
                      blurRadius: 500,
                      spreadRadius: 0.1,
                      offset: Offset(0.0, 0.75)),
                ],
                ),
                color: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
                height: 250.0,
                child: Stack(
                  children: <Widget>[
                    backgroundImage("https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTvYmKJPnmIrvK_CDDdvthIJyuSJAY9bS32o0ky-RYW8s9W1FZs"),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Pagi",
                          style: teksWaktuDoa,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                openNewScreen(context, TampilanPetang());
              },
              child: Container(
                color: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
                height: 250.0,
                child: Stack(
                  children: <Widget>[
                    backgroundImage("https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTCTkl8XbXURFcqqW19sJg0vjJbWLl_QiEEhTl67iEiiAcdpg0H"),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Petang",
                          style: teksWaktuDoa,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  var teksWaktuDoa = TextStyle(
      fontSize: 35.0,
      color: Colors.white,
      fontFamily: 'arial',
      fontWeight: FontWeight.bold);

  Widget backgroundImage(String imageURL) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.darken),
              image: NetworkImage(imageURL))),
    );
  }


  void openNewScreen(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }
}
