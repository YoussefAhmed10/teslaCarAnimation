import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tesla_animated_app/logic/homestate.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(InitialHomeState());

  static HomeCubit get(context) => BlocProvider.of(context);

  bool isRight = false;
  bool isLeft = false;
  bool isTop = false;
  bool isBottom = false;

  void updateRightdoorLock() {
    isRight = !isRight;
    emit(HomeChangeIconSuccessState());
  }

  void updateLeftdoorLock() {
    isLeft = !isLeft;
    emit(HomeChangeIconSuccessState());
  }

  void updateTopdoorLock() {
    isTop = !isTop;
    emit(HomeChangeIconSuccessState());
  }

  void updateBottomdoorLock() {
    isBottom = !isBottom;
    emit(HomeChangeIconSuccessState());
  }

  int currentIndex = 0;

  List<String> bottomNavigationBarItem = [
    'assets/icons/Lock.svg',
    'assets/icons/Charge.svg',
    'assets/icons/Temp.svg',
    'assets/icons/Tyre.svg',
  ];
  void changeBottomNavItem(int index) {
    currentIndex = index;
    emit(HomeChangeBottmNavItemSuccessState());
  }

  bool isCoolSelected = true;
  void isActiveTemp() {
    isCoolSelected = !isCoolSelected;
    emit(HomeCoolSelectedSuccessState());
  }

  bool isShowTyre = false;

  void shwoedTyre(int index) {
    if (currentIndex != 3 && index == 3) {
      Future.delayed(
        const Duration(milliseconds: 500),
        () {
          isShowTyre = true;
          emit(HomeShowTyreSuccessState());
        },
      );
    } else {
      isShowTyre = false;
      emit(HomeNotShowTyreSuccessState());
    }
  }

  bool isShowTyreStatus = false;

  void shwoedTyreStatus(int index) {
    if (currentIndex != 3 && index == 3) {
      // Future.delayed(const Duration(milliseconds: 500), () {
      isShowTyreStatus = true;
      emit(HomeShowTyreStatusSuccessState());
      // });
    } else {
      Future.delayed(
        const Duration(milliseconds: 700),
        () {
          isShowTyreStatus = false;
          emit(HomeNotShowTyreStatusSuccessState());
        },
      );
    }
  }
}
