import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.black,
          Color.fromARGB(255, 46, 46, 46),
        ], begin: Alignment.bottomLeft, end: Alignment.topRight)),
        child: Column(children: [
          Container(padding: EdgeInsets.only(left: 20),
            alignment: Alignment.centerLeft,
            height: 100,
        width: MediaQuery.of(context).size.width,
            child: Positioned(
              top: 25,
              left: 250,
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Icon(Icons.close,color: Colors.pink,))),
          ),
          Padding(
              padding: EdgeInsets.only(top: 50),
              child: SvgPicture.asset("assets/logo.svg")),
          Container(
            margin: EdgeInsets.only(left: 10, top: 30),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text("About",
                      style: TextStyle(color: Colors.grey, fontSize: 26)),
                ),
                Container(
                  margin: EdgeInsets.only(top: 25, left: 15, right: 35),
                  alignment: Alignment.centerLeft,
                  child: Text(
                      "Interpreting everything about women’s safety apps in one line will look something like it is a solution that helps ensure the women’s safety when they are out of their homes and might face any kind of endangered situation. Different apps perform the purpose in their respective ways, and some send an alarm to friends and relatives while others inform the police. Many apps follow the principle “prevention is better than cure” and thus, they talk about the safest routes one can take to reach home or destination.",
                      style: TextStyle(color: Colors.grey, fontSize: 13)),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
