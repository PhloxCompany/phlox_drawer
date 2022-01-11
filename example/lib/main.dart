import 'package:flutter/material.dart';
import 'package:phlox_drawer/controller/phlox_drawer_controller.dart';
import 'package:phlox_drawer/controller/phlox_drawer_option.dart';
import 'package:phlox_drawer/controller/phlox_drawer_tween.dart';
import 'package:phlox_drawer/phlox_drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PhloxDrawerController controller = PhloxDrawerController();

  // options: PhloxDrawerOption.threeScreenWithShadow(
  //   moveY: PhloxDrawerTween(begin: 0, end: 200),
  //   rotate: PhloxDrawerTween(begin: 0, end: 10),
  //   moveX:
  //       PhloxDrawerTween(begin: 0, end: -MediaQuery.of(context).size.width),
  //   opacity: PhloxDrawerTween(begin: 1, end: .3),
  // ),
  @override
  Widget build(BuildContext context) {
    return PhloxDrawer(
      context: context,
      controller: controller,
      options: PhloxDrawerOption.oneScreen(),
      duration: Duration(seconds: 1),
      drawerPage: Scaffold(
        backgroundColor: const Color(0xff0a174b),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              FloatingActionButton.small(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                onPressed: () => controller.toggle(),
                child: const Icon(Icons.close),
              )
            ],
          ),
        ),
      ),
      mainPage: Scaffold(
        appBar: AppBar(
          title: const Text("Phlox Drawer"),
          leading: IconButton(
              onPressed: () => controller.toggle(),
              icon: const Icon(Icons.menu)),
        ),
      ),
    );
  }
}
