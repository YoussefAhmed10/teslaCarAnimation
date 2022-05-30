import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tesla_animated_app/presentation/shared/local/constanse.dart';

class TempButton extends StatelessWidget {
  const TempButton({
    Key? key,
    required this.svgImg,
    required this.title,
    this.isActive = false,
    this.activeColor = primaryColor,
    required this.press,
  }) : super(key: key);
  final String svgImg;
  final String title;
  final bool isActive;
  final VoidCallback press;
  final Color activeColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeIn,
            width: isActive ? 76 : 55,
            height: isActive ? 76 : 55,
            child: SvgPicture.asset(
              svgImg,
              color: isActive ? activeColor : Colors.white38,
            ),
          ),
          const SizedBox(height: 5),
          AnimatedDefaultTextStyle(
            duration: const Duration(microseconds: 300),
            style: TextStyle(
              fontSize: 18,
              color: isActive ? activeColor : Colors.white38,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
            child: Text(
              title.toUpperCase(),
            ),
          )
        ],
      ),
    );
  }
}
