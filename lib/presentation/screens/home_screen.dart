import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tesla_animated_app/data/models/tyre_psi.dart';
import 'package:tesla_animated_app/logic/homecubit.dart';
import 'package:tesla_animated_app/logic/homestate.dart';
import 'package:tesla_animated_app/presentation/shared/local/constanse.dart';
import 'package:tesla_animated_app/presentation/widget/battery_status.dart';
import 'package:tesla_animated_app/presentation/widget/door_lock.dart';
import 'package:tesla_animated_app/presentation/widget/temp_deatils.dart';
import 'package:tesla_animated_app/presentation/widget/tyre.dart';
import 'package:tesla_animated_app/presentation/widget/tyre_detials_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final AnimationController batteryAnmationController;
  late Animation<double> batteryAnimation;
  late Animation<double> animationBatteryStatus;

  late final AnimationController carAnmiationController;
  late Animation<double> carAnmiation;
  late Animation<double> animationTempInfoDeatials;
  late Animation<double> animationGlowColor;

  late final AnimationController tyreShowedStatusController;
  late Animation<double> tyre1Psi;
  late Animation<double> tyre2Psi;
  late Animation<double> tyre3Psi;
  late Animation<double> tyre4Psi;
  late List<Animation<double>> tyreAnimation;

  void setupAnimatonBattery() {
    batteryAnmationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    batteryAnimation = CurvedAnimation(
      parent: batteryAnmationController,
      curve: const Interval(0.0, 0.5),
    );
    animationBatteryStatus = CurvedAnimation(
      parent: batteryAnmationController,
      curve: const Interval(0.6, 1),
    );
  }

  void setupAnimationForCar() {
    carAnmiationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    carAnmiation = CurvedAnimation(
      parent: carAnmiationController,
      curve: const Interval(0.0, 0.2),
    );
    animationTempInfoDeatials = CurvedAnimation(
      parent: carAnmiationController,
      curve: const Interval(0.45, 0.60),
    );
    animationGlowColor = CurvedAnimation(
      parent: carAnmiationController,
      curve: const Interval(0.7, 1),
    );
  }

  void setupAnimationForTyre() {
    tyreShowedStatusController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    tyre1Psi = CurvedAnimation(
      parent: tyreShowedStatusController,
      curve: const Interval(0.34, 0.5),
    );
    tyre2Psi = CurvedAnimation(
      parent: tyreShowedStatusController,
      curve: const Interval(0.66, 0.72),
    );
    tyre3Psi = CurvedAnimation(
      parent: tyreShowedStatusController,
      curve: const Interval(0.72, 0.88),
    );
    tyre4Psi = CurvedAnimation(
      parent: tyreShowedStatusController,
      curve: const Interval(0.88, 1),
    );
  }

  @override
  void initState() {
    setupAnimatonBattery();
    setupAnimationForCar();
    setupAnimationForTyre();
    tyreAnimation = [tyre1Psi, tyre2Psi, tyre3Psi, tyre4Psi];
    super.initState();
  }

  @override
  void dispose() {
    batteryAnmationController.dispose();
    carAnmiationController.dispose();
    tyreShowedStatusController.dispose();
    super.dispose();
  }

  late final AnimationController _controller = AnimationController(
    vsync: this,
  );
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeStates>(
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return AnimatedBuilder(
            animation: Listenable.merge([
              _controller,
              batteryAnmationController,
              carAnmiationController,
              tyreShowedStatusController
            ]),
            builder: (context, snapshot) {
              return Scaffold(
                body: SafeArea(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            height: constraints.maxHeight,
                            width: constraints.maxWidth,
                          ),
                          Positioned(
                            left: constraints.maxWidth / 2 * carAnmiation.value,
                            height: constraints.maxHeight,
                            width: constraints.maxWidth,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: constraints.maxHeight * 0.1),
                              child: SvgPicture.asset(
                                'assets/icons/Car.svg',
                                width: double.infinity,
                              ),
                            ),
                          ),
                          AnimatedPositioned(
                            duration: defaultDuration,
                            right: cubit.currentIndex == 0
                                ? constraints.maxHeight * 0.03
                                : constraints.maxHeight * 0.25,
                            child: AnimatedOpacity(
                              duration: defaultDuration,
                              opacity: cubit.currentIndex == 0 ? 1 : 0,
                              child: DoorLock(
                                press: cubit.updateRightdoorLock,
                                locked: cubit.isRight,
                              ),
                            ),
                          ),
                          AnimatedPositioned(
                            duration: defaultDuration,
                            left: cubit.currentIndex == 0
                                ? constraints.maxHeight * 0.03
                                : constraints.maxHeight * 0.25,
                            child: AnimatedOpacity(
                              duration: defaultDuration,
                              opacity: cubit.currentIndex == 0 ? 1 : 0,
                              child: DoorLock(
                                press: cubit.updateLeftdoorLock,
                                locked: cubit.isLeft,
                              ),
                            ),
                          ),
                          AnimatedPositioned(
                            duration: defaultDuration,
                            top: cubit.currentIndex == 0
                                ? constraints.maxHeight * 0.14
                                : constraints.maxHeight * 0.45,
                            child: AnimatedOpacity(
                              duration: defaultDuration,
                              opacity: cubit.currentIndex == 0 ? 1 : 0,
                              child: DoorLock(
                                press: cubit.updateTopdoorLock,
                                locked: cubit.isTop,
                              ),
                            ),
                          ),
                          AnimatedPositioned(
                            duration: defaultDuration,
                            bottom: cubit.currentIndex == 0
                                ? constraints.maxHeight * 0.18
                                : constraints.maxHeight * 0.45,
                            child: AnimatedOpacity(
                              duration: defaultDuration,
                              opacity: cubit.currentIndex == 0 ? 1 : 0,
                              child: DoorLock(
                                press: cubit.updateBottomdoorLock,
                                locked: cubit.isBottom,
                              ),
                            ),
                          ),
                          //BatteryThings
                          AnimatedOpacity(
                            duration: defaultDuration,
                            opacity: batteryAnimation.value,
                            child: SvgPicture.asset(
                              'assets/icons/Battery.svg',
                              width: constraints.maxWidth * 0.5,
                            ),
                          ),
                          Positioned(
                            top: 50 * (1 - animationBatteryStatus.value),
                            height: constraints.maxHeight,
                            width: constraints.maxWidth,
                            child: Opacity(
                              opacity: animationBatteryStatus.value,
                              child: BatteryStatus(constraints: constraints),
                            ),
                          ),
                          //Temp
                          Positioned(
                            height: constraints.maxHeight,
                            width: constraints.maxWidth,
                            top: 60 * (1 - animationTempInfoDeatials.value),
                            child: Opacity(
                              opacity: animationTempInfoDeatials.value,
                              child: TempDetails(cubit: cubit),
                            ),
                          ),
                          Positioned(
                            right: -180 * (1 - animationGlowColor.value),
                            child: AnimatedSwitcher(
                              duration: defaultDuration,
                              child: cubit.isCoolSelected
                                  ? Image.asset(
                                      'assets/images/Cool_glow_2.png',
                                      width: 200,
                                    )
                                  : Image.asset(
                                      'assets/images/Hot_glow_4.png',
                                      width: 200,
                                    ),
                            ),
                          ),
                          //Tyre
                          if (cubit.isShowTyre) ...tyrePositiend(constraints),
                          if (cubit.isShowTyreStatus)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GridView.builder(
                                itemCount: 4,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 16,
                                  crossAxisSpacing: 16,
                                  childAspectRatio: constraints.maxWidth /
                                      constraints.maxHeight,
                                ),
                                itemBuilder: (context, index) =>
                                    ScaleTransition(
                                  scale: tyreAnimation[index],
                                  child: GridViewForTileDetailes(
                                    isShowTyreCard: index > 1,
                                    tyrePsi: demoPsiList[index],
                                  ),
                                ),
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                ),
                bottomNavigationBar: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  currentIndex: cubit.currentIndex,
                  onTap: (int index) {
                    if (index == 1) {
                      batteryAnmationController.forward();
                    } else if (cubit.currentIndex == 1 && index != 1) {
                      batteryAnmationController.reverse(from: 0.2);
                    }
                    if (index == 2) {
                      carAnmiationController.forward();
                    } else if (cubit.currentIndex == 2 && index != 2) {
                      carAnmiationController.reverse(from: 0.4);
                    }
                    if (index == 3) {
                      tyreShowedStatusController.forward();
                    } else if (cubit.currentIndex == 3 && index != 3) {
                      tyreShowedStatusController.reverse(from: 0.4);
                    }
                    cubit.shwoedTyre(index);
                    cubit.shwoedTyreStatus(index);
                    cubit.changeBottomNavItem(index);
                  },
                  backgroundColor: Colors.black,
                  items: List.generate(
                    cubit.bottomNavigationBarItem.length,
                    (index) => BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        cubit.bottomNavigationBarItem[index],
                        color: index == cubit.currentIndex
                            ? primaryColor
                            : Colors.white54,
                      ),
                      label: '',
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
