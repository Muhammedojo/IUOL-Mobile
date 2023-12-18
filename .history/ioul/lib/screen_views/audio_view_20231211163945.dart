// import 'package:audioplayers/audioplayers.dart';
import 'package:ioul/packages/package.dart';
import '../components/components.dart';
import '../screens/screens.dart';
import '../screens_controllers/audio_controller.dart';
import '../values/values.dart';
import 'stateless_view.dart';

class AudioView extends StatelessView<Audio, AudioController> {
  const AudioView(AudioController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: AppColors.backgroundWhite,
        body: WidgetWrapper(child: _body(context)));
  }

  Widget _body(context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(color: AppColors.primary),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/logos.png'),
          Slider(
              min: 0.0,
              max: state.duration.inSeconds.toDouble(),
              value: state.position.inSeconds.toDouble(),
              onChanged: (value) async {
                final pos = Duration(seconds: value.toInt());
                await state.player.seek(pos);

                await state.player.resume();
              }),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${state.position}'),
              Text('${state.duration - state.position}'),
            ],
          ),
          SizedBox(
            height: 40.h,
          ),
          IconButton(
            onPressed: () async {
              state.isPlayingNow
                  ? await state.player.pause()
                  : await state.player.play(UrlSource(state.url));
            },
            icon: Icon(
              state.isPlayingNow
                  ? Icons.pause_circle_outline
                  : Icons.play_arrow_outlined,
              size: 80,
              color: AppColors.primaryLightest,
            ),
          ),
        ],
      ),
    );
  }
}
