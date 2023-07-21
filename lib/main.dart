import 'package:flutter/material.dart';
import 'package:three_d_cube/screen/three_d_cube_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rubik Cube Rotation',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: CubeScreen(title: 'Rotation'),
    );
  }
}
