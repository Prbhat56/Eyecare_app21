import 'package:flutter/material.dart';
import 'dart:async';

class ScreenTimeTracker extends StatefulWidget {
  const ScreenTimeTracker({Key? key}) : super(key: key);

  @override
  _ScreenTimeTrackerState createState() => _ScreenTimeTrackerState();
}

class _ScreenTimeTrackerState extends State<ScreenTimeTracker> {
  int _screenTimeSeconds = 0;
  int _limitSeconds = 3600; // default 1 hour
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _stopTimer();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {
        _screenTimeSeconds++;
        if (_screenTimeSeconds >= _limitSeconds) {
          _stopTimer();
          _showLimitWarning();
        }
      });
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  void _showLimitWarning() {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Screen Time Limit Reached'),
          content: const Text('You have exceeded your screen time limit.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _startTimer();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _resumeTimer() {
    _startTimer();
  }

  void _setLimit() {
    showDialog(
      context: context,
      builder: (_) {
        final TextEditingController controller =
            TextEditingController(text: (_limitSeconds / 60).toString());

        return AlertDialog(
          title: const Text('Set Screen Time Limit'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Enter the number of minutes for the time limit:'),
              const SizedBox(height: 8),
              TextField(
                keyboardType: TextInputType.number,
                controller: controller,
                autofocus: true,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final int minutes = int.tryParse(controller.text) ?? 0;
                setState(() {
                  _limitSeconds = minutes * 60;
                });
                Navigator.pop(context);
              },
              child: const Text('Set'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenTimeDuration = Duration(seconds: _screenTimeSeconds);
    final screenTimeFormatted =
        '${screenTimeDuration.inHours}:${screenTimeDuration.inMinutes.remainder(60).toString().padLeft(2, '0')}:${screenTimeDuration.inSeconds.remainder(60).toString().padLeft(2, '0')}';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Screen Time Tracker',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Screen Time',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Text(
                screenTimeFormatted,
                style: TextStyle(fontSize: 64, color: Colors.white),
              ),
            ),
            SizedBox(height: 32),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _stopTimer,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 28.0,
                    ),
                    child: Text(
                      'STOP',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: _startTimer,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 28.0,
                    ),
                    child: Text(
                      'RESUME',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: _setLimit, // add this line
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 28.0,
                    ),
                    child: Text(
                      'SET LIMIT',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
