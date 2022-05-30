import 'package:flutter/material.dart';
import 'package:tesla_animated_app/data/models/tyre_psi.dart';
import 'package:tesla_animated_app/presentation/shared/local/constanse.dart';

class GridViewForTileDetailes extends StatelessWidget {
  const GridViewForTileDetailes({
    Key? key,
    required this.isShowTyreCard,
    required this.tyrePsi,
  }) : super(key: key);
  final bool isShowTyreCard;
  final TyrePsi tyrePsi;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color:
            tyrePsi.isLowPressure ? redColor.withOpacity(0.2) : Colors.white10,
        border: Border.all(
          color: tyrePsi.isLowPressure ? redColor : primaryColor,
          width: 2,
        ),
      ),
      child: isShowTyreCard
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                lowpressuretext(context),
                const Spacer(),
                textpsi(context, psi: tyrePsi.psi.toString()),
                const SizedBox(height: defaultPadding),
                Text(
                  '${tyrePsi.temp}\u2103',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textpsi(context, psi: tyrePsi.psi.toString()),
                const SizedBox(height: defaultPadding),
                Text(
                  '${tyrePsi.temp}\u2103',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                lowpressuretext(context),
              ],
            ),
    );
  }

  Column lowpressuretext(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'LOW',
          style: Theme.of(context)
              .textTheme
              .headline4!
              .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Text(
          'PRESSAURE',
          style: Theme.of(context).textTheme.headline6!.copyWith(
                color: Colors.white,
              ),
        ),
      ],
    );
  }

  Text textpsi(BuildContext context, {required String psi}) {
    return Text.rich(
      TextSpan(
        text: psi,
        style: Theme.of(context).textTheme.headline4!.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
        children: const [
          TextSpan(
            text: 'psi',
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}
