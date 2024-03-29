import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPlayerPage extends StatefulWidget{

  final String name;
  const AudioPlayerPage({required this.name});

@override
State<AudioPlayerPage> createState()=> _AudioPlayerPageState(name);
}

class _AudioPlayerPageState extends State<AudioPlayerPage> {
  final String name;

  final _longPlayer = AudioPlayer();  // 長い曲再生用のプレイヤー、音声を停止させるためにメンバー化
  double _volume = 0.5;


  _AudioPlayerPageState(this.name);
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _longPlayer.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('音声の再生'),
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Text('audioplayersで音声を再生\nWindows/Linux/Androidで共通'),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('音量'),
                  Slider(
                    value: _volume,
                    min: 0.0,
                    max: 1.0,
                    onChanged: (value) => setState(() {
                      _volume = value;
                      _longPlayer.setVolume(_volume);
                    }),
                  ),
                ]
            ),
            ElevatedButton(
              onPressed: () async {
                final player = AudioPlayer();

                player.setBalance(1);
                player.play(AssetSource('click1_1.wav'), volume: _volume);

                await Future.delayed(const Duration(milliseconds: 150));

                player.setBalance(-1);
                player.play(AssetSource('click1_1.wav'), volume: _volume);

              },
              child: const Text('click1_1.wav'),
            ),
            ElevatedButton(
              onPressed: () async {

                //final player1 = AudioPlayer();
                //final player2 = AudioPlayer();

                //player1.setBalance(1);
                //player1.play(AssetSource('popup_1.wav'), volume: _volume);

                //await Future.delayed(const Duration(milliseconds: 2000));
                //player2.setBalance(-1);
               // player2.play(AssetSource('popup_2.wav'), volume: _volume);
              },
              child: const Text('popup_1.wav'),
            ),
            ElevatedButton(
              onPressed: () async {
                final player = AudioPlayer();
                player.setBalance(1);
                player.play(AssetSource('popup_2.wav'), volume: _volume);
                await Future.delayed(const Duration(milliseconds: 200));
                player.setBalance(-1);
                player.play(AssetSource('popup_2.wav'), volume: _volume);
              },
              child: const Text('popup_2.wav'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    _longPlayer.play(AssetSource('tsukinokobune.mp3'), volume: _volume);
                  },
                  child: const Text('長い曲の再生'),
                ),
                const SizedBox(width: 20.0,),
                ElevatedButton(
                  onPressed: () async {
                    _longPlayer.stop();
                  },
                  child: const Text('長い曲の停止'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
