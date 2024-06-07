import 'package:flutter/material.dart';
import 'package:ui/view/screens/Pages/Common_pages/main_page.dart';
import 'package:ui/view/tools/myTextStyle.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.transparent,
            toolbarHeight: 80,
            foregroundColor: Colors.black,
            titleTextStyle: headingStyle,
          ),
          scaffoldBackgroundColor: Colors.grey.shade300,
          useMaterial3: true,
        ),
        home: const MainPage());
  }
}
