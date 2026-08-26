import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      home: Scaffold(
      body: Container(
        decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          const Color.fromARGB(255, 183, 155, 231),
          const Color.fromARGB(255, 250, 253, 255),
        ])  
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                width: 200,
                'assets/dice-images/dice-images/dice-2.png'
                ),
                SizedBox(height: 50),
              TextButton(onPressed: () {},
              child: Text(
                style: TextStyle(
                  fontSize: 28,
                ),
                "Roll Dice"
                )
              ),
             ],
            )
          ),
        ),
      ),
    ),
  );
}