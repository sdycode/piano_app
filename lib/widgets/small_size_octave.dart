import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:piano_app/constants/sizes.dart';
import 'package:piano_app/screens/screen1.dart';

class SmallSizeOctave extends StatelessWidget {
  const SmallSizeOctave({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, box) {
        double maxW = w;
        double maxH = box.maxHeight;
        log("maxx $maxH  / $maxW");
        double _whiteKeyWidth = ((maxW - 50) / (7 * 7)).floorToDouble();
        double _octaveW = _whiteKeyWidth * 7;
        double _whiteKeyHeight = maxH * 0.8;
        double _blackKeyWidth = _whiteKeyWidth * 0.6;
        double _blackKeyHeightt = _whiteKeyHeight * (55 / 85);
        return Container(
          // color: Colors.bla,
          // margin:
          //     EdgeInsets.symmetric(vertical: (maxH - _whiteKeyHeight) * 0.5),
          width: _octaveW,
          height: maxH,
          child: Center(
            child: Stack(children: [
              Row(
                children: [
                  ...List.generate(
                      7,
                      (index) => Container(
                            width: _whiteKeyWidth,
                            height: _whiteKeyHeight,
                            decoration: BoxDecoration(
                                color: Colors.white, border: Border.all()),
                          )),
                ],
              ),
              ...List.generate(blackKeysPositions.length, (i) {
                return Positioned(
                    left: blackKeysPositions[i] * _whiteKeyWidth -
                        (_blackKeyWidth) * 0.5,
                    child: Container(
                      width: _blackKeyWidth,
                      height: _blackKeyHeightt,
                      decoration: BoxDecoration(
                          color: Colors.black, border: Border.all()),
                    ));
              })
            ]),
          ),
        );
      },
    );
  }
}
