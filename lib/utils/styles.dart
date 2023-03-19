import 'package:flutter/material.dart';

class AppColors {
  // ============ grayscale ===========
  static const white = Color.fromRGBO(255, 255, 255, 1);
  static const grayTransparent = Color.fromRGBO(176, 176, 176, .1);
  static const grayTransparent2 = Color.fromRGBO(176, 176, 176, .2);
  static const gray = Color.fromRGBO(139, 139, 139, 1);
  static const blueGrey = Color(0xfff2f4f6);
  static const whiteGrey = Color.fromRGBO(210, 210, 210, 1.0);
  static const grayTransparent30 = Color.fromRGBO(139, 139, 139, .3);
  static const black = Color.fromRGBO(0, 0, 0, 1);
  static const blackTransparent = Color.fromRGBO(0, 0, 0, .5);

  // ============== pink ==============
  static const pink10 = Color.fromRGBO(255, 245, 245, 1);
  static const pink15 = Color.fromRGBO(255, 221, 234, .6);
  static const pink20 = Color.fromRGBO(255, 210, 227, 1);
  static const pink30 = Color.fromRGBO(250, 173, 202, 1);
  static const pink40 = Color.fromRGBO(255, 133, 188, 1);
  static const pink60 = Color.fromRGBO(216, 0, 112, 1);
  static const pinkAccent = Color.fromRGBO(255, 2, 154, 1);

  static const blue = Color.fromRGBO(67, 95, 189, 1.0);
  static const green = Color.fromRGBO(99, 175, 67, 1);

  const AppColors();
}

class TextStyles {
  // example
  // Text("data", style: const TextStyle(color: AppColors.pinkAccent).merge(TextStyles.bold20))

  static const splashTitle = TextStyle(
      fontFamily: "JustMeAgainDownHere",
      fontSize: 150,
      color: AppColors.pink60);
  static const appBarTitle = TextStyle(
      fontFamily: "JustMeAgainDownHere", fontSize: 48, color: AppColors.black);

  static const medium24 = TextStyle(
      fontFamily: "NotoSans",
      fontSize: 24,
      fontWeight: FontWeight.w500); //review form
  static const bold24 = TextStyle(
      fontFamily: "NotoSans", fontSize: 24, fontWeight: FontWeight.w900);
  static const medium20 = TextStyle(
      fontFamily: "NotoSans", fontSize: 20, fontWeight: FontWeight.w500);
  static const bold20 = TextStyle(
      fontFamily: "NotoSans",
      fontSize: 20,
      fontWeight: FontWeight.w900); //타이틀, 강서구 마곡동
  static const medium18 = TextStyle(
      fontFamily: "NotoSans", fontSize: 18, fontWeight: FontWeight.w500);
  static const bold18 = TextStyle(
      fontFamily: "NotoSans", fontSize: 18, fontWeight: FontWeight.w900);
  static const regular16 = TextStyle(
      fontFamily: "NotoSans", fontSize: 16, fontWeight: FontWeight.w400);
  static const medium16 = TextStyle(
      fontFamily: "NotoSans", fontSize: 16, fontWeight: FontWeight.w500);
  static const semiBold16 = TextStyle(
      fontFamily: "NotoSans", fontSize: 16, fontWeight: FontWeight.w700);
  static const bold16 = TextStyle(
      fontFamily: "NotoSans", fontSize: 16, fontWeight: FontWeight.w900);
  static const light14 = TextStyle(
      fontFamily: "NotoSans", fontSize: 14, fontWeight: FontWeight.w300);
  static const regular14 = TextStyle(
      fontFamily: "NotoSans", fontSize: 14, fontWeight: FontWeight.w400);
  static const medium14 = TextStyle(
      fontFamily: "NotoSans", fontSize: 14, fontWeight: FontWeight.w500);
  static const semiBold14 = TextStyle(
      fontFamily: "NotoSans", fontSize: 14, fontWeight: FontWeight.w700);
  static const bold14 = TextStyle(
      fontFamily: "NotoSans", fontSize: 14, fontWeight: FontWeight.w900);
  static const medium12 = TextStyle(
      fontFamily: "NotoSans", fontSize: 12, fontWeight: FontWeight.w500);
  static const regular12 = TextStyle(
      fontFamily: "NotoSans", fontSize: 12, fontWeight: FontWeight.w700);
  static const bold12 = TextStyle(
      fontFamily: "NotoSans", fontSize: 12, fontWeight: FontWeight.w900);

  static TextStyle orderSelected = TextStyles.semiBold14;
  static TextStyle orderUnselected =
      TextStyles.regular14.merge(const TextStyle(color: AppColors.gray));

  const TextStyles();
}
