import 'package:flutter/material.dart';
import 'package:setting/dev/colortest.dart';
import 'package:setting/dev/touchtest.dart';
import 'package:setting/dev/audio_player_page.dart';
import 'package:window_manager/window_manager.dart';
import 'package:audioplayers/audioplayers.dart';

class TouchSoundPlayer {
  static String? audioFile;
  static double? volume;
  static int? playMode; //0: both 1: left 2: right 3: auto
  TouchSoundPlayer(audioFile, volume, playMode)
  {
    TouchSoundPlayer.audioFile=audioFile;
    TouchSoundPlayer.volume=volume;
    TouchSoundPlayer.playMode=playMode;
  }

  static double getBalance([Offset? axis])
  {
    if(playMode == 0)
      return 0.0;
    else if(playMode == 1)
      return 1.0;
    else if(playMode == 2)
      return -1.0;

    if(axis==null)
    {
      return 0.0;
      Exception("No axis data");
    }
    else{
      return axis.dx>1023 ? 1.0 : -1.0;
    }
  }

  play() async
  {
    final player = AudioPlayer();
    player.setBalance(getBalance());
    //player.setSourceAsset(audioFile!);
    player.setVolume(volume!);
    player.play(AssetSource(audioFile!));
  }

  dispose()
  {
    print("i am disposed TouchSoundPlayer");
  }

}
TouchSoundPlayer touchSoundPlayer=TouchSoundPlayer('click1_1.wav', 1.0, 0);