import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:healthcare_app/Phone_verification.dart/otp.dart';
import 'package:healthcare_app/page/brightness_page.dart';
import 'package:healthcare_app/page/chatbot/chat_screen.dart';
import 'package:healthcare_app/page/drawer.dart';
import 'package:healthcare_app/page/eye_detection/camera_screen.dart';
import 'package:healthcare_app/page/eye_detection/review_page.dart';
import 'package:healthcare_app/page/eye_detection/splash_screen.dart';
import 'package:healthcare_app/page/home_page1.dart';
import 'package:healthcare_app/page/homepage.dart';
import 'package:healthcare_app/page/screen_warning.dart';
import 'package:healthcare_app/page/services/notification_services.dart';
import 'package:healthcare_app/registor_page.dart';
import 'package:healthcare_app/page/profile_page.dart';

import 'Phone_verification.dart/phone.dart';
import 'firebase_options.dart';
import 'login_page.dart';
import 'package:camera/camera.dart';

List<CameraDescription>? cameras;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await NotificationService.initialize();
  await dotenv.load(fileName: ".env");
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: (FirebaseAuth.instance.currentUser != null)
          ? HomePageFinal()
          : MyLogin(),
      initialRoute: 'login',
      routes: {
        'login': (context) => const MyLogin(),
        'register': (context) => const MyRegister(),
        'phone': (context) => const MyPhone(),
        'home': (context) => const HomePage(),
        'home1': (context) => const HomePageFinal(),
        'profile': (context) => ProfilePage(),
        'times': (context) => const ScreenTimeTracker(),
        'splash': (context) => const MySplashScreen(),
        'otp': (context) => OTPScreen(
              verificationId: '',
            ),
        'eye': (context) => EyeScannerPage(),
        'screen': (context) => const ChatScreen(),
        'bright': (context) => const BrightPage(),
        'drawer': (context) => const MyDrawer(),
        'eyescreen': (context) => const EyeScreen1(),
      }));
}
