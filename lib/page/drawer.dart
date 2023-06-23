import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:healthcare_app/login_page.dart';
import 'package:url_launcher/url_launcher.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  void logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context)=>const MyLogin()));
  }

  Future<void> openCamera(BuildContext context) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      // Do something with the image file
    }
  }

  void sendMail() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'hendramyuv@gmail.com',
      query:
          'subject=Hello%20There&body=How%20are%20you%20doing%3F%0A%0ARegards%2C%0AUser',
    );

    String url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color.fromARGB(255, 160, 171, 229),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  accountName: Text("Alexis"),
                  accountEmail: Text("hendramyuv@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage(
                      ('prabhat.jpg'),
                    ),
                  )),
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text(
                "Home",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text(
                "Profile",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: const Text(
                "Mail me",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () => sendMail(),
            ),
            ListTile(
              leading: const Icon(
                CupertinoIcons.camera,
                color: Colors.white,
              ),
              title: const Text(
                "Share with us ",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () => openCamera(context),
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.house_fill,
                color: Colors.white,
              ),
              title: Text(
                "Marketplace",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                CupertinoIcons.arrow_right,
                color: Colors.white,
              ),
              title: const Text(
                "Logout",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () => logout(context),
            )
          ],
        ),
      ),
    );
  }
}
