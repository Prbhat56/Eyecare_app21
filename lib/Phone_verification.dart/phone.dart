

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthcare_app/Phone_verification.dart/otp.dart';

class MyPhone extends StatefulWidget {
  const MyPhone({super.key});

  @override
  State<MyPhone> createState() => _MyPhoneState();
}

class _MyPhoneState extends State<MyPhone> {
  TextEditingController countrycode = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  void sendOTP() async {
    String phone = "+91${phonecontroller.text.trim()}";
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phone,
        codeSent: (verificationId, resendToken) {
          Navigator.push(
              context, CupertinoPageRoute(builder: (context) => OTPScreen(
               verificationId: verificationId,
              )));
        },
        verificationCompleted: (Credential) {},
        verificationFailed: (ex) {
          debugPrint(ex.code.toString());
        },
        codeAutoRetrievalTimeout: (verificationId) {},
        timeout: const Duration(seconds: 30));
  }

  @override
  void initState() {
    countrycode.text = "+91";
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/eye61.jpg',
              width: 150,
              height: 150,
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              'Phone Verification',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'verify your phone by entering the phone number',
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 55,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(children: [
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 40,
                  child: TextField(
                    controller: countrycode,
                    decoration: const InputDecoration(border: InputBorder.none),
                  ),
                ),
                const Text(
                  '|',
                  style: TextStyle(fontSize: 33, color: Colors.grey),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextField(
                    controller: phonecontroller,
                    decoration: const InputDecoration(
                        border: InputBorder.none, hintText: "Phone"),
                  ),
                )
              ]),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 45,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  sendOTP();
                },
                child: Text('Send the code'),
                style: ElevatedButton.styleFrom(
                    primary: Colors.blueAccent.shade700,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            )
          ],
        )),
      ),
    );
  }
}
