
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:piano_app/constants/data.dart';
import 'package:piano_app/constants/sizes.dart';
import 'package:piano_app/functions/playSoundOnTap.dart';
import 'package:piano_app/providers/provider.dart';
import 'package:piano_app/widgets/CircleBlurPainter.dart';
import 'package:provider/provider.dart';

class BlackKeyWidget extends StatefulWidget {
  final int i;
  final int octaveNo;
  BlackKeyWidget(this.i, this.octaveNo, {Key? key}) : super(key: key);

  @override
  State<BlackKeyWidget> createState() => _BlackKeyWidgetState();
}

class _BlackKeyWidgetState extends State<BlackKeyWidget> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
  log("ontap");
      },
      onTapCancel: () {
        // de.log("onTapCancel");
        setState(() {
          isPressed = false;
        });
      },
      onTapDown: (d) {
        // de.log("onTapDown");
        Provider.of<KeyProvider>(context, listen: false).keyPressed =
            blackKeysNames[widget.i] ?? "Ab";
        Provider.of<KeyProvider>(context, listen: false).notifyListeners();
        playSoundOnTap(widget.octaveNo, blackKeysNames[widget.i] ?? "Ab");
        setState(() {
          isPressed = true;
        });
      },
      onTapUp: (d) {
        // de.log("onTapUp");
        setState(() {
          isPressed = false;
        });
      },
      child: Transform.scale(
        origin: Offset(0, 0),
        alignment: Alignment.topCenter,
        // scale: 1,
        scaleX: isPressed ? 0.96 : 1,
        //  scaleY:  isPressed ? 0.994 : 1,
        child: Transform(
          transform: Matrix4.rotationX(isPressed ? 0.24 : 0),
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(8), top: Radius.circular(3)),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                color: isPressed ? Colors.black : Colors.black,
              ),
              width: blackKeyWidth,
              height: blackKeyHeight,
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: Duration(milliseconds: 20),
                    left: blackKeyWidth * 0.1,
                    top:
                        isPressed ? blackKeyHeight * 0.2 : blackKeyHeight * 0.6,
                    child: Container(
                      width: blackKeyWidth * 0.3,
                      height: blackKeyHeight * 0.16,
                      color: Colors.transparent,
                      child: CustomPaint(
                          painter: CircleBlurPainter(
                              height: blackKeyHeight * 0.16,
                              width: blackKeyWidth * 0.16,
                              blurSigma: 1)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

