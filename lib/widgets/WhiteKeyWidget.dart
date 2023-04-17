

import 'package:flutter/material.dart';
import 'package:piano_app/constants/data.dart';
import 'package:piano_app/constants/sizes.dart';
import 'package:piano_app/functions/playSoundOnTap.dart';
import 'package:piano_app/providers/provider.dart';
import 'package:provider/provider.dart';

class WhiteKeyWidget extends StatefulWidget {
  final int i;
  final int octaveNo;
  WhiteKeyWidget(this.i, this.octaveNo, {Key? key}) : super(key: key);

  @override
  State<WhiteKeyWidget> createState() => _WhiteKeyWidgetState();
}

class _WhiteKeyWidgetState extends State<WhiteKeyWidget> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapCancel: () {
        // de.log("onTapCancel");
        setState(() {
          isPressed = false;
        });
      },
      onTapDown: (d) {
        Provider.of<KeyProvider>(context, listen: false).keyPressed =
            whiteKeysNames[widget.i] ?? "A";
        Provider.of<KeyProvider>(context, listen: false).notifyListeners();
        setState(() {
          playSoundOnTap(widget.octaveNo, whiteKeysNames[widget.i] ?? "A");
          isPressed = true;
        });
      },
      onTapUp: (d) {
        setState(() {
          isPressed = false;
        });
      },
      child: Transform(
        transform: Matrix4.rotationX(isPressed ? 0.15 : 0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2),
            color: isPressed
                ? Color.fromARGB(255, 203, 187, 187)
                : Color.fromARGB(255, 233, 225, 225),
          ),
          width: whiteKeyWidth,
          height: whiteKeyHeight,
        ),
      ),
    );
  }
}

