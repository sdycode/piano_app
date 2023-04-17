import 'package:piano_app/screens/screen1.dart';
import 'dart:developer' as de;
import '../constants/sound_paths.dart';

playSoundOnTap(
  int octaveNo,
  String keyName,
) async 


{
  de.log(
      "${octaveNo} /${audioCache?.loadedFiles.length} / playSoundOnTap called ${soundPathsForAllOctaves[octaveNo]![keyName]!} /  ");
  try {
    Uri? file = await audioCache
        ?.load(soundPathsForAllOctaves[octaveNo]![keyName]!.trim());
    de.log("playSoundOnTap audio loaded");
    audioCache?.play(
        // "A5.wav"
        soundPathsForAllOctaves[octaveNo]![keyName]!
        //
        );
  } catch (e) {
    de.log("playSoundOnTap audio NOT loaded $e");
  }

  // audioPlayer?.play(

  //   Source.
  //   soundPathsForAllOctaves[octaveNo]![keyName]!);
  // de.log("keypressed $keyName  // $keyPressed");
}

