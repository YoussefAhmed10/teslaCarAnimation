import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tesla_animated_app/presentation/shared/local/constanse.dart';

class DoorLock extends StatelessWidget {
  const DoorLock({
    Key? key,
    required this.press,
    required this.locked,
  }) : super(key: key);

  final VoidCallback press;
  final bool locked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: AnimatedSwitcher(
        switchInCurve: Curves.easeInBack,
        duration: defaultDuration,
        transitionBuilder: (child, animation) => ScaleTransition(
          scale: animation,
          child: child,
        ),
        child: locked
            ? SvgPicture.asset(
                'assets/icons/door_unlock.svg',
                key: const ValueKey('unlock'),
              )
            : SvgPicture.asset(
                'assets/icons/door_lock.svg',
                key: const ValueKey('lock'),
              ),
      ),
    );
  }
}
