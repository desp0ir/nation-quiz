import 'package:bayrak_quiz/bayraklar.dart';
import 'package:bayrak_quiz/bayraklardao.dart';
import 'package:bayrak_quiz/sonuc_ekrani.dart';
import 'package:flutter/material.dart';

class Oyunekrani extends StatefulWidget {
  const Oyunekrani({super.key});

  @override
  State<Oyunekrani> createState() => _OyunekraniState();
}

class _OyunekraniState extends State<Oyunekrani> {


List<Bayraklar> sorular = [];  
List<Bayraklar> yanlisSecenekler = [];  
late Bayraklar dogruSoru;  
Set<Bayraklar> tumSecenekler = {}; 


  int dogru = 0;
  int yanlis = 0;
  int sorusayisi = 0;


  String bayrakResimAdi = "placeholder.png";
  String buttonAyazi = "";
  String buttonByazi = "";
  String buttonCyazi = "";
  String buttonDyazi = "";

  @override
  void initState() {
    super.initState();

  sorulariAl();

  }

  Future<void> sorulariAl() async{
    sorular = await Bayraklardao().getir();
    sorulariYukle();
  }

  Future<void> sorulariYukle() async {
  dogruSoru = sorular[sorusayisi];
  bayrakResimAdi = dogruSoru.bayrak_resim;

  yanlisSecenekler = await Bayraklardao().rastgele3getir(dogruSoru.bayrak_id);

  List<Bayraklar> secenekler = [dogruSoru, ...yanlisSecenekler];
  secenekler.shuffle(); 

  // Şıkları butonlara ata
  buttonAyazi = secenekler[0].bayrak_ad;
  buttonByazi = secenekler[1].bayrak_ad;
  buttonCyazi = secenekler[2].bayrak_ad;
  buttonDyazi = secenekler[3].bayrak_ad;

  setState(() {});
}



  void soruSayac(){

    sorusayisi = sorusayisi + 1;

    if(sorusayisi != 15){
      sorulariYukle();
    }
    else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SonucEkrani(dogru: dogru)));
    }
  }


  void dogruKontrol(String buttonYazi){
    if(dogruSoru.bayrak_ad == buttonYazi){
      dogru += 1;
    }
    else{
      yanlis -= 1;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade100,
      appBar: AppBar(
        title: Text("oyun ekranı", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("doğru : $dogru", style: TextStyle(fontSize: 20),),
                Text("yanlış : $yanlis", style: TextStyle(fontSize: 20),),
              ],
            ),
            sorusayisi != 5 ? Text("${sorusayisi+1}. Soru", style: TextStyle(fontSize: 20),) : Text("15. Soru", style: TextStyle(fontSize: 20),),

            Image.asset("images/$bayrakResimAdi"),

            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(onPressed: (){
              dogruKontrol(buttonAyazi);
              soruSayac();
              }, 
              child: Text(buttonAyazi),
              ),
            ),

            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(onPressed: (){
              dogruKontrol(buttonByazi);
              soruSayac();
              },
               child: Text(buttonByazi),
              ),
            ),

            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(onPressed: (){
              dogruKontrol(buttonCyazi);
              soruSayac();
              }, 
              child: Text(buttonCyazi),
              ),
            ),

            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(onPressed: (){
              dogruKontrol(buttonDyazi);
              soruSayac();
              }, 
              child: Text(buttonDyazi),
              ),
            ),
          ],
        ),
      )
    );
  }
}