import '../components/components.dart';
import '../helpers/helper.dart';
import '../packages/package.dart';
import '../router/route_constants.dart';
import '../screens/screens.dart';
import '../screens_controllers/audio_resources_controller.dart';
import '../values/values.dart';
import 'stateless_view.dart';

class AudioResourcesView
    extends StatelessView<AudioResources, AudioResourcesController> {
  const AudioResourcesView(AudioResourcesController state, {Key? key})
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
              'ARB 111 - Audio Resources',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),
            )),
        body: WidgetWrapper(child: _body(context)));
  }

  Widget _body(context) {
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
                      ? WidgetWrapper(child: _firstPeriod(context))
                      : (state.selectedPeriod == 1
                          ? WidgetWrapper(child: _secondPeriod())
                          : WidgetWrapper(child: _thirdPeriod()))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _firstPeriod(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListView.separated(
          separatorBuilder: (context, index) => SizedBox(
            height: 10.h,
          ),
          itemCount: 4,
          shrinkWrap: true,
          itemBuilder: (context, index) => DocumentResourcesWidget(
              onTap: () {
                NavigatorHelper(context).pushNamedScreen(
                  RouteConstants.audio,
                );
              },
              image: 'assets/images/audio_doc.svg'),
        ),
      ],
    );
  }

  Widget _secondPeriod() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListView.separated(
          separatorBuilder: (context, index) => SizedBox(
            height: 10.h,
          ),
          itemCount: 2,
          shrinkWrap: true,
          itemBuilder: (context, index) => DocumentResourcesWidget(
              onTap: () {}, image: 'assets/images/audio_doc.svg'),
        ),
      ],
    );
  }

  Widget _thirdPeriod() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListView.separated(
          separatorBuilder: (context, index) => SizedBox(
            height: 10.h,
          ),
          itemCount: 4,
          shrinkWrap: true,
          itemBuilder: (context, index) => DocumentResourcesWidget(
              onTap: () {}, image: 'assets/images/audio_doc.svg'),
        ),
      ],
    );
  }
}
