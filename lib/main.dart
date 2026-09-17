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
      // මෙතැන් සිට පහළට තියෙන්නේ සර් Whiteboard එකේ ඇඳපු විදිහටම හදපු ව්‍යුහය (Structure)
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          // Image -> Row(I1, I2) Expanded
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(20),
                  color: Colors.white,
                  height: 100,
                  alignment: Alignment.center,
                  // I1: පළමු පින්තූරය (Bat)
                  child: const Text('🏏', style: TextStyle(fontSize: 50)),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(20),
                  color: Colors.white,
                  height: 100,
                  alignment: Alignment.center,
                  // I2: දෙවැනි පින්තූරය (Ball)
                  child: const Text('🔴', style: TextStyle(fontSize: 50)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          
          // Text -> Row(T1, T2)
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // T1
              Text('Runs', style: TextStyle(color: Colors.white, fontSize: 20)),
              // T2
              Text('Balls', style: TextStyle(color: Colors.white, fontSize: 20)),
            ],
          ),
          const SizedBox(height: 10),
          
          // Value -> Row(v1, v2)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // v1 (Runs value)
              Text(totalRuns.toString(), style: const TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)),
              // v2 (Balls value)
              Text(balls.toString(), style: const TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 30),
          
          // Res L -> Text( )
          Text(
            currentRunText,
            style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          
          // Button -> Button( ) -> if/else
          ElevatedButton(
            onPressed: playBall,
            style: ElevatedButton.styleFrom(
              // if else for button color
              backgroundColor: balls == 0 ? Colors.red : Colors.blue[900],
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            ),
            child: Text(
              // if else for button text
              balls == 0 ? 'Restart' : 'Bat',
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          
        ],
      ),
    );
  }
}
