import 'package:flutter/material.dart';
import 'package:healthcare_app/page/eye_detection/review_page.dart';

 // import EyeScannerPage class

class ScanResultPage extends StatelessWidget {
  final String scanResult;

  const ScanResultPage(this.scanResult);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scan Result"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              scanResult,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EyeScannerPage(),
                  ),
                );
              },
              child:  Text('Scan Your Eye'),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.blue[900],
                textStyle: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 32.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}