import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SonucEkrani extends StatefulWidget {

  int dogru;

  SonucEkrani({required this.dogru});

  @override
  State<SonucEkrani> createState() => _SonucEkraniState();
}

class _SonucEkraniState extends State<SonucEkrani> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade100,
      appBar: AppBar(
        title: Text("sonuc ekranı", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("doğru: ${widget.dogru}  yanlış: ${15 - widget.dogru} ", style: TextStyle(fontSize: 30),),
            Text("%${((widget.dogru*100/15).toInt())} başarı", style: TextStyle(fontSize: 30, color: Colors.red),),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                 child: Text("tekrar dene", style: TextStyle(fontSize: 20),)),
            ),

          ],
        ),
      ),
    );
  }
}