import 'package:flutter/material.dart';
 
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
          color: Color.fromARGB(255, 72, 0, 144),
          ),
          child: Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logo.png',
              width: 180,
              ),
              SizedBox(height: 30),
              Text('Learn Flutter the fun way!',
              style: TextStyle(
              fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white,
              ),
              ),
              SizedBox(height: 30),
              ElevatedButton(onPressed: () {}, 
              child: Text('Start Quiz', 
              style:TextStyle(fontSize:18)
              )
              )
              ],
              )
          ),
          ),
        ),
      ),
  );
}
 