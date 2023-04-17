// import 'package:flutter/material.dart';
// import 'package:piano_app/provider.dart';
// import 'package:piano_app/screen1.dart';
// import 'package:piano_app/sizes.dart';
// import 'package:provider/provider.dart';

// class DemoScreen extends StatefulWidget {
//   DemoScreen({Key? key}) : super(key: key);

//   @override
//   State<DemoScreen> createState() => _DemoScreenState();
// }

// List<double> _blackKeyPositions = [1, 2, 3, 5, 6];

// // As there are 5 black keys placed over 7 white keys
// class _DemoScreenState extends State<DemoScreen> {
//   ScrollController controller = ScrollController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.black,
//         body: Container(
//             width: w,
//             height: h,
//             child: Column(
//               children: [
//                 Container(
//                   width: w,
//                   height: h - whiteKeyHeight,
//                   child: demoOctaveSlider(),
//                 ),
//                 Container(width: w,
//                 height: whiteKeyHeight,
//                 child: ListView(
//                   controller: controller,
//                   scrollDirection: Axis.horizontal,
//                   children:
//                   [
//                     OctaveUI(0), 
//                        OctaveUI(1),  OctaveUI(3), 
//                   ]
//                 ),
//                 )
//                 // Stack(children: [
//                 //   Container(
//                 //     width: w,
//                 //     height: whiteKeyHeight,
//                 //     child: 
                    
                    
                    
//                 //     ListView.builder(
//                 //         itemCount: 7,
//                 //         scrollDirection: Axis.horizontal,
//                 //         itemBuilder: (c, i) {
//                 //           return DempoWhiteKey(i);
//                 //         }),
//                 //   ),
//                 //   ...List.generate(_blackKeyPositions.length, (i) {
//                 //     return Positioned(
//                 //         left: _blackKeyPositions[i] * whiteKeyWidth -
//                 //             blackKeyWidth * 0.5,
//                 //         child: _DemoBlackKeyWidget(i));
//                 //   })
//                 //   // first
//                 // ]),
//               ],
//             )));
//   }

//   demoOctaveSlider() {
//     double pos = 0;
//     if (controller.hasClients) {
//       pos = controller.offset;
//     }
//     return Consumer<KeyProvider>(
//       builder: (context, provider, child) {
//         return GestureDetector(
//           onHorizontalDragUpdate: (d) {
//             controller.jumpTo(controller.offset + d.delta.dx);
//             setState(() {});
//           },
//           child: Container(
//             height: h - whiteKeyHeight,
//             width: w,
//             color: Colors.amber,
//             child: Stack(children: [
//               Positioned(
//                   left: pos,
//                   child: Container(
//                     width: 20,
//                     height: h - whiteKeyHeight,
//                     decoration: BoxDecoration(
//                         color: Colors.red,
//                         borderRadius: BorderRadius.circular(4)),
//                   )),
//               Positioned(
//                   right: 60,
//                   child: Text(
//                     provider.keyPressed,
//                     style: TextStyle(fontSize: 35),
//                   ))
//             ]),
//           ),
//         );
//       },
//     );
//   }
// }
// class OctaveUI extends StatefulWidget {
//  int octaveNo;
//   OctaveUI(
//     this.octaveNo, {
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<OctaveUI> createState() => _OctaveUIState();
// }

// class _OctaveUIState extends State<OctaveUI> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: w * 0.7,
//       height: whiteKeyHeight,
//       child: Stack(
//         children: [
//           Container(
//             width: w * 0.7,
//             height: whiteKeyHeight,
//             child: ListView.builder(
//                 physics: NeverScrollableScrollPhysics(),
//                 itemCount: 7,
//                 scrollDirection: Axis.horizontal,
//                 itemBuilder: (c, indx) {
//                   return WhiteKeyWidget(
//                     indx,
//                     widget.octaveNo,
//                   );
//                 }),
//           ),
//           ...List.generate(blackKeysPositions.length, (i) {
//             return Positioned(
//                 left:
//                     blackKeysPositions[i] * whiteKeyWidth - blackKeyWidth * 0.5,
//                 child: BlackKeyWidget(
//                   i,
//                   widget.octaveNo,
//                 ));
//           })
//         ],
//       ),
//     );
//   }
// }
// class _DemoBlackKeyWidget extends StatefulWidget {
//   final int i;
//   _DemoBlackKeyWidget(this.i, {Key? key}) : super(key: key);

//   @override
//   State<_DemoBlackKeyWidget> createState() => __DemoBlackKeyWidgetState();
// }

// class __DemoBlackKeyWidgetState extends State<_DemoBlackKeyWidget> {
//   bool isPressed = false;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTapDown: (d) {
//         setState(() {
//           isPressed = true;
//         });
//       },
//       onTapUp: (d) {
//         setState(() {
//           isPressed = false;
//         });
//       },
//       child: Transform(
//           transform: Matrix4.rotationX(isPressed ? 0.2 : 0),
//           child: Container(
//             width: blackKeyWidth,
//             height: blackKeyHeight,
//             decoration: BoxDecoration(color: Colors.black),
//             // color:  Colors.red,
//             child: Stack(
//               children: [
//                 AnimatedPositioned(
//                   duration: Duration(milliseconds: 60),
//                   left: blackKeyWidth * 0.1,
//                   top: isPressed ? blackKeyHeight * 0.2 : blackKeyHeight * 0.6,
//                   child: Container(
//                     width: blackKeyWidth * 0.3,
//                     height: blackKeyHeight * 0.2,
//                     child: CustomPaint(
//                       size: Size(blackKeyWidth * 0.3, blackKeyHeight * 0.2),
//                       painter: DemoCircleBlurPainter(
//                           width: blackKeyWidth * 0.3,
//                           height: blackKeyHeight * 0.2),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           )),
//     );
//   }
// }

// class DemoCircleBlurPainter extends CustomPainter {
//   DemoCircleBlurPainter(
//       {required this.width, required this.height, this.blurSigma = 3});

//   double width;
//   double height;
//   double blurSigma;

//   @override
//   void paint(Canvas canvas, Size size) {
//     // Paint plane = new Paint()
//     //   ..color = Colors.white.withAlpha(200)
//     //   ..strokeCap = StrokeCap.round
//     //   ..style = PaintingStyle.stroke
//     //   ..strokeWidth = width
//     //   ..maskFilter = MaskFilter.blur(BlurStyle.normal, blurSigma);

// // We are using maskfilter to create blur effect

//     Paint line = new Paint()
//       ..color = Colors.white
//       ..strokeCap = StrokeCap.round
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = width * 0.9
//       ..maskFilter = MaskFilter.blur(BlurStyle.normal, blurSigma * 2 * 2);
//     // Offset center =  Offset(size.width / 2, size.height / 2);
//     // double radius = min(size.width / 2, size.height / 2);
//     // canvas.drawOval(Rect.fromPoints(Offset(width*0.1, height*0.2), Offset(width*0.8, height*0.8)),plane);
//     canvas.drawOval(Rect.fromPoints(Offset.zero, Offset(width, height)), line);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return true;
//   }
// }

// class DempoWhiteKey extends StatefulWidget {
//   final int i;
//   DempoWhiteKey(this.i, {Key? key}) : super(key: key);

//   @override
//   State<DempoWhiteKey> createState() => _DempoWhiteKeyState();
// }

// class _DempoWhiteKeyState extends State<DempoWhiteKey> {
//   bool isPressed = false;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTapDown: (d) {
//         setState(() {
//           isPressed = true;
//         });
//       },
//       onTapUp: (d) {
//         setState(() {
//           isPressed = false;
//         });
//       },
//       child: Transform(
//         transform: Matrix4.rotationX(isPressed ? 0.2 : 0),
//         child: Container(
//           decoration: BoxDecoration(
//               border: Border.all(color: Colors.black, width: 2),
//               color: isPressed
//                   ? Color.fromARGB(255, 214, 200, 200)
//                   : Colors.white),
//           width: whiteKeyWidth,
//           height: whiteKeyHeight,
//         ),
//       ),
//     );
//   }
// }
