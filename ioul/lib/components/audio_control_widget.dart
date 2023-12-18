import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:ioul/values/colors.dart';

class AudioControl extends StatelessWidget {
   AudioControl({
    super.key,

  });
  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Center(child: Column(children: [
      IconButton(
              onPressed: (){
            //    playAudioFromUrl('');
    },
              icon: const Icon(
                Icons.play_arrow_outlined,
                size: 80,
                color: AppColors.primaryLightest,
              ),
            )
    ],),);
    //   StreamBuilder<PlayerState>(
    //   stream: audioPlayer.playerStateStream,
    //   builder: (context, snapshot) {
    //     final playerState = snapshot.data;
    //     final processingState = playerState?.processingState;
    //     final playing = playerState?.playing;
    //     if (!(playing ?? false)) {
    //       return IconButton(
    //         onPressed: audioPlayer.play,
    //         icon: const Icon(
    //           Icons.play_arrow_outlined,
    //           size: 80,
    //           color: AppColors.primaryLightest,
    //         ),
    //       );
    //     } else if (processingState != ProcessingState.completed) {
    //       return IconButton(
    //           onPressed: audioPlayer.pause,
    //           icon: const Icon(
    //             Icons.play_arrow_outlined,
    //             size: 80,
    //             color: AppColors.primaryLightest,
    //           ));
    //     }
    //     return const Icon(
    //       Icons.play_arrow_rounded,
    //       size: 80,
    //     );
    //   },
    // );
  }
}
