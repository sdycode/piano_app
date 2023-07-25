import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:piano_app/constants/sizes.dart';
import 'package:piano_app/widgets/OctaveUI.dart';
import 'package:piano_app/providers/provider.dart';
import 'package:piano_app/extensions/transform_ext.dart';
import 'package:piano_app/widgets/small_size_octave.dart';

class OctaveSlider extends StatelessWidget {
  final ScrollController controller;
  const OctaveSlider({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double scaleX = (controller.hasClients)
        ? w / (controller.position.maxScrollExtent + 100)
        : (700 / 3500);
    double scaleY = ((h - whiteKeyHeight) / whiteKeyHeight) * 5;

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

            // log("oct1 $newPosition width ${w * 0.7} / ${controller.position.maxScrollExtent} /  w $w / $h");
            // setState(() {});
            keyProvider.notifyListeners();
          },
          child: Container(
            height: h - whiteKeyHeight,
            width: w,
            color: Colors.white,
            child: Stack(children: [
              IgnorePointer(
                ignoring: true,
                child: Transform.translate(
                  offset: Offset(-w * 0.4 * 0 + 5, 0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        // Just for git push
                        
                        SmallSizeOctave(),
                        SmallSizeOctave(),
                        SmallSizeOctave(),
                        SmallSizeOctave(),
                        SmallSizeOctave(),
                        SmallSizeOctave(),
                        SmallSizeOctave(),
                      ],
                    ),
                  ),
                ),
              ),
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
                  child: Container(
                    color: Colors.amber.shade100.withAlpha(220),
                    child: Text(
                      provider.keyPressed,
                      style: TextStyle(fontSize: 35),
                    ),
                  ))
            ]),
          ),
        );
      },
    );
  }
}
