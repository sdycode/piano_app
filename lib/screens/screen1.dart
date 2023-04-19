import 'dart:developer' as de;

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:piano_app/constants/sizes.dart';
import 'package:piano_app/widgets/OctaveUI.dart';
import 'package:piano_app/widgets/octaveSlider.dart';

class Screen1 extends StatefulWidget {
 const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

AudioPlayer? audioPlayer;
AudioCache? audioCache;

class _Screen1State extends State<Screen1> {
  ScrollController controller = ScrollController(initialScrollOffset: w*0.7*3);

  @override
  void initState() {
    // TODO: implement initState
    // loadFilesInCache();

    audioPlayer = AudioPlayer(mode: PlayerMode.LOW_LATENCY);
    audioCache = AudioCache();
    // loadFilesInCache();
    de.log("isaudioca loaded ${audioCache}");

    // soundPathsForAllOctaves.forEach((key, Map<String, String> value) {
    //   audioCache?.loadAll(value.values.toList());
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // de.log("isaudioca loaded ${audioCache}");
    return Scaffold(
      backgroundColor: Colors.black45,
      body: Container(
          width: w,
          height: h,
          child: Column(
            children: [
              Container(height: h - whiteKeyHeight, child:
              
              OctaveSlider(controller: controller,),
              //  octaveSlider()
               ),
              Container(
                width: w,
                height: whiteKeyHeight,
                child: ListView(
                    controller:
                    controller,
                    //  ScrollController(initialScrollOffset: controller.offset),
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: [
                      OctaveUI(0),
                      OctaveUI(1),
                      OctaveUI(2),
                      OctaveUI(3),
                      OctaveUI(4),
                      OctaveUI(5),
                      OctaveUI(6),
                    ]),
              ),
            ],
          )),
    );
  }

  // octaveSlider() {
  //   double pos = 0;
  //   if (controller.hasClients) {
  //     pos = controller.offset;
  //   }
  //   return Consumer<KeyProvider>(
  //     builder: (context, provider, child) {
  //       return GestureDetector(
  //         onHorizontalDragUpdate: (d) {
  //           controller.jumpTo(controller.offset + d.delta.dx);
  //           setState(() {});
  //         },
  //         child: Container(
  //           height: h - whiteKeyHeight,
  //           width: w,
  //           color: Colors.amber,
  //           child: Stack(children: [
  //             Positioned(
  //                 left: pos,
  //                 child: Container(
  //                   width: 20,
  //                   height: h - whiteKeyHeight,
  //                   decoration: BoxDecoration(
  //                       color: Colors.red,
  //                       borderRadius: BorderRadius.circular(4)),
  //                 )),
  //             Positioned(
  //                 right: 60,
  //                 child: Text(
  //                   provider.keyPressed,
  //                   style: TextStyle(fontSize: 35),
  //                 ))
  //           ]),
  //         ),
  //       );
  //     },
  //   );
  // }

  Future loadFilesInCache() async {
    de.log("aloadFilesInCache}");
    // try {
    //   Uri? uri = await audioCache?.load("A1.mp3");
    //   de.log("audioCache loaded ${uri!}");
    // } catch (e) {
    //   de.log("audioCache err ${e}");
    // }
  }
}



List<double> blackKeysPositions = [1, 2, 3, 5, 6];


/* [
 "A":
"Ab":
"B":
"Bb":
"C":
"D":
"Db":
"E":
"Eb":
"F":
"G":
"Gb"
 ]
 */