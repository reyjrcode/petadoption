import 'dart:math';

import 'package:flutter/material.dart';

const Color background = Color(0xFFECE7E7);
// const Color textfieldcolor = Color(0xFFFF0F69F);
const Color buttoncolor = Color(0xffD8EFF0);
const Color purple = Color(0xff674188);
const Color purple1 = Color(0xffC3ACD0);
const Color purple2 = Color(0xffF7EFE5);

Color randompickcolor() {
  final colorlist = [background, buttoncolor, purple, purple1, purple2];
  final random = Random().nextInt(colorlist.length);
  return colorlist[random];
}
