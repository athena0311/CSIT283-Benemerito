import 'package:flutter/material.dart';


void main(){
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          const Color.fromARGB(255, 73, 7, 189),
          const Color.fromARGB(255, 73, 6, 104),
            ],
        ),
      ),
          child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assests/logo.png',
              width: 150,
          ),
          const SizedBox(height: 25,),
          const Text('Learn Flutter the fun way!'),
          style: Textsyle(
            fontsize: 20, FontWeight: fontweight.bold,  Color.white,
          ),
          ),
          const SizedBox(height: 25,),
          const Text('Start Quiz'),
          ],
          )  
         )
        )
      ),
    );
}
