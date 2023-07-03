import '../components/components.dart';
import '../packages/package.dart';
import '../screens/screens.dart';
import '../screens_controllers/video_resources_controller.dart';
import '../values/values.dart';
import 'stateless_view.dart';

class VideoResourcesView
    extends StatelessView<VideoResources, VideoResourcesController> {
  const VideoResourcesView(VideoResourcesController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundWhite,
        appBar: AppBar(
            backgroundColor: const Color(0xff25435B),
            centerTitle: true,
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(40.0.h),
                child: const SizedBox()),
            title: Text(
              'ARB 111 - Video Resources',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),
            )),
        body: WidgetWrapper(child: _body()));
  }

  Widget _body() {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ChipsChoice<int>.single(
            value: state.selectedPeriod,
            onChanged: (val) => state.onChipSelected(val),
            choiceItems: C2Choice.listFrom<int, String>(
              source: state.periodType,
              value: (i, v) => i,
              label: (i, v) => v,
              tooltip: (i, v) => v,
            ),
            choiceCheckmark: true,
            choiceStyle: C2ChipStyle.filled(
              selectedStyle: const C2ChipStyle(
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
            ),
            wrapped: false,
          ),
          SizedBox(
            height: 15.h,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  state.selectedPeriod == 0
                      ? WidgetWrapper(child: _firstPeriod())
                      : (state.selectedPeriod == 1
                      ? WidgetWrapper(
                      child: _secondPeriod())
                      : WidgetWrapper(
                      child: _thirdPeriod()))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _firstPeriod() {
    return Column(
      children:  [
        DocumentResourcesWidget( onTap: (){}, image: 'assets/images/audio_doc.svg'),
        SizedBox(
          height: 10.h,
        ),
        DocumentResourcesWidget( onTap: (){}, image: 'assets/images/audio_doc.svg'),
        SizedBox(
          height: 10.h,
        ),
        DocumentResourcesWidget( onTap: (){}, image: 'assets/images/audio_doc.svg'),
        SizedBox(
          height: 10.h,
        ),
        DocumentResourcesWidget( onTap: (){}, image: 'assets/images/audio_doc.svg'),

      ],
    );
  }

  Widget _secondPeriod() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DocumentResourcesWidget( onTap: (){}, image: 'assets/images/audio_doc.svg'),
        SizedBox(
          height: 10.h,
        ),
        DocumentResourcesWidget( onTap: (){}, image: 'assets/images/audio_doc.svg'),

      ],
    );
  }

  Widget _thirdPeriod() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DocumentResourcesWidget( onTap: (){}, image: 'assets/images/audio_doc.svg'),
        SizedBox(
          height: 10.h,
        ),
        DocumentResourcesWidget( onTap: (){}, image: 'assets/images/audio_doc.svg'),
        SizedBox(
          height: 10.h,
        ),
        DocumentResourcesWidget( onTap: (){}, image: 'assets/images/audio_doc.svg'),
        SizedBox(
          height: 10.h,
        ),
        DocumentResourcesWidget( onTap: (){}, image: 'assets/images/audio_doc.svg'),

      ],
    );
  }
}
