import 'package:flutter/material.dart';
import 'dart:math';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Color backgroundColor = Colors.white;
  Color textColor = Colors.black;
  bool screenPressed = false;

  @override
  Widget build(BuildContext context) {
    // generating random values [0, 255]
    int generateRandom() {
      Random random = Random();
      int randNumber = random.nextInt(256);
      return randNumber;
    }

    // generating rgb color based on generated random values
    Color generateColor() {
      return Color.fromRGBO(
          generateRandom(), generateRandom(), generateRandom(), 1);
    }

    // checking whether two colors are different enough so that they
    // don't completely merge on the screen
    bool colorsNotDifferent(Color newColor, Color oldColor) {
      int difference = sqrt(pow((newColor.red - oldColor.red), 2) +
              pow((newColor.green - oldColor.green), 2) +
              pow((newColor.blue - oldColor.blue), 2))
          .round();
      if (difference > 100)
        return false;
      else
        return true;
    }

    // function to change background color
    void changeColor() {
      setState(() {
        screenPressed = !screenPressed;
        textColor = backgroundColor;
        Color color = generateColor();
        // if generated background color and existing text color are too similar
        // it will regenerate new background color until they no more are
        while (colorsNotDifferent(color, textColor)) {
          color = generateColor();
        }
        backgroundColor = color;
      });
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: GestureDetector(
        onTap: changeColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Container(
                color: Color(0x00000000),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                child: AnimatedDefaultTextStyle(
                  duration: Duration(milliseconds: 200),
                  curve: Curves.easeIn,
                  style: screenPressed
                      ? TextStyle(
                          fontSize: 50,
                        )
                      : TextStyle(
                          fontSize: 30,
                        ),
                  child: Text(
                    'Hey there',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
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
