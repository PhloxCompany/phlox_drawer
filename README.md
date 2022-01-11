# 📱 Phlox Drawer package

[![flutter drawer pub get package version](https://img.shields.io/badge/pub-1.0.0-red)](https://pub.dev/packages/phlox_drawer)
[![flutter drawer phlox company](https://img.shields.io/badge/Flutter-PhloxCompany-blue)](https://pub.dev/packages/phlox_drawer)

**Phlox Drawer** is a simple package to create beautiful custom drawer .

- Animate **multiple properties** at once

## Images

options | PhloxDrawerOption.oneScreen() | PhloxDrawerOption.twoScreen() | PhloxDrawerOption.threeScreen()
--- | --- | --- | ---
gif | ![flutter drawer](https://github.com/phloxCompany/phlox_drawer/blob/master/assets/drawer1.gif) | ![flutter drawer](https://github.com/phloxCompany/phlox_drawer/blob/master/assets/drawer2.gif) |![flutter drawer](https://github.com/phloxCompany/phlox_drawer/blob/master/assets/drawer3.gif)
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

image :
![flutter drawer](https://github.com/phloxCompany/phlox_drawer/blob/master/assets/drawer1.gif)
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
image :
![flutter drawer](https://github.com/phloxCompany/phlox_drawer/blob/master/assets/drawer2.gif)
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
image :
![flutter drawer](https://github.com/phloxCompany/phlox_drawer/blob/master/assets/drawer3.gif)
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
