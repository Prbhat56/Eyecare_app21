// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';

// class EyeScreen extends StatefulWidget {
//   @override
//   State<EyeScreen> createState() => _EyeScreenState();
// }

// class _EyeScreenState extends State<EyeScreen> {
//   bool isWorking = false;
//   String result = "";
//   late CameraController cameraController;
//   CameraImage? imgCamera = null;
//   late List<CameraDescription> cameras;
//   int selectedCameraIdx = 0;

//   @override
//   void initState() {
//     super.initState();
//     initCamera();
//   }

//   initCamera() async {
//     cameras = await availableCameras();
//     selectCamera(cameras[selectedCameraIdx]);
//   }

//   selectCamera(CameraDescription cameraDescription) async {
//     cameraController = CameraController(cameraDescription, ResolutionPreset.medium);
//     await cameraController.initialize();
//     if (!mounted) {
//       return;
//     }
//     setState(() {
//       cameraController.startImageStream((imageFromStream) {
//         if (!isWorking) {
//           isWorking = true;
//           imgCamera = imageFromStream;
//         }
//       });
//     });
//   }

//   switchCamera() {
//     selectedCameraIdx = (selectedCameraIdx + 1) % cameras.length;
//     selectCamera(cameras[selectedCameraIdx]);
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (!cameraController.value.isInitialized) {
//       return Container();
//     }
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Center(
//         child: Stack(
//           alignment: AlignmentDirectional.bottomCenter,
//           children: [
//             AspectRatio(
//               aspectRatio: cameraController.value.aspectRatio,
//               child: CameraPreview(cameraController),
//             ),
//             Container(
//               margin: EdgeInsets.only(bottom: 40),
//               child: FloatingActionButton(
//                 onPressed: switchCamera,
//                 child: Icon(Icons.switch_camera),
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.only(bottom: 40, right: 80),
//               child: FloatingActionButton(
//                 onPressed: () {},
//                 child: Icon(Icons.camera_alt),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     cameraController.dispose();
//     super.dispose();
//   }
// }