import 'package:phlox_drawer/components/phlox_drawer_type.dart';
import 'package:phlox_drawer/controller/phlox_drawer_tween.dart';

class PhloxDrawerOption {
  PhloxDrawerType? drawerType = PhloxDrawerType.oneScreen;
  PhloxDrawerTween? moveY;
  PhloxDrawerTween? moveX;
  PhloxDrawerTween? scale;
  PhloxDrawerTween? rotate;
  PhloxDrawerTween? opacity;
  PhloxDrawerTween? radius;
  bool? isRTL = false;

  PhloxDrawerOption({
    required this.drawerType,
    this.moveY,
    this.moveX,
    this.scale,
    this.rotate,
    this.opacity,
    this.radius,
    this.isRTL,
  });

  PhloxDrawerOption.oneScreen({
    this.moveY,
    this.moveX,
    this.scale,
    this.rotate,
    this.opacity,
    this.radius,
    this.isRTL,
  }) {
    drawerType = PhloxDrawerType.oneScreen;
  }

  PhloxDrawerOption.twoScreen({
    this.moveY,
    this.moveX,
    this.scale,
    this.rotate,
    this.opacity,
    this.radius,
    this.isRTL,
  }) {
    drawerType = PhloxDrawerType.twoScreen;
  }

  PhloxDrawerOption.threeScreen({
    this.moveY,
    this.moveX,
    this.scale,
    this.rotate,
    this.opacity,
    this.radius,
    this.isRTL,
  }) {
    drawerType = PhloxDrawerType.threeScreen;
  }

}
