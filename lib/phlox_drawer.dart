library phlox_drawer;

import 'package:flutter/material.dart';
import 'package:phlox_drawer/components/phlox_drawer_type.dart';
import 'package:phlox_drawer/controller/phlox_drawer_controller.dart';
import 'package:phlox_drawer/controller/phlox_drawer_option.dart';
import 'components/phlox_drawer_interfaces.dart';


/// [PhloxDrawer] is custom drawer in flutter
/// you can use it instead of drawer in
/// [Scaffold]

class PhloxDrawer extends StatefulWidget {
  /// [context] for height and width in page
  /// [controller] is your drawer controller
  /// [mainPage] is your main page like Scaffold
  /// inside [options] , you can add some of the options for
  /// phloxDrawer like 2 screen, 3 screen and other options for that
  /// [duration] is time from start to end
  /// [progress] is drawer opening progress

  final BuildContext context;
  final PhloxDrawerController controller;
  final Widget drawerPage;
  final Widget mainPage;
  final PhloxDrawerOption? options;
  final Duration? duration;
  final PhloxDrawerProgress? progress;

  const PhloxDrawer({
    Key? key,
    required this.context,
    required this.controller,
    required this.drawerPage,
    required this.mainPage,
    this.options,
    this.duration,
    this.progress,
  }) : super(key: key);

  @override
  _PhloxDrawerState createState() => _PhloxDrawerState();
}

class _PhloxDrawerState extends State<PhloxDrawer>
    with SingleTickerProviderStateMixin {

  /// these animations is our custom animations for [PhloxDrawer]
  /// you can use [move] in x or y , [scale] , [rotate], [opacity]
  /// page [rounded] or [progress]
  late AnimationController _animationController;
  late Animation<double> _moveY;
  late Animation<double> _moveX;
  late Animation<double> _scale;
  late Animation<double> _rotate;
  late Animation<double> _opacity;
  late Animation<double> _rounded;
  late Animation<double> _progress;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        duration: widget.duration ?? const Duration(milliseconds: 240),
        vsync: this);

    _moveY = Tween<double>(
            begin: widget.options?.moveY?.begin ?? 0,
            end: widget.options?.moveY?.end ?? 0)
        .animate(_animationController);
    _moveX = Tween<double>(
            begin: widget.options?.moveX?.begin ?? 0,
            end: widget.options?.moveX?.end ??
                MediaQuery.of(widget.context).size.width * .85)
        .animate(_animationController);
    _scale = Tween<double>(
            begin: widget.options?.scale?.begin ?? 1,
            end: widget.options?.scale?.end ?? .86)
        .animate(_animationController);
    _rotate = Tween<double>(
            begin: widget.options?.rotate?.begin ?? 0,
            end: widget.options?.rotate?.end ?? 0)
        .animate(_animationController);
    _opacity = Tween<double>(
            begin: widget.options?.opacity?.begin ?? 1,
            end: widget.options?.opacity?.end ?? 1)
        .animate(_animationController);
    _rounded = Tween<double>(
            begin: widget.options?.radius?.begin ?? 0,
            end: widget.options?.radius?.end ?? 12)
        .animate(_animationController);
    _progress = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        setState(() {
          widget.controller.changeProgress(_progress.value);
        });
      });

    widget.controller.start = () {
      _animationController.forward();
    };
    widget.controller.close = () {
      _animationController.reverse();
    };
    widget.controller.progress = (value) {
      widget.progress?.call(double.parse(value.toStringAsFixed(2)));
    };
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.drawerPage,

        // mainPageBackgroundWidget()
        if (widget.options?.drawerType == PhloxDrawerType.twoScreen)
          AnimatedBuilder(
            animation: _progress,
            builder: (context, child) =>
                _animatedBackgroundWidget(context, child, .2),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: widget.mainPage,
            ),
          ),

        // mainPageBackgroundWidget()
        if (widget.options?.drawerType == PhloxDrawerType.threeScreen)
          AnimatedBuilder(
            animation: _progress,
            builder: (context, child) => Stack(
              children: [
                _animatedBackgroundWidget(context, child, .3),
                _animatedBackgroundWidget(context, child, .6),
              ],
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: widget.mainPage,
            ),
          ),

        AnimatedBuilder(
          animation: _progress,
          builder: _animatedWidget,
          child: widget.mainPage,
        ),
      ],
    );
  }

  Widget _animatedWidget(context, child) {
    return Opacity(
      opacity: _opacity.value,
      child: RotationTransition(
        turns: AlwaysStoppedAnimation(_rotate.value / 360),
        child: Transform.scale(
          scale: _scale.value,
          child: Transform.translate(
            offset: Offset(_moveX.value, _moveY.value),
            child: Card(
              margin: EdgeInsets.zero,
              child: child,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(_rounded.value)),
              clipBehavior: Clip.antiAliasWithSaveLayer,
            ),
          ),
        ),
      ),
    );
  }

  Widget _animatedBackgroundWidget(
      BuildContext context, Widget? child, double percentage) {
    return Opacity(
      opacity: _opacity.value - (_opacity.value * percentage),
      child: RotationTransition(
        turns: AlwaysStoppedAnimation(
            (_rotate.value + (_rotate.value * percentage)) / 360),
        child: Transform.scale(
          scale: _scale.value - (_scale.value * (percentage)),
          child: Transform.translate(
            offset: Offset(_moveX.value - (_moveX.value * (percentage * .2)),
                _moveY.value - (_moveY.value * percentage)),
            child: Card(
              margin: EdgeInsets.zero,
              child: child,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(_rounded.value)),
              clipBehavior: Clip.antiAliasWithSaveLayer,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
