import 'package:bayrak_quiz/oyun_ekrani.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'oyun anasayfa',
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'anasayfa'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade100,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(widget.title, style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("HOŞGELDİNİZ", style: TextStyle(fontSize: 30),),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Oyunekrani()));
                }, 
                child: Text("BAŞLA", style: TextStyle(fontSize: 20),)),
            ), 
          ],
        ),
      ),
    );
  }
}
