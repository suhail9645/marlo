import 'package:flutter/material.dart';
import 'package:marlo/presentation/screens/dash_bord_section/dash_bord_page.dart';

import 'presentation/router/router.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  final AppRouter route = AppRouter();
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor:const Color(0xFFF7F7F7),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      onGenerateRoute: route.onGenerateRote
    );
  }
}
