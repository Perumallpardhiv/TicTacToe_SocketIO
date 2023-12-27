import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:socketio_ttt/intro_screens/intro_page2.dart';
import 'package:socketio_ttt/screens/gameWithComp.dart';

class introPage extends StatefulWidget {
  static String routeName = '/introPage';
  const introPage({super.key});

  @override
  State<introPage> createState() => _introPageState();
}

class _introPageState extends State<introPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 120),
                child: Container(
                  child: Text(
                    "TIC TAC TOE",
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 3,
                      fontSize: 35,
                      fontFamily: "font3",
                    ),
                  ),
                ),
              ),
              Container(
                child: AvatarGlow(
                  repeat: true,
                  glowColor: Colors.white,
                  endRadius: 140,
                  startDelay: Duration(seconds: 1),
                  repeatPauseDuration: Duration(seconds: 1),
                  duration: Duration(seconds: 2),
                  child: CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.grey[900],
                    backgroundImage: AssetImage('assets/logo1.png'),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (() {
                  Navigator.of(context).push(
                    PageTransition(
                      child: GamewithComputer(),
                      type: PageTransitionType.scale,
                      childCurrent: widget,
                      alignment: Alignment.centerLeft,
                      duration: Duration(milliseconds: 900),
                      reverseDuration: Duration(milliseconds: 1000),
                    ),
                  );
                }),
                child: Padding(
                  padding: EdgeInsets.only(top: 60, bottom: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "Play With Computer",
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 3,
                          fontSize: 20,
                          fontFamily: "font2",
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (() {
                  Navigator.of(context).push(
                    PageTransition(
                      child: LevelSelect(),
                      type: PageTransitionType.scale,
                      childCurrent: widget,
                      alignment: Alignment.centerRight,
                      duration: Duration(milliseconds: 900),
                      reverseDuration: Duration(milliseconds: 1000),
                    ),
                  );
                }),
                child: Padding(
                  padding: EdgeInsets.only(left: 40, right: 40, bottom: 60),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      color: Colors.white,
                      child: Text(
                        'Play With Friend',
                        style: TextStyle(
                          color: Colors.black,
                          letterSpacing: 3,
                          fontSize: 20,
                          fontFamily: "font2",
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
