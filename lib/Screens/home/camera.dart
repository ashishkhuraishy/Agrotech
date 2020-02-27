import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class Camera extends StatefulWidget {
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {

  File _image;
  List _recognitions;
  String model;
  bool busy = false;

  _loadModel() async {
    String res = await Tflite.loadModel(model: "assets/tflite/plant_village.tflite", labels: 'assets/tflite/plant_village.txt');
    print(res);
    setState(() {
      model = res;
    });
    print(res);
    print("Loaded");
  }
  _disposeModel() async {
    await Tflite.close();
  }

  _predict(File img)async{
    print("Strted");
    setState(() => busy = true);
    var rec = await Tflite.runModelOnImage(path: img.path);
    print(rec);
    setState(() {
      _recognitions = rec;
    });
    setState(() {
      busy = false;
    });
  }

  getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if(image != null){
      setState(() {
        _image = image;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadModel();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _disposeModel();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

   return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          GestureDetector(
            onTap: () => print("tapped"),
            child: Container(
              height: width,
              color: Colors.grey,
              child: _image == null ? Center(
                child: Icon(Icons.add_a_photo, color: Colors.white, size: 85.0,),
              ) : Image.file(_image, fit: BoxFit.cover,),
            ),
          ),

          SizedBox(height: 24.0,),
          _recognitions != null ? Text("${_recognitions[0]['label']}") : Text(""), 

          Container(
            width: 250.0,
            color: Colors.green,
            child: IconButton(icon: Icon(Icons.image), onPressed: getImage),
          ),
          IconButton(icon: Icon(Icons.done_outline), onPressed: (){
            _predict(_image);
          })
        ],
      ),
    );
  }
}