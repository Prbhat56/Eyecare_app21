// import 'dart:async';
// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';

// late CameraController _controller;

// Future<void> onCameraInitialized() async {
//   final cameras = await availableCameras();
//   final camera = cameras.first;
//   _controller = CameraController(camera, ResolutionPreset.high);
//   await _controller.initialize();
//   setState(() {});
// }
// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     body: Stack(
//       children: [
//         CameraPreview(_controller),
//         Container(
//           alignment: Alignment.center,
//           child: Text('Additional UI elements'),
//         ),
//       ],
//     ),
//   );
// }
// @override
// void initState() {
//   super.initState();
//   onCameraInitialized();
// }