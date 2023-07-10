import 'package:ioul/helpers/helper.dart';

import '../components/components.dart';
import '../packages/package.dart';
import '../screens/screens.dart';
import '../screens_controllers/document_resources_controller.dart';
import '../values/values.dart';
import 'stateless_view.dart';

class DocumentResourcesView
    extends StatelessView<DocumentResources, DocumentResourcesController> {
  const DocumentResourcesView(DocumentResourcesController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundWhite,
        appBar: WidgetHelper().appBackArrowWithTitleAndTabBar(context,
            title: 'ARB 111 - Document Resources',
            bottomWidget: const SizedBox()),
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
            choiceCheckmark: false,
            choiceStyle: C2ChipStyle.filled(
              backgroundOpacity: 0.2,
              selectedStyle: const C2ChipStyle(
                backgroundColor: AppColors.blueBase,
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

  Widget _firstPeriod() {
    return Column(
      children: [
        //AudioResourcesWidget( onTap: (){}),
        SizedBox(
          height: 10.h,
        ),
        DocumentResourcesWidget(onTap: () {}, image: 'assets/images/pdf.svg'),
        SizedBox(
          height: 10.h,
        ),
        DocumentResourcesWidget(onTap: () {}, image: 'assets/images/pdf.svg'),
        SizedBox(
          height: 10.h,
        ),
        DocumentResourcesWidget(onTap: () {}, image: 'assets/images/pdf.svg'),
      ],
    );
  }

  Widget _secondPeriod() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DocumentResourcesWidget(
          onTap: () {},
          image: 'assets/images/pdf.svg',
        ),
        SizedBox(
          height: 10.h,
        ),
        DocumentResourcesWidget(onTap: () {}, image: 'assets/images/pdf.svg'),
        SizedBox(
          height: 10.h,
        ),
      ],
    );
  }

  Widget _thirdPeriod() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DocumentResourcesWidget(onTap: () {}, image: 'assets/images/pdf.svg'),
        SizedBox(
          height: 10.h,
        ),
        DocumentResourcesWidget(onTap: () {}, image: 'assets/images/pdf.svg'),
        SizedBox(
          height: 10.h,
        ),
        DocumentResourcesWidget(onTap: () {}, image: 'assets/images/pdf.svg'),
        SizedBox(
          height: 10.h,
        ),
        DocumentResourcesWidget(onTap: () {}, image: 'assets/images/pdf.svg'),
        SizedBox(
          height: 10.h,
        ),
        DocumentResourcesWidget(onTap: () {}, image: 'assets/images/pdf.svg'),
        SizedBox(
          height: 10.h,
        ),
        DocumentResourcesWidget(onTap: () {}, image: 'assets/images/pdf.svg'),
      ],
    );
  }
}
