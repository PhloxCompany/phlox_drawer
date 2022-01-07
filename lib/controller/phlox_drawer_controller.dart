import 'package:phlox_drawer/components/phlox_drawer_interfaces.dart';
import 'package:phlox_drawer/components/phlox_drawer_state.dart';

typedef _StartAnimation = Function();
typedef _CloseAnimation = Function();

class PhloxDrawerController {

  late _StartAnimation start;

  late _CloseAnimation close;

  late PhloxDrawerProgress progress;
  

  PhloxDrawerState phloxDrawerState = PhloxDrawerState.closed;

  void startAnimation() {
    start.call();
    phloxDrawerState = PhloxDrawerState.opened;
  }

  void closeAnimation() {
    close.call();
    phloxDrawerState = PhloxDrawerState.closed;
  }

  void changeProgress(double value){
    progress.call(value);
  }

  void toggle() => phloxDrawerState == PhloxDrawerState.opened
      ? closeAnimation()
      : startAnimation();
}
