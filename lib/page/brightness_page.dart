
import 'package:flutter/material.dart';
import 'package:screen/screen.dart';

class BrightPage extends StatefulWidget {
  const BrightPage({Key? key}) : super(key: key);

  @override
  State<BrightPage> createState() => _BrightPageState();
}

class _BrightPageState extends State<BrightPage> {
  double _screenBrightness = 0.5;
  bool _isKeptOn = false;
  final double _brightnessLimit = 0.7; // set the maximum brightness limit

  @override
  void initState() {
    super.initState();
    _initScreenBrightness();
    _initScreenFeatures();
  }

  void _initScreenBrightness() async {
    double brightness = await Screen.brightness;
    setState(() {
      _screenBrightness = brightness;
    });
  }

  void _initScreenFeatures() async {
    bool isKeptOn = await Screen.isKeptOn;
    setState(() {
      _isKeptOn = isKeptOn;
    });
  }

  void _toggleKeptOn() {
    setState(() {
      _isKeptOn = !_isKeptOn;
    });
    if (_isKeptOn) {
      Screen.keepOn(true);
    } else {
      Screen.keepOn(false);
    }
  }

  void _checkBrightnessLimit(double value) {
    if (value > _brightnessLimit) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Brightness Warning"),
            content: const Text(
              "The current brightness level may harm your eyes. Please reduce the brightness.",
            ),
            actions: <Widget>[
              TextButton(
                child: const Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: const Text("Screen Settings"),
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            const Text(
              "Screen Brightness",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Brightness Value: ${_screenBrightness.toStringAsFixed(2)}",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Slider(
              min: 0.0,
              max: 1.0,
              onChanged: (value) {
                setState(() {
                  _screenBrightness = value;
                });
                _checkBrightnessLimit(value);
              },
              onChangeEnd: (value) async {
                await Screen.setBrightness(value);
                _checkBrightnessLimit(value); // check the brightness limit after each change
              },
              value: _screenBrightness,
            ),
            const SizedBox(height: 60),
            const Text(
              "Screen Features",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Keep Screen On",
                  style: TextStyle(fontSize: 18),
                ),
                Switch(
                  value: _isKeptOn,
                  onChanged: (value) {
                    _toggleKeptOn();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
