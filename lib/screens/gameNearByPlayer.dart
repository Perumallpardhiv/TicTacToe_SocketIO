import 'package:flutter/material.dart';

class gameNearby extends StatefulWidget {
  const gameNearby({super.key});

  @override
  State<gameNearby> createState() => _gameNearbyState();
}

class _gameNearbyState extends State<gameNearby> {
  bool player1 = true;
  int Xscore = 0;
  int Oscore = 0;
  List<String> letter = ["", "", "", "", "", "", "", "", ""];

  void checkWinner() {
    if (letter[0] == letter[1] && letter[0] == letter[2] && letter[0] != "") {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("WINNER IS : ${letter[0]}"),
            actions: [
              MaterialButton(
                child: const Text("Play Again!"),
                onPressed: () {
                  setState(() {
                    for (int i = 0; i < 9; i++) {
                      letter[i] = '';
                    }
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );

      if (letter[0] == 'X') {
        Xscore++;
      } else {
        Oscore++;
      }
    } else if (letter[3] == letter[4] &&
        letter[3] == letter[5] &&
        letter[3] != "") {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("WINNER IS : ${letter[3]}"),
            actions: [
              MaterialButton(
                child: const Text("Play Again!"),
                onPressed: () {
                  setState(() {
                    for (int i = 0; i < 9; i++) {
                      letter[i] = '';
                    }
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );

      if (letter[3] == 'X') {
        Xscore++;
      } else {
        Oscore++;
      }
    } else if (letter[6] == letter[7] &&
        letter[6] == letter[8] &&
        letter[6] != "") {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("WINNER IS : ${letter[6]}"),
            actions: [
              MaterialButton(
                child: const Text("Play Again!"),
                onPressed: () {
                  setState(() {
                    for (int i = 0; i < 9; i++) {
                      letter[i] = '';
                    }
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );

      if (letter[6] == 'X') {
        Xscore++;
      } else {
        Oscore++;
      }
    } else if (letter[0] == letter[3] &&
        letter[0] == letter[6] &&
        letter[0] != "") {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("WINNER IS : ${letter[0]}"),
            actions: [
              MaterialButton(
                child: const Text("Play Again!"),
                onPressed: () {
                  setState(() {
                    for (int i = 0; i < 9; i++) {
                      letter[i] = '';
                    }
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );

      if (letter[0] == 'X') {
        Xscore++;
      } else {
        Oscore++;
      }
    } else if (letter[1] == letter[4] &&
        letter[1] == letter[7] &&
        letter[1] != "") {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("WINNER IS : ${letter[1]}"),
            actions: [
              MaterialButton(
                child: const Text("Play Again!"),
                onPressed: () {
                  setState(() {
                    for (int i = 0; i < 9; i++) {
                      letter[i] = '';
                    }
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );

      if (letter[1] == 'X') {
        Xscore++;
      } else {
        Oscore++;
      }
    } else if (letter[2] == letter[5] &&
        letter[2] == letter[8] &&
        letter[2] != "") {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("WINNER IS : ${letter[2]}"),
            actions: [
              MaterialButton(
                child: const Text("Play Again!"),
                onPressed: () {
                  setState(() {
                    for (int i = 0; i < 9; i++) {
                      letter[i] = '';
                    }
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );

      if (letter[2] == 'X') {
        Xscore++;
      } else {
        Oscore++;
      }
    } else if (letter[0] == letter[4] &&
        letter[0] == letter[8] &&
        letter[0] != "") {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("WINNER IS : ${letter[0]}"),
            actions: [
              MaterialButton(
                child: const Text("Play Again!"),
                onPressed: () {
                  setState(() {
                    for (int i = 0; i < 9; i++) {
                      letter[i] = '';
                    }
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );

      if (letter[0] == 'X') {
        Xscore++;
      } else {
        Oscore++;
      }
    } else if (letter[2] == letter[4] &&
        letter[2] == letter[6] &&
        letter[2] != "") {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("WINNER IS : ${letter[2]}"),
            actions: [
              MaterialButton(
                child: const Text("Play Again!"),
                onPressed: () {
                  setState(() {
                    for (int i = 0; i < 9; i++) {
                      letter[i] = '';
                    }
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );

      if (letter[2] == 'X') {
        Xscore++;
      } else {
        Oscore++;
      }
    } else if (letter[0] != '' &&
        letter[1] != '' &&
        letter[2] != '' &&
        letter[3] != '' &&
        letter[4] != '' &&
        letter[5] != '' &&
        letter[6] != '' &&
        letter[7] != '' &&
        letter[8] != '') {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("DRAW"),
            actions: [
              MaterialButton(
                child: const Text("Play Again!"),
                onPressed: () {
                  setState(() {
                    for (int i = 0; i < 9; i++) {
                      letter[i] = '';
                    }
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        "SCORECARD",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontFamily: "font4"),
                      ),
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Player X",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontFamily: "font5"),
                            ),
                            Text(
                              Xscore.toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: "font5"),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Player O",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontFamily: "font5"),
                            ),
                            Text(
                              Oscore.toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: "font5"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: GridView.builder(
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (player1 && letter[index] == '') {
                          letter[index] = 'X';
                          player1 = false;
                        } else if (!player1 && letter[index] == '') {
                          letter[index] = 'O';
                          player1 = true;
                        }
                        checkWinner();
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.shade700,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          letter[index],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    player1 ? "Player X's turn" : "Player O's turn",
                    style: const TextStyle(
                        color: Colors.white, fontSize: 27, fontFamily: "font1"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
