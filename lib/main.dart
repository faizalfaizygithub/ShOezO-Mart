import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui/view/screens/Pages/Common_pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.black,
            toolbarHeight: 80,
            foregroundColor: Colors.white,
            titleTextStyle: TextStyle(color: Colors.white),
          ),
          scaffoldBackgroundColor: Colors.grey.shade200,
          useMaterial3: true,
        ),
        home: const MainPage());
  }
}
