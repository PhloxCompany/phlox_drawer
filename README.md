# 📱 Phlox Drawer package

[![flutter drawer pub get package version](https://img.shields.io/badge/pub-1.0.0-red)](https://pub.dev/packages/phlox_drawer)
[![flutter drawer phlox company](https://img.shields.io/badge/Flutter-PhloxCompany-blue)](https://pub.dev/packages/phlox_drawer)

**Phlox Drawer** is a simple package to create beautiful custom drawer .

- Animate **multiple properties** at once

## Images

options | PhloxDrawerOption.oneScreen() | PhloxDrawerOption.twoScreen() | PhloxDrawerOption.threeScreen()
gif | ![flutter drawer](https://github.com/phloxCompany/flutter_drawer/assets/drawer1.gif?raw=true) | ![flutter drawer](https://github.com/phloxCompany/flutter_drawer/assets/drawer2.gif?raw=true) | ![flutter drawer](https://github.com/phloxCompany/flutter_drawer/assets/drawer3.gif?raw=true)
codes | (example1) | (example2) | (example3)


## Getting started


- add package

```yaml
dependencies:
  phlox_drawer: ^1.0.0
```

```commandline
flutter pub get
flutter pub upgrade
```

<!-- #toc -->

## Usage


check `/example` folder. 


### example 1
```dart
class _MyHomePageState extends State<MyHomePage> {
  PhloxDrawerController controller = PhloxDrawerController();

  @override
  Widget build(BuildContext context) {
    return PhloxDrawer(
      context: context,
      controller: controller,
      options: PhloxDrawerOption.oneScreen(),
      duration: Duration(seconds: 1),
      drawerPage: Scaffold(),
      mainPage: Scaffold(),
    );
  }
}
```


### example 2
```dart
class _MyHomePageState extends State<MyHomePage> {
  PhloxDrawerController controller = PhloxDrawerController();

  @override
  Widget build(BuildContext context) {
    return PhloxDrawer(
      context: context,
      controller: controller,
      options: PhloxDrawerOption.twoScreen(),
      duration: Duration(seconds: 1),
      drawerPage: Scaffold(),
      mainPage: Scaffold(),
    );
  }
}
```


### example 3
```dart
class _MyHomePageState extends State<MyHomePage> {
  PhloxDrawerController controller = PhloxDrawerController();

  @override
  Widget build(BuildContext context) {
    return PhloxDrawer(
      context: context,
      controller: controller,
      options: PhloxDrawerOption.threeScreen(),
      duration: Duration(seconds: 1),
      drawerPage: Scaffold(),
      mainPage: Scaffold(),
    );
  }
}
```

## Additional information

Just add two Widget inside PhloxDrawer and control with PhloxDrawerController
