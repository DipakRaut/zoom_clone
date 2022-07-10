import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zoom_clone/resources/auth_methods.dart';
import 'package:zoom_clone/screens/homeScreen.dart';
import 'package:zoom_clone/screens/loginScreen.dart';
import 'package:zoom_clone/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Zoom Clone',
        theme:
            ThemeData.dark().copyWith(scaffoldBackgroundColor: backgroundColor),
        routes: {
          "/login": (context) => LoginScreen(),
          "/home": (context) => HomeScreen(),
        },
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
          stream: AuthMethods().authChanges,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasData) {
              return const HomeScreen();
            }

            return LoginScreen();
          },
        ));
  }
}


// StreamBuilder will build the widget according to the screen



// export PATH="$PATH:/Users/dipakraut/Movies/flutter_installation_data/flutter/bin"