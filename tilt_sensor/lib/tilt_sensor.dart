import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sensors_plus/sensors_plus.dart';

class TiltSensor extends StatelessWidget {
  TiltSensor({super.key});

  @override
  Widget build(BuildContext context) {
    final centerX = MediaQuery.of(context).size.width / 2;
    final centerY = MediaQuery.of(context).size.height / 2;

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);

    return Scaffold(
      body: Stack(
        children: [
          StreamBuilder<AccelerometerEvent>(
              stream: accelerometerEvents,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                final event = snapshot.data!;
                List<double> accelerometerValues = [event.x, event.y, event.x];
                // print(accelerometerValues);
                return Positioned(
                  top: centerY + event.y * 20,
                  left: centerX + event.x * 20,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    width: 100,
                    height: 100,
                  ),
                );
              }),
        ],
      ),
    );
  }
}
