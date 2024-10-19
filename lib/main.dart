import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Audio Player App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AudioPlayerScreen(),
    );
  }
}

class AudioPlayerScreen extends StatelessWidget {
  final AudioPlayer _audioPlayer = AudioPlayer();

  void _playAudioWithDelay(String filePath) async {
    const int delayInSeconds = 5; // Delay time in seconds
    await Future.delayed(Duration(seconds: delayInSeconds));
    await _audioPlayer.setSource(AssetSource(filePath)); // Use setSource instead
    await _audioPlayer.resume(); // Call resume() to play the audio
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Audio Player'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _playAudioWithDelay('assets/audios/10.wav'),
              child: Text('Play 10.wav After 5 Seconds'),
            ),
            ElevatedButton(
              onPressed: () => _playAudioWithDelay('assets/audios/14.m4a'),
              child: Text('Play 14.m4a After 5 Seconds'),
            ),
            ElevatedButton(
              onPressed: () => _playAudioWithDelay('assets/audios/4 clown-funny.wav'),
              child: Text('Play 4 clown-funny.wav After 5 Seconds'),
            ),
          ],
        ),
      ),
    );
  }
}
