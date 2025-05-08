import 'package:bayrak_quiz/bayraklar.dart';
import 'package:bayrak_quiz/veritabaniyardimcisi.dart';

class Bayraklardao {



  Future<List<Bayraklar>> getir() async{
  var db = await veritabaniYardimcisi.veritabaniErisim();

  List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM bayraklar");
  return List.generate(maps.length, (i){
    var satir = maps[i];
    return Bayraklar(satir["bayrak_id"], satir["bayrak_ad"], satir["bayrak_resim"]);
  });
}

 Future<List<Bayraklar>> rastgele3getir(int bayrak_id) async{
  var db = await veritabaniYardimcisi.veritabaniErisim();

  List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM bayraklar WHERE bayrak_id!= $bayrak_id ORDER BY RANDOM() LIMIT 3");
  return List.generate(maps.length, (i){
    var satir = maps[i];
    return Bayraklar(satir["bayrak_id"], satir["bayrak_ad"], satir["bayrak_resim"]);
  });
}


}

