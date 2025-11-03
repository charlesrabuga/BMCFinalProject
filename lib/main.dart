// This imports all the standard Material Design widgets
import 'package:flutter/material.dart';
// 1. Import the Firebase core package
import 'package:firebase_core/firebase_core.dart';
// 2. Import the auto-generated Firebase options file
import 'firebase_options.dart';
// 1. Import the native splash package
import 'package:flutter_native_splash/flutter_native_splash.dart';
// 1. Import your new login screen
import 'package:ecommerce_app/screens/login_screen.dart';





void main() async { // 1. Make the 'main' function asynchronous

  // 1. Preserve the splash screen
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);


  // 2. Ensure Flutter is ready before calling native code
  WidgetsFlutterBinding.ensureInitialized();

  // 3. Initialize Firebase
  await Firebase.initializeApp(
    // 4. Use the options from our generated file
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // 5. Run the app (this line is already here)
  runApp(const MyApp());

  // 4. Remove the splash screen after app is ready
  FlutterNativeSplash.remove();

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. MaterialApp is the root of your app
    return MaterialApp(
      // 2. This removes the "Debug" banner
      debugShowCheckedModeBanner: false,
      title: 'eCommerce App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      // 3. A simple placeholder for our home screen
      home: const LoginScreen()(
        appBar: AppBar(
          title: Text('My E-Commerce App'),
        ),
        body: Center(
          child: Text('Firebase is Connected!'),
        ),
      ),
    );
  }
}



