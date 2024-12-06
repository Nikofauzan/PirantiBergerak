import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sesi4/controller/feed_controller.dart';
import 'package:sesi4/view/home_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>
        FeedController(),)
      ],
       child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'OurApp',
        theme: ThemeData(
      
          colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 255, 255)),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}

