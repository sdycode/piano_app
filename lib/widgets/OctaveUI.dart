import 'package:flutter/material.dart';
import 'package:piano_app/screens/screen1.dart';
import 'package:piano_app/constants/sizes.dart';
import 'package:piano_app/widgets/BlackKeyWidget.dart';
import 'package:piano_app/widgets/WhiteKeyWidget.dart';

class OctaveUI extends StatefulWidget {
  int octaveNo;
  OctaveUI(
    this.octaveNo, {
    Key? key,
  }) : super(key: key);

  @override
  State<OctaveUI> createState() => _OctaveUIState();
}

class _OctaveUIState extends State<OctaveUI> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: w * 0.7,
      // margin: EdgeInsets.symmetric(horizontal: 50),
      height: whiteKeyHeight,
      color: Colors.pink,
      child: Stack(
        children: [
          Container(
            width: w * 0.7,
            height: whiteKeyHeight,
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 7,
                scrollDirection: Axis.horizontal,
                itemBuilder: (c, indx) {
                  return WhiteKeyWidget(
                    indx,
                    widget.octaveNo,
                  );
                }),
          ),
          ...List.generate(blackKeysPositions.length, (i) {
            return Positioned(
                left:
                    blackKeysPositions[i] * whiteKeyWidth - blackKeyWidth * 0.5,
                child: BlackKeyWidget(
                  i,
                  widget.octaveNo,
                ));
          })
        ],
      ),
    );
  }
}
