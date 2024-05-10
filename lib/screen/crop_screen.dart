
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';


class CropScreen extends StatelessWidget {
  final String _url = 'https://crop-predict-21nl.onrender.com';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Crop',
          style: TextStyle(color: Colors.white), // Text color white
        ),
        backgroundColor: Color(0xFF285429), // Custom color #285429
      ),
      body: WebView(
        initialUrl: _url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
