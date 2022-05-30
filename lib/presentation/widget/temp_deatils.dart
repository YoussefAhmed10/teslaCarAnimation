import 'package:flutter/material.dart';
import 'package:tesla_animated_app/logic/homecubit.dart';
import 'package:tesla_animated_app/presentation/shared/local/constanse.dart';
import 'package:tesla_animated_app/presentation/widget/temp_btnchange.dart';

// ignore: must_be_immutable
class TempDetails extends StatefulWidget {
  const TempDetails({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  final HomeCubit cubit;

  @override
  State<TempDetails> createState() => _TempDetailsState();
}

class _TempDetailsState extends State<TempDetails> {
  int counter = 20;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 120,
            child: Row(
              children: [
                TempButton(
                  isActive: widget.cubit.isCoolSelected,
                  svgImg: 'assets/icons/coolShape.svg',
                  title: 'cool',
                  press: widget.cubit.isActiveTemp,
                ),
                const SizedBox(width: 15),
                TempButton(
                  isActive: !widget.cubit.isCoolSelected,
                  svgImg: 'assets/icons/heatShape.svg',
                  title: 'heat',
                  activeColor: redColor,
                  press: widget.cubit.isActiveTemp,
                ),
              ],
            ),
          ),
          const Spacer(),
          Column(
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  setState(() {
                    counter++;
                  });
                },
                icon: const Icon(
                  Icons.arrow_drop_up,
                  size: 48,
                ),
              ),
              Text(
                '$counter' '\u2103',
                style: const TextStyle(fontSize: 70),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  setState(() {
                    counter--;
                  });
                },
                icon: const Icon(
                  Icons.arrow_drop_down,
                  size: 48,
                ),
              ),
            ],
          ),
          const Spacer(),
          const Text('CURRENT TEMPRTURE'),
          const SizedBox(height: defaultPadding),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Inside".toUpperCase()),
                  Text('20' '\u2103',
                      style: Theme.of(context).textTheme.headline5)
                ],
              ),
              const SizedBox(width: defaultPadding),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Outside".toUpperCase(),
                    style: const TextStyle(color: Colors.white54),
                  ),
                  Text(
                    '35' '\u2103',
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        ?.copyWith(color: Colors.white54),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
