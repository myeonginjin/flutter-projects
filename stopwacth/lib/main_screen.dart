import 'dart:async';

import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Timer? _timer;

  int _time = 0;
  bool _isRunning = false;

  List<String> _laptimes = [];

  void _clickButton() {
    _isRunning = !_isRunning;

    if (_isRunning) {
      _start();
    } else {
      _pause();
    }
  }

  void _start() {
    _timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      setState(() {
        _time++;
      });
    });
  }

  void _pause() {
    _timer?.cancel();
  }

  void _reset() {
    _isRunning = false;
    _timer?.cancel();
    _laptimes.clear();
    _time = 0;
  }

  void _recordLapTime(String time) {
    _laptimes.insert(0, "${_laptimes.length + 1}등 $time");
  }

  @override
  Widget build(BuildContext context) {
    int _sec = _time ~/ 100;
    String hundredth = "${_time % 100}".padLeft(2, "0");
    return Scaffold(
      appBar: AppBar(
        title: Text("스탑워치"),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "$_sec",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "$hundredth",
              ),
            ],
          ),
          SizedBox(
            height: 100,
            width: 100,
            child: ListView(
              children: _laptimes.map((time) => Text(time)).toList(),
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    _reset();
                  });
                },
                backgroundColor: Colors.black,
                child: Icon(
                  Icons.refresh,
                  color: Colors.red,
                ),
              ),
              FloatingActionButton(
                  onPressed: () {
                    _clickButton();
                  },
                  child: _isRunning
                      ? Icon(
                          Icons.pause,
                          color: Colors.cyan,
                        )
                      : Icon(Icons.play_arrow)),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    _recordLapTime("$_sec.$hundredth");
                    // print("$_sec.$hundredth");
                  });
                },
                child: Icon(
                  Icons.add,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
