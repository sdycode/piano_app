import 'package:flutter/material.dart';
import 'package:piano_app/providers/provider.dart';
import 'package:piano_app/constants/sizes.dart';
import 'package:provider/provider.dart';

class OctaveSlider extends StatelessWidget {
  final ScrollController controller;
  const OctaveSlider({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double pos = 0;
    if (controller.hasClients) {
      pos = controller.offset;
    }
    return Consumer<KeyProvider>(
      builder: (context, provider, child) {
        return GestureDetector(
          onHorizontalDragUpdate: (d) {
            controller.jumpTo(controller.offset + d.delta.dx);
            // setState(() {});
            provider.notifyListeners();
          },
          child: Container(
            height: h - whiteKeyHeight,
            width: w,
            color: Colors.amber,
            child: Stack(children: [
              Positioned(
                  left: pos,
                  child: Container(
                    width: 20,
                    height: h - whiteKeyHeight,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(4)),
                  )),
              Positioned(
                  right: 60,
                  child: Text(
                    provider.keyPressed,
                    style: TextStyle(fontSize: 35),
                  ))
            ]),
          ),
        );
      },
    );
  }
}
