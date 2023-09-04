import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final double weight;
  final double height;

  const ResultScreen({
    Key? key,
    required this.height,
    required this.weight,
  }) : super(key: key);

  String _calBmi(double bmi) {
    String result = '저체중';
    if (bmi >= 35) {
      result = '고도 비만';
    } else if (bmi >= 30) {
      result = '2단계 비만';
    } else if (bmi >= 25) {
      result = '1단계 비만';
    } else if (bmi >= 23) {
      result = '과체중';
    } else if (bmi >= 18.5) {
      result = '정상';
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    final bmi = weight / ((height / 100.0) * (height / 100.0));

    Widget _buildIcon(double bmi) {
      Icon icon = Icon(
        Icons.sentiment_dissatisfied,
        color: Colors.amber,
      );
      if (bmi >= 23) {
        icon = Icon(
          Icons.sentiment_dissatisfied,
          color: Colors.amber,
        );
      } else if (bmi >= 18.5) {
        icon = Icon(
          Icons.sentiment_satisfied,
          color: Colors.amber,
        );
      }
      return icon;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('결과화면'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _calBmi(bmi),
              style: TextStyle(fontSize: 30),
            ),
            _buildIcon(bmi),
          ],
        ),
      ),
    );
  }
}
