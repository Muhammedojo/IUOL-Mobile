import 'package:audioplayers/audioplayers.dart';
import '../screen_views/audio_view.dart';
import 'package:flutter/material.dart';
import '../helpers/helper.dart';

class Audio extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const Audio({Key? key}) : super(key: key);

  @override
  AudioController createState() => AudioController();
}

class AudioController extends State<Audio> {
  //... //Initialization code, state vars etc, all go here
  AudioPlayer player = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  final PlayerState _playerState = PlayerState.stopped;
  bool get isPlayingNow => _playerState == PlayerState.playing;

  String url = "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-13.mp3";

  Future<void> playAudioFromUrl(String url) async {
    await player.play(UrlSource(url));
  }

  @override
  void initState() {
    super.initState();
    player.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });

      player.onDurationChanged.listen((newDuration) {
        setState(() {
          duration = newDuration;
        });
      });

      player.onPositionChanged.listen((newPosition) {
        setState(() {
          position = newPosition;
        });
      });
    });
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AudioView(this);

  //Control logic grouped together, at top of file
  void onBackPressed() {
    NavigatorHelper(context).closeScreen();
  }
}
