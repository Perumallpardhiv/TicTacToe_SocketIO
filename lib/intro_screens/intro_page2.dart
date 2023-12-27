import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:socketio_ttt/screens/gameNearByPlayer.dart';
import 'package:socketio_ttt/screens/menu.dart';

class LevelSelect extends StatefulWidget {
  const LevelSelect({super.key});

  @override
  State<LevelSelect> createState() => _LevelSelectState();
}

class _LevelSelectState extends State<LevelSelect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                "Select  Level",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: "font3",
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      PageTransition(
                        child: gameNearby(),
                        type: PageTransitionType.rotate,
                        childCurrent: widget,
                        alignment: Alignment.topLeft,
                        duration: Duration(milliseconds: 900),
                        reverseDuration: Duration(milliseconds: 1000),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 4,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 150,
                      width: 150,
                      child: Center(
                        child: Text(
                          "Play with\nnearby player",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: "font4",
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      PageTransition(
                        child: Menu(),
                        type: PageTransitionType.rotate,
                        childCurrent: widget,
                        alignment: Alignment.topRight,
                        duration: Duration(milliseconds: 900),
                        reverseDuration: Duration(milliseconds: 1000),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 4,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 150,
                      width: 150,
                      child: Center(
                        child: Text(
                          "Play with\nfaraway player",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: "font4",
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
