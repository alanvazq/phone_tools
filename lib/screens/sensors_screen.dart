import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class SensorsScreen extends StatefulWidget {
  @override
  _SensorsScreenState createState() => _SensorsScreenState();
}

class _SensorsScreenState extends State<SensorsScreen> {
  double accelerometerX = 0.0;
  double accelerometerY = 0.0;
  double accelerometerZ = 0.0;

  double gyroscopeX = 0.0;
  double gyroscopeY = 0.0;
  double gyroscopeZ = 0.0;

  double magnetometerX = 0.0;
  double magnetometerY = 0.0;
  double magnetometerZ = 0.0;

  @override
  void initState() {
    super.initState();

    //Acelerometro
    accelerometerEventStream().listen((AccelerometerEvent event) {
      setState(() {
        accelerometerX = event.x;
        accelerometerY = event.y;
        accelerometerZ = event.z;
      });
    });

    //Giroscopio
    gyroscopeEventStream().listen((GyroscopeEvent event) {
      setState(() {
        gyroscopeX = event.x;
        gyroscopeY = event.y;
        gyroscopeZ = event.z;
      });
    });

    magnetometerEventStream().listen((MagnetometerEvent event) {
      setState(() {
        magnetometerX = event.x;
        magnetometerY = event.y;
        magnetometerZ = event.z;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Center(
              child: Text(
        "Sensores",
      ))),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Acelerómetro'),
              Text('X: $accelerometerX'),
              Text('Y: $accelerometerY'),
              Text('Z: $accelerometerZ'),
              const SizedBox(height: 20),
              const Text('Giroscopio'),
              Text('X: $gyroscopeX'),
              Text('Y: $gyroscopeY'),
              Text('Z: $gyroscopeZ'),
              const SizedBox(height: 20),
              const Text('Magnetómetro'),
              Text('X: $magnetometerX'),
              Text('Y: $magnetometerY'),
              Text('Z: $magnetometerZ'),
            ],
          ),
        ),
      ),
    );
  }
}
