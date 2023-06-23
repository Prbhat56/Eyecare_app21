import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthcare_app/page/home_page1.dart';

class OTPScreen extends StatefulWidget {
  final String verificationId;
  OTPScreen({required this.verificationId});
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final TextEditingController _otpController = TextEditingController();
  void verifyOTP() async {
    String otp = _otpController.text.trim();
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId, smsCode: otp);
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      if (userCredential.user != null) {
    Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.pushReplacement(context,
              CupertinoPageRoute(builder: (context) => HomePageFinal()));
      }
    } on FirebaseAuthException catch (ex) {
      debugPrint(ex.code.toString());
    }
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  void _submitOTP() {
    String otp = _otpController.text;
    // Validate OTP here
    print('Submitted OTP: $otp');
  }

 Widget _buildOTPTextField() {
  List<Widget> textFields = List.generate(
    6,
    (index) => SizedBox(
      width: 50.0,
      height: 50.0,
      child: TextField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 20.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.only(),
          ),
        ),
        onChanged: (value) {
          if (value.isNotEmpty) {
            if (index < 5) {
              FocusScope.of(context).nextFocus();
            } else {
              FocusScope.of(context).unfocus();
            }
          } else if (value.isEmpty && index > 0) {
            FocusScope.of(context).previousFocus();
          }
        },
      ),
    ),
  );

  return Container(
    margin: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: textFields,
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Enter OTP',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          _buildOTPTextField(),
          ElevatedButton(
            onPressed: () {
              verifyOTP();
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
