import 'package:flutter/material.dart';
import 'package:lab_act_2/dice_roller.dart';

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
          child: DiceRoller()
          ),
        ),
      ),
    ),
  );
}