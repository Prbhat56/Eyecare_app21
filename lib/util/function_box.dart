import 'package:flutter/material.dart';

class FunctionBox extends StatelessWidget {
  final String functionName;
  final String iconPath;
  final Function()? onPressed;

  const FunctionBox({
    Key? key,
    required this.functionName,
    required this.iconPath,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: 350,
        width: 250,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(24),
        ),
        // padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              iconPath,
              height: 60,
              width: 60,
            ),
            TextButton(
              onPressed: onPressed,
              child: Text(
                functionName,
                textScaleFactor: MediaQuery.of(context).textScaleFactor,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
