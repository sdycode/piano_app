import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:piano_app/demo/demo_screen.dart';
import 'package:piano_app/providers/provider.dart';
import 'package:piano_app/screens/screen1.dart';
import 'package:piano_app/constants/sizes.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (c)=>KeyProvider())],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Builder(builder: (context) {
            initialiseSizes(context);
            return
                // DemoScreen();
                Screen1();
          })),
    );
  }
}
