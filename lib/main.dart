import 'package:flutter/material.dart';
import 'package:block_corrupt/pages/loginPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      title: 'Block_Corrupt',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      routes: {
        '/': (context)=>LoginPage(),
       /* '/government': (context)=> Government_profile(),
        '/builder': (context)=> Builder_profile(),
        '/materials':(context)=> Materials_page(),  */      
      },
    );
  }
}

