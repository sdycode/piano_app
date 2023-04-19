import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:piano_app/providers/provider.dart';
import 'package:piano_app/constants/sizes.dart';
import 'package:piano_app/widgets/OctaveUI.dart';
import 'package:provider/provider.dart';

class OctaveSlider extends StatelessWidget {
  final ScrollController controller;
  const OctaveSlider({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    KeyProvider keyProvider = Provider.of<KeyProvider>(context);
    double pos = 0;
    if (controller.hasClients) {
      pos =
          (controller.offset / (controller.position.maxScrollExtent + 100)) * w;
    } else {
      pos = w * 0.4;
    }
    return Consumer<KeyProvider>(
      builder: (context, provider, child) {
        return GestureDetector(
          onHorizontalDragUpdate: (d) {
            double newPosition = controller.offset +
                d.delta.dx * (controller.position.maxScrollExtent / w);
            controller.jumpTo(newPosition
                // controller.offset + d.delta.dx
                );

            log("oct1 $newPosition width ${w * 0.7} / ${controller.position.maxScrollExtent} /  w $w / $h");
            // setState(() {});
            keyProvider.notifyListeners();
          },
          child: Container(
            height: h - whiteKeyHeight,
            width: w,
            color: Colors.white,
            child: Stack(children: [
              Transform.translate(
                offset: Offset(-w * 0.4, 0),
                child: Transform.scale(
                    // scaleX: 0.04,
                    scaleX: (controller.hasClients)
                        ? w / (controller.position.maxScrollExtent + 100)
                        : (700 / 3500),
                    scaleY: ((h - whiteKeyHeight) / whiteKeyHeight) * 5,
                    child: Row(
                      children: [
                        OctaveUI(0),
                        OctaveUI(0),
                        OctaveUI(0),
                        OctaveUI(0),
                        OctaveUI(0),
                        OctaveUI(0),
                        OctaveUI(0),
                      ],
                    )),
              ),
              // OctaveUI(1),
              // OctaveUI(2),
              // OctaveUI(3),
              // OctaveUI(4),
              // OctaveUI(5),
              // OctaveUI(6),
              Positioned(
                  left: pos,
                  child: Container(
                    width: 100,
                    height: h - whiteKeyHeight,
                    decoration: BoxDecoration(
                        border: Border.all(width: 8),
                        color: Colors.transparent,
                        // color: Colors.red,
                        borderRadius: BorderRadius.circular(12)),
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
