import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MiniCricketApp());
}

class MiniCricketApp extends StatelessWidget {
  const MiniCricketApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini Cricket',
      debugShowCheckedModeBanner: false,
      home: const CricketScreen(),
    );
  }
}

class CricketScreen extends StatefulWidget {
  const CricketScreen({super.key});

  @override
  State<CricketScreen> createState() => _CricketScreenState();
}

class _CricketScreenState extends State<CricketScreen> {
  int balls = 6;
  int totalRuns = 0;
  String currentRunText = '';

  void playBall() {
    if (balls > 0) {
      int runs = Random().nextInt(7); 
      
      setState(() {
        balls--;
        totalRuns += runs;
        
        if (runs == 0) {
          currentRunText = 'No Runs';
        } else {
          currentRunText = '$runs Runs';
        }
      });
    } else {
      // Restart logic
      setState(() {
        balls = 6;
        totalRuns = 0;
        currentRunText = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('Mini Cricket', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[800],
        centerTitle: true,
      ),
      // Whiteboard එකේ වම් පස තිබෙන විකල්ප (වඩාත් හොඳ) ව්‍යුහය (Row of Columns)
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Row( Col(I1, T1, v1), Col(I2, T2, v2) )
          Row(
            children: [
              // පළමු තීරුව (Column 1)
              Expanded(
                child: Column(
                  children: [
                    // I1
                    Container(
                      margin: const EdgeInsets.all(10),
                      color: Colors.white,
                      height: 100,
                      width: 100,
                      alignment: Alignment.center,
                      child: const Text('🏏', style: TextStyle(fontSize: 50)),
                    ),
                    const SizedBox(height: 10),
                    // T1
                    const Text('Runs', style: TextStyle(color: Colors.white, fontSize: 20)),
                    const SizedBox(height: 10),
                    // v1
                    Text(totalRuns.toString(), style: const TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              
              // දෙවන තීරුව (Column 2)
              Expanded(
                child: Column(
                  children: [
                    // I2
                    Container(
                      margin: const EdgeInsets.all(10),
                      color: Colors.white,
                      height: 100,
                      width: 100,
                      alignment: Alignment.center,
                      child: const Text('🔴', style: TextStyle(fontSize: 50)),
                    ),
                    const SizedBox(height: 10),
                    // T2
                    const Text('Balls', style: TextStyle(color: Colors.white, fontSize: 20)),
                    const SizedBox(height: 10),
                    // v2
                    Text(balls.toString(), style: const TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 40),
          
          // Result Text
          Text(
            currentRunText,
            style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          
          const SizedBox(height: 30),
          
          // Button
          ElevatedButton(
            onPressed: playBall,
            style: ElevatedButton.styleFrom(
              backgroundColor: balls == 0 ? Colors.red : Colors.blue[900],
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            ),
            child: Text(
              balls == 0 ? 'Restart' : 'Bat',
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
