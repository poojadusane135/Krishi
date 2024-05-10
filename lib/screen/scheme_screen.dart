// scheme_screen.dart
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';


class SchemeScreen extends StatelessWidget {
  final String _url = 'https://krishi.maharashtra.gov.in/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Schemes',
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
