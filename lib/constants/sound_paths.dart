const String folderPath = "";
// "assets/piano_sounds/";
/*
  List<int> nos = [
    0,1,2,3,4,5,6,
  ];
  List<String> l = ["A", "Ab", "B", "Bb", "C", "D", "Db", "E", "Eb", "F", "G", "Gb"];
  for(int i=0;i<7;i++){
    print('${i} : {');
    l.forEach((e){
      print('"${e}" : "${e}${i+1}.wav",');
    });
     print(' },');
  }
  */
Map<int, Map<String, String>> soundPathsForAllOctaves = {
  0: {
    "A": "${folderPath}A1.wav",
    "Ab": "${folderPath}Ab1.wav",
    "B": "${folderPath}B1.wav",
    "Bb": "${folderPath}Bb1.wav",
    "C": "${folderPath}C1.wav",
    "D": "${folderPath}D1.wav",
    "Db": "${folderPath}Db1.wav",
    "E": "${folderPath}E1.wav",
    "Eb": "${folderPath}Eb1.wav",
    "F": "${folderPath}F1.wav",
    "G": "${folderPath}G1.wav",
    "Gb": "${folderPath}Gb1.wav",
  },
  1: {
    "A": "${folderPath}A2.wav",
    "Ab": "${folderPath}Ab2.wav",
    "B": "${folderPath}B2.wav",
    "Bb": "${folderPath}Bb2.wav",
    "C": "${folderPath}C2.wav",
    "D": "${folderPath}D2.wav",
    "Db": "${folderPath}Db2.wav",
    "E": "${folderPath}E2.wav",
    "Eb": "${folderPath}Eb2.wav",
    "F": "${folderPath}F2.wav",
    "G": "${folderPath}G2.wav",
    "Gb": "${folderPath}Gb2.wav",
  },
  2: {
    "A": "${folderPath}A3.wav",
    "Ab": "${folderPath}Ab3.wav",
    "B": "${folderPath}B3.wav",
    "Bb": "${folderPath}Bb3.wav",
    "C": "${folderPath}C3.wav",
    "D": "${folderPath}D3.wav",
    "Db": "${folderPath}Db3.wav",
    "E": "${folderPath}E3.wav",
    "Eb": "${folderPath}Eb3.wav",
    "F": "${folderPath}F3.wav",
    "G": "${folderPath}G3.wav",
    "Gb": "${folderPath}Gb3.wav",
  },
  3: {
    "A": "${folderPath}A4.wav",
    "Ab": "${folderPath}Ab4.wav",
    "B": "${folderPath}B4.wav",
    "Bb": "${folderPath}Bb4.wav",
    "C": "${folderPath}C4.wav",
    "D": "${folderPath}D4.wav",
    "Db": "${folderPath}Db4.wav",
    "E": "${folderPath}E4.wav",
    "Eb": "${folderPath}Eb4.wav",
    "F": "${folderPath}F4.wav",
    "G": "${folderPath}G4.wav",
    "Gb": "${folderPath}Gb4.wav",
  },
  4: {
    "A": "${folderPath}A5.wav",
    "Ab": "${folderPath}Ab5.wav",
    "B": "${folderPath}B5.wav",
    "Bb": "${folderPath}Bb5.wav",
    "C": "${folderPath}C5.wav",
    "D": "${folderPath}D5.wav",
    "Db": "${folderPath}Db5.wav",
    "E": "${folderPath}E5.wav",
    "Eb": "${folderPath}Eb5.wav",
    "F": "${folderPath}F5.wav",
    "G": "${folderPath}G5.wav",
    "Gb": "${folderPath}Gb5.wav",
  },
  5: {
    "A": "${folderPath}A6.wav",
    "Ab": "${folderPath}Ab6.wav",
    "B": "${folderPath}B6.wav",
    "Bb": "${folderPath}Bb6.wav",
    "C": "${folderPath}C6.wav",
    "D": "${folderPath}D6.wav",
    "Db": "${folderPath}Db6.wav",
    "E": "${folderPath}E6.wav",
    "Eb": "${folderPath}Eb6.wav",
    "F": "${folderPath}F6.wav",
    "G": "${folderPath}G6.wav",
    "Gb": "${folderPath}Gb6.wav",
  },
  6: {
    "A": "${folderPath}A7.wav",
    "Ab": "${folderPath}Ab7.wav",
    "B": "${folderPath}B7.wav",
    "Bb": "${folderPath}Bb7.wav",
    "C": "${folderPath}C7.wav",
    "D": "${folderPath}D7.wav",
    "Db": "${folderPath}Db7.wav",
    "E": "${folderPath}E7.wav",
    "Eb": "${folderPath}Eb7.wav",
    "F": "${folderPath}F7.wav",
    "G": "${folderPath}G7.wav",
    "Gb": "${folderPath}Gb7.wav",
  },
};

List l = ["A", "Ab", "B", "Bb", "C", "D", "Db", "E", "Eb", "F", "G", "Gb"];
