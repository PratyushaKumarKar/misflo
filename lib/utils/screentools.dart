import 'package:flutter/material.dart';

width(BuildContext context, double width) {
  double screenwidth = MediaQuery.of(context).size.width * 3;
  double widthratio = width / (430 * 3);
  double newWidth = widthratio * screenwidth;
  return newWidth;
}

height(BuildContext context, double height) {
  double screenheight = MediaQuery.of(context).size.height * 3;
  double heightratio = height / (932 * 3);
  double newHeight = heightratio * screenheight;
  return newHeight;
}
