import 'package:flutter/material.dart';
import 'package:my_favorite_word/setstate/random_word.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
          side: const BorderSide(color: Colors.grey),
              minimumSize: const Size(130,40),
        )),
      ),
      home: const StartScreen(),
    );
  }
}

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Using variety of State Manager'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=> SetSateRandomWord()));
            }, child: const Text('setState')),
            const SizedBox(height: 10,),
            TextButton(onPressed: (){}, child: const Text('Provider')),
            const SizedBox(height: 10,),
            TextButton(onPressed: (){}, child: const Text('GetX')),
          ],
        ),
      ),
    );
  }
}


