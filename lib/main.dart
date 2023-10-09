import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tiktok_clone/firebase_options.dart';
import 'package:tiktok_clone/navigation_container.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp(
        theme: ThemeData(
            appBarTheme:
                const AppBarTheme(elevation: 0, backgroundColor: Colors.white)),
        debugShowCheckedModeBanner: false,
        home: NavigationContainer(),
      ),
    );
  }
}
