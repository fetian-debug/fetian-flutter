import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  void playAudio(int numAudio) {
    AssetsAudioPlayer.newPlayer().open(
      Audio("assets/Azkar$numAudio.wav"),
      showNotification: true,
    );
  }

  Expanded buildBtn(Color color, int numAdudio) {
    return Expanded(
      
        child: TextButton(
      child: Container(
        color: color,
      ),
      onPressed: () {
        playAudio(numAdudio);
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildBtn(Colors.red, 1),
              buildBtn(Colors.yellow, 2),
              buildBtn(Colors.teal, 3),
              buildBtn(Colors.green, 4),
              buildBtn(Colors.blue, 5),
              buildBtn(Colors.purple, 6)
            ],
          ),
        ),
      ),
    );
  }
}
