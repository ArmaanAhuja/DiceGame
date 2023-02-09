import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Dice game"),
        centerTitle: true,
      ),
      body: Dice(),
    ),
  ));
}

class Dice extends StatefulWidget {
  const Dice({super.key});

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  // Initialize the dice to 1//
  int playerOne = 1;
  int playerTwo = 1;
  String result = "";
  // Function to roll the dice and decide the winner//
  void rollDice() {
    setState(() {
      playerOne = Random().nextInt(6) + 1;
      playerTwo = Random().nextInt(6) + 1;
      if (playerOne > playerTwo) {
        result = "player 1 wins";
      } else if (playerTwo > playerOne) {
        result = "player 2 wins";
      } else {
        result = "draw";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                MaterialButton(
                    onPressed: () {
                      rollDice();
                    },
                    child: Image.asset(
                      'images/face$playerOne.png',
                      height: 150,
                      width: 150,
                    )),
                Text(
                  "player 1",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                )
              ],
            ),
            // SizedBox(
            //   width: 100,
            // ),
            Column(
              children: [
                MaterialButton(
                  onPressed: () {
                    rollDice();
                  },
                  child: Image.asset(
                    'images/face$playerTwo.png',
                    height: 150,
                    width: 150,
                  ),
                ),
                Text(
                  "player2",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                )
              ],
            )
          ],
        ),
        SizedBox(
          height: 50,
        ),
        Text(
          result,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 50,
          ),
        )
      ],
    );
  }
}
