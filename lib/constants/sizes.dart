import 'package:flutter/material.dart';

double h = 500;

double w = 400;

double whiteKeyWidth = 20;

double blackKeyWidth = 10;
double whiteKeyHeight = 40;

double blackKeyHeight = 30;
void initialiseSizes(BuildContext context) {
  h = MediaQuery.of(context).size.height;
  w = MediaQuery.of(context).size.width;

  whiteKeyWidth = w * 0.1;
  blackKeyWidth = w * 0.06;
  whiteKeyHeight = h * 0.85;
  blackKeyHeight = h * 0.55;
}
