import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:three_d_cube/utils/constants.dart';

class CubeScreen extends StatefulWidget {
  CubeScreen({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _CubeScreenState createState() => _CubeScreenState();
}

class _CubeScreenState extends State<CubeScreen>
    with SingleTickerProviderStateMixin {
  late Scene _scene;
  Object? _cube;
  double xAngle = 0.0;
  double yAngle = 0.0;
  double zAngle = 0.0;

  void _onSceneCreated(Scene scene) {
    _scene = scene;
    scene.camera.position.z = 20;
    scene.camera.target.y = 2;
    _cube = Object(
        scale: Vector3(10.0, 10.0, 10.0),
        backfaceCulling: false,
        fileName: Constants.CUBE_PATH);
    scene.world.add(_cube!);
  }

  @override
  void initState() {
    super.initState();
    //listening to gyroscope event.
    gyroscopeEvents.listen((GyroscopeEvent event) {
      setState(() {
        if (_cube != null) {
          var x = event.x;
          var y = event.y;
          var z = event.z;
          _cube!.rotation.x += y;
          _cube!.rotation.y -= x;
          _cube!.rotation.z += z;
          _cube!.updateTransform();
          _scene.update();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Center(
        child: Cube(
          onSceneCreated: _onSceneCreated,
        ),
      ),
    );
  }
}
