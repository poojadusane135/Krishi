import 'package:flutter/material.dart';
import '../screen/weather.dart'; // Import the WeatherCard widget
import '../screen/crop_screen.dart'; // Import the CropScreen widget
import '../screen/scheme_screen.dart'; // Import the SchemeScreen widget
import '../screen/fertilizer_screen.dart';
import '../screen/landing.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../firebase_auth_implementation/firebase_auth_services.dart';
import 'package:firebase_core/firebase_core.dart'; // Import Firebase Core
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth
import '../screen/splash_screen.dart';
import '../screen/home_page.dart';
import '../screen/login_page.dart';
import '../screen/sign_up_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyBzT6-lAMCRRsMdwbxxb1kEMt-gDxi-YHw',
      appId: '1:40736742086:android:c1a49f5400e2b9c3af15c7',
      messagingSenderId: '40736742086',
      projectId: 'krushi-a55a6',
      storageBucket: 'krushi-a55a6.appspot.com',
    ),
  );
  Get.put(FirebaseAuthService());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/', // Set the initial route
      routes: {
        '/': (context) => LandingPage(), // Default route, landing page
        '/home': (context) => MyHomePage(), // Home page route
        '/login': (context) => LoginPage(), // Login page route
        '/signup': (context) => SignUpPage(), // Signup page route
        // Add more routes as needed
      },// Changed to LandingPage
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: HomeScreen(), // Display only HomeScreen content
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WeatherCard(), // Use the WeatherCard widget here
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CropScreen()),
                      );
                    },
                    child: Card(
                      elevation: 4,
                      child: Container(
                        height: 132,
                        width: 155,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white, // Background color
                          border: Border.all(color: Colors.grey, width: 1), // Yellow border
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Image.asset(
                          'assets/images/crop.png', // Your image asset path
                          fit: BoxFit.cover, // Fit the image to cover the entire card
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SchemeScreen()),
                      );
                    },
                    child: Card(
                      elevation: 4,
                      child: Container(
                        height: 132,
                        width: 155,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white, // Background color
                          border: Border.all(color: Colors.grey, width: 1), // Yellow border
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Image.asset(
                          'assets/images/scheme.png', // Your image asset path
                          fit: BoxFit.cover, // Fit the image to cover the entire card
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FertilizerScreen()),
                      );
                    },
                    child: Card(
                      elevation: 4,
                      child: Container(
                        height: 132,
                        width: 155,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white, // Background color
                          border: Border.all(color: Colors.grey, width: 1), // Yellow border
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Image.asset(
                          'assets/images/fertilizer.png', // Your image asset path
                          fit: BoxFit.cover, // Fit the image to cover the entire card
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BlogContent()),
                      );
                    },
                    child: Card(
                      elevation: 4,
                      child: Container(
                        height: 132,
                        width: 155,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white, // Background color
                          border: Border.all(color: Colors.grey, width: 1), // Yellow border
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Image.asset(
                          'assets/images/blog.png', // Your image asset path
                          fit: BoxFit.cover, // Fit the image to cover the entire card
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}



class BlogContent extends StatelessWidget {
  final String _blogUrl = 'https://mgsindia.org/blog/'; // Replace with your blog URL

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Blog',
          style: TextStyle(color: Colors.white), // Text color white
        ),
        backgroundColor: Color(0xFF285429), // Custom color #285429
      ),
      body: WebView(
        initialUrl: _blogUrl,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
