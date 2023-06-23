import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(child:Column(children: [
        Padding(padding:const EdgeInsets.symmetric(horizontal: 25.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Hello',style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 18,),
                ),
                SizedBox(
                  height: 8,
                ),
                Text('Alex',style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 24,))
            ],
            ),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.deepPurple[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: IconButton(icon:const Icon(Icons.person),onPressed: (() {
                
              }),),
            )

          ],
        ),
        ),
        const SizedBox(
          height: 25,
        ),
        Padding(padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(color: Colors.pink[100],
          borderRadius: BorderRadius.circular(12)),
          child: Row(children: [
            Container(
              height: 100,
              width: 100,
              color: Colors.deepPurple[200],
            ),
            const SizedBox(
              width: 25,
            ),
        
         Expanded(
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                const Text('How do you feel?',style: TextStyle(
                  fontWeight: FontWeight.bold,fontSize: 16,
                ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text('Fill out your medical card now',style: TextStyle(
                  fontSize: 14,
                ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  child: const Center(child: Text('Get Started')
                  ),
                )
                
              ],
            ),
         ),
           ]
           ), 
        ),
        ),
        const SizedBox(
          height: 18,
        ),
        Padding(padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.deepPurple[100],
            borderRadius: BorderRadius.circular(12),
          ),
          child: const TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              border: InputBorder.none,
              hintText: 'How can we help you?',
            ),
          ),
        ),)
      ],
      )
      ),
    );
  }
}