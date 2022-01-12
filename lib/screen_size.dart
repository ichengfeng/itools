import 'dart:ui';

class Screen {
  /*Physical resolution of mobile phone*/
  static double physicalWidth = 0;
  static double physicalHeight = 0;
  /*Logical resolution*/
  static double screenWidth = 0;
  static double screenHeight = 0;
  /*Status bar height/Bottom safety zone height*/
  static double statusHeight = 0;
  static double bottomHeight = 0;
  static double dpr = 1;
  static double rpx = 1;
  static double px = 1;

  static void initialize({double standardSize = 750}) {
    //1、Physical resolution of mobile phone
    physicalWidth = window.physicalSize.width;
    physicalHeight = window.physicalSize.height;

    //2、get dpr
    dpr = window.devicePixelRatio;

    //3、Get the size of the phone screen (logical resolution)
    screenWidth = physicalWidth / dpr;
    screenHeight = physicalHeight / dpr;

    //4、Status bar height/Bottom safety zone height
    statusHeight = window.padding.top / dpr;
    bottomHeight = window.padding.bottom / dpr;

    //5、Calculate the size of rpx/px
    rpx = screenWidth / standardSize;
    px = screenWidth / standardSize * 2;
  }

  static double setRpx(double size) {
    return rpx * size;
  }

  static double setPx(double size) {
    return px * size;
  }
}

/*
* Extension method of px in double data type.
* */
extension DoubleExtension on double {
  double get rpx => Screen.rpx * this;
  double get px => Screen.px * this;
}

/*
* Extension method of px in int data type.
* */
extension IntExtension on int {
  double get rpx => Screen.rpx * this;
  double get px => Screen.px * this;
}
