// import 'package:flutter/material.dart';
// import 'package:velocity_x/velocity_x.dart';

// class ChatScreen1 extends StatefulWidget {
//   const ChatScreen1({super.key});

//   @override
//   State<ChatScreen1> createState() => _ChatScreen1State();
// }

// class _ChatScreen1State extends State<ChatScreen1> {
//   final TextEditingController _controller = TextEditingController();
//   final List<ChatMessage1> _message = [];
//   Widget _buildTextComposer() {
//     return Row(
//       children: [
//         Expanded(
//             child: TextField(
//           controller: _controller,
//           decoration: InputDecoration.collapsed(hintText: "Send a meesage"),
//         )),
//         IconButton(onPressed: () {}, icon: const Icon(Icons.send))
//       ],
//     ).px16();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: const Text("Feel free to ask us")),
//         body: SafeArea(
//           child: Column(
//             children: [
//               Flexible(
//                 child: ListView.builder(
//                     itemCount: _message.length,

//                     itemBuilder: (context, index) {
//                       return _message[index];
//                     }),
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                   color: context.cardColor,
//                 ),
//                 child: _buildTextComposer(),
//               )
//             ],
//           ),
//         ));
//   }
// }
