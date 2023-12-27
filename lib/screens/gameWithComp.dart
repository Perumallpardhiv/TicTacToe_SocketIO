import 'dart:math';
import 'package:flutter/material.dart';

class GamewithComputer extends StatefulWidget {
  @override
  _GamewithComputerState createState() => _GamewithComputerState();
}

class _GamewithComputerState extends State<GamewithComputer> {
  List<String> board = List.filled(9, '');
  bool isPlaXTurn = true;
  int Xscore = 0;
  int Oscore = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
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
                        "SCORE",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontFamily: "font4",
                        ),
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
                              "You",
                              style: const TextStyle(
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
                              "Computer",
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
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: 9,
                itemBuilder: (context, index) => buildGridTile(index),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildGridTile(int index) {
    return GestureDetector(
      onTap: () {
        if (board[index] == '' && isPlaXTurn) {
          makeMove(index, 'X');
          if (!checkForWinner()) {
            computerMove();
          }
        }
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade700,
          ),
        ),
        child: Center(
          child: Text(
            board[index],
            style: const TextStyle(
              color: Colors.white,
              fontSize: 35,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }

  void makeMove(int index, String player) {
    setState(() {
      board[index] = player;
      isPlaXTurn = !isPlaXTurn;
    });
  }

  void computerMove() {
    int bestMove = getBestMove();
    makeMove(bestMove, 'O');
    checkForWinner();
  }

  int getBestMove() {
    int bestScore = -9999;
    int bestMove = -1;
    for (int i = 0; i < 9; i++) {
      if (board[i] == '') {
        board[i] = 'O';
        int score = minimax(board, 0, false);
        board[i] = '';
        if (score > bestScore) {
          bestScore = score;
          bestMove = i;
        }
      }
    }
    return bestMove;
  }

  int minimax(List<String> board, int depth, bool isMaximizing) {
    int score = evaluate(board);

    if (score == 10 || score == -10) {
      return score;
    }

    if (!board.contains('')) {
      return 0;
    }

    if (isMaximizing) {
      int maxEval = -9999;

      for (int i = 0; i < 9; i++) {
        if (board[i] == '') {
          board[i] = 'O';
          int eval = minimax(board, depth + 1, !isMaximizing);
          board[i] = '';
          maxEval = max(maxEval, eval);
        }
      }

      return maxEval;
    } else {
      int minEval = 9999;

      for (int i = 0; i < 9; i++) {
        if (board[i] == '') {
          board[i] = 'X';
          int eval = minimax(board, depth + 1, !isMaximizing);
          board[i] = '';
          minEval = min(minEval, eval);
        }
      }

      return minEval;
    }
  }

  int evaluate(List<String> board) {
    // Check rows, columns, and diagonals for a winner
    for (int i = 0; i < 3; i++) {
      if (board[i * 3] == board[i * 3 + 1] &&
          board[i * 3 + 1] == board[i * 3 + 2]) {
        if (board[i * 3] == 'O') {
          return 10;
        } else if (board[i * 3] == 'X') {
          return -10;
        }
      }

      if (board[i] == board[i + 3] && board[i + 3] == board[i + 6]) {
        if (board[i] == 'O') {
          return 10;
        } else if (board[i] == 'X') {
          return -10;
        }
      }
    }

    if (board[0] == board[4] && board[4] == board[8]) {
      if (board[0] == 'O') {
        return 10;
      } else if (board[0] == 'X') {
        return -10;
      }
    }

    if (board[2] == board[4] && board[4] == board[6]) {
      if (board[2] == 'O') {
        return 10;
      } else if (board[2] == 'X') {
        return -10;
      }
    }

    return 0; // No winner
  }

  bool checkForWinner() {
    for (int i = 0; i < 3; i++) {
      if (board[i * 3] == board[i * 3 + 1] &&
          board[i * 3 + 1] == board[i * 3 + 2] &&
          board[i * 3] != '') {
        showWinnerDialog(board[i * 3]);
        return true;
      }

      if (board[i] == board[i + 3] &&
          board[i + 3] == board[i + 6] &&
          board[i] != '') {
        showWinnerDialog(board[i]);
        return true;
      }
    }

    if (board[0] == board[4] && board[4] == board[8] && board[0] != '') {
      showWinnerDialog(board[0]);
      return true;
    }

    if (board[2] == board[4] && board[4] == board[6] && board[2] != '') {
      showWinnerDialog(board[2]);
      return true;
    }

    if (!board.contains('')) {
      showWinnerDialog('Draw');
      return true;
    }

    return false;
  }

  void showWinnerDialog(String winner) {
    if (winner == 'X') {
      Xscore++;
    } else if (winner == 'O') {
      Oscore++;
    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Game Over'),
          content: Text(winner == 'Draw' ? 'It\'s a draw!' : '$winner wins!'),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Play Again'),
              onPressed: () {
                resetGame();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void resetGame() {
    setState(() {
      board = List.filled(9, '');
      isPlaXTurn = true;
    });
  }
}
