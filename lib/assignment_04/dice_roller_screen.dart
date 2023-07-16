import 'dart:math';

import 'package:flutter/material.dart';

class DiceRollerScreen extends StatefulWidget {
  const DiceRollerScreen({Key? key}) : super(key: key);

  @override
  State<DiceRollerScreen> createState() => _DiceRollerScreenState();
}

class _DiceRollerScreenState extends State<DiceRollerScreen> {
  IconData diceIc = Icons.hourglass_empty;
  List<String> dices = [
    "assets/images/dice_01.png",
    "assets/images/dice_02.png",
    "assets/images/dice_03.png",
    "assets/images/dice_04.png",
    "assets/images/dice_05.png",
    "assets/images/dice_06.png",
  ];
  int currentDice = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dice Roller"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
//Dice
            Container(
              child: currentDice == -1 ? Icon(Icons.hourglass_empty, size: 256,) : Image(image: AssetImage(dices.elementAt(currentDice))),
            ),

//Roll btn
            Container(
              child: ElevatedButton(
                  onPressed: () {
                    Random r = Random();
                    int diceInt = r.nextInt(6) + 1;

// roll
                    changeDice(diceInt);

                    debugPrint("dice $diceInt");

                    setState(() {});
                  },
                  child: Text("Roll".toUpperCase())),
            ),
          ],
        ),
      ),
    );
  }

  void changeDice(int diceInt) {
    switch (diceInt) {
      case 1:
        currentDice = 0;
        break;
      case 2:
        currentDice = 1;
        break;
      case 3:
        currentDice = 2;
        break;
      case 4:
        currentDice = 3;
        break;
      case 5:
        currentDice = 4;
        break;
      case 6:
        currentDice = 5;
        break;
      default:
        break;
    }
  }
}
