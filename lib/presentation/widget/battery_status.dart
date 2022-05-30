import 'package:flutter/material.dart';
import 'package:tesla_animated_app/presentation/shared/local/constanse.dart';

class BatteryStatus extends StatelessWidget {
  const BatteryStatus({
    required this.constraints,
    Key? key,
  }) : super(key: key);
  final BoxConstraints constraints;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '220 mi',
          style: Theme.of(context).textTheme.headline3,
        ),
        const Text(
          '62%',
          style: TextStyle(fontSize: 25),
        ),
        const Spacer(),
        const Text(
          'CHARGING',
          style: TextStyle(fontSize: 25),
        ),
        const SizedBox(height: 5),
        const Text(
          '18 min remaninig',
          style: TextStyle(fontSize: 22),
        ),
        SizedBox(height: constraints.maxHeight * 0.13),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              '22 m/h',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Spacer(),
            Text(
              '232 v',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: defaultPadding),
      ],
    );
  }
}
