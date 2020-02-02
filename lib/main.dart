import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  File _resim;
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Fotoğraf Ekle",style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold),),
                  ),

                  InkWell(
                    onTap:_galeridenekleicerik ,
                    child: Container(
                      width:200,
                      height: 200,
                      decoration: BoxDecoration(
                        border: Border.all(width: 2),
                        borderRadius: BorderRadius.circular(10),),
                      child: _resim == null
                          ? Center(child: Icon(Icons.add))
                          : Image.file(_resim,fit: BoxFit.fill,width: 100,height: 100,),
                    ),
                  ),
                  _resim != null ? Silbutonu2() : Text(""),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _galeridenekleicerik() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _resim = image;
    });

    if (_resim == null) {
      print("lütfen fotoğrafın yüklenmesini bekleyiniz...");
    } else {
      print("fotoğraf yüklendi");
    }
  }


  Widget Silbutonu2(){
    return
      Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Center(
          child: Container(
            width: 100,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius:
              const BorderRadius.all(Radius.circular(4.0)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    offset: const Offset(4, 4),
                    blurRadius: 8.0),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  setState(() {
                    _resim=null;

                  });
                },
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      'Sil',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
  }
}
