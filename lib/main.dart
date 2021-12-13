import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Rotation(),
    );
  }
}

class Rotation extends StatefulWidget {
  const Rotation({Key? key}) : super(key: key);

  @override
  _RotationState createState() => _RotationState();
}

class _RotationState extends State<Rotation> with TickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    _controller=AnimationController(vsync:this,duration: Duration(seconds: 10));
    _animation=CurvedAnimation(parent: _controller, curve: Curves.easeIn,);
    _controller.repeat();
  }
  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RotationTransition(turns: _animation,
            child: Center(child: Image.network('https://www.freeiconspng.com/thumbs/3d-cube-png/3d-cube-png-transparent-image-11.png',height: 200,width: 200,))),
          ],
        ),
      ),

    );
  }
}
