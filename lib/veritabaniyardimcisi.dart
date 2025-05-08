import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/services.dart';
import 'dart:io';


class veritabaniYardimcisi{
static final String veritabaniAdi = "bayrak.db";

static Future<Database> veritabaniErisim() async{
String veritabaniYolu = join(await getDatabasesPath(), veritabaniAdi);

if(await databaseExists(veritabaniYolu)){
print("db mevcut");

}else{
ByteData data = await rootBundle.load("veritabani/$veritabaniAdi");
List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

await File(veritabaniYolu).writeAsBytes(bytes,flush: true);

print("db kopyalandı");

}

return openDatabase(veritabaniYolu); 
}
}