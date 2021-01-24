import 'package:ejerciciologin/services/service.dart';
import 'package:ejerciciologin/widget/menu.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:transparent_image/transparent_image.dart';

class MultimediaPage extends StatefulWidget {
  MultimediaPage({Key key}) : super(key: key);

  @override
  _MultimediaPageState createState() => _MultimediaPageState();
}

class _MultimediaPageState extends State<MultimediaPage> {
  final _services = Service();
  String imageUrl =
      'https://www.adslzone.net/app/uploads-adslzone.net/2019/04/borrar-fondo-imagen-930x487.jpg';

   String _filePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multimedia'),
      ),
      drawer: Menu(),
      body: ListView(
        children: [
          Column(
            children: [
              takePhoto(),
              SizedBox(
                height: 10.0,
              ),
              uploadFile(),
                SizedBox(
                height: 20.0,
              ),
              FadeInImage.memoryNetwork(
                alignment: Alignment.center,
                placeholder: kTransparentImage,
                image: imageUrl,
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ],
      ),
    );
  }

Widget uploadFile(){
  return RaisedButton.icon(onPressed: openExplorer, icon: Icon(Icons.file_copy), label: Text('Subi un archivo'));
}


void openExplorer() async {
   try {

      var filePathObject = await FilePicker.getFile(type: FileType.any);
     
       _services.uploadFile(filePathObject);
      // print("File path: " + filePath);
      // setState((){this._filePath = filePathObject;});
    } on PlatformException catch (e) {
      print("Error while picking the file: " + e.toString());
    }
}


  Widget takePhoto() {
    return Padding(
      padding: const EdgeInsets.all(70.0),
      child: RaisedButton.icon(
          onPressed: () {
            goToCamera();
          },
          icon: Icon(Icons.camera),
          label: Text('Toma una foto')),
    );
  }

  Widget accessGalery() {
    return RaisedButton.icon(
        onPressed: () {
          goToCamera();
        },
        icon: Icon(Icons.photo_size_select_actual),
        label: Text('Gallery'));
  }

  void goToCamera() {
    processImage(ImageSource.camera);
  }

  void processImage(ImageSource origin) async {
    final foto = ImagePicker();
    final file = await foto.getImage(source: origin);

    print(file);

    String url = await _services.uploadImage(file);

    imageUrl = url;

    setState(() {
      
    });

    print(imageUrl + 'Esta es una url');

    print('camera');
  }

  // void selectPhoto() {
  //   processSavedImage(ImageSource.gallery);
  // }

  // void processSavedImage(ImageSource origin) async {
  //   final foto = ImagePicker();
  //   final file = await foto.getImage(source: origin);

  //   // print(file.path);

  //   // String url = await _services.uploadImage(file);

  //   // imageUrl = url;

  //   // print(imageUrl + 'Esta es una url');

  //   // setState(() {

  //   // });
  // }
}
