import '../../../../components/components.dart';
import '../../../../core/core.dart';
import '../controller/controller.dart';

class DocumentResourcesView
    extends StatelessView<DocumentResources, DocumentResourcesController> {
  const DocumentResourcesView(DocumentResourcesController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      color: const Color(0xff25435B),
      child: Scaffold(
          appBar: WidgetHelper().appBackArrowWithTitle(context,
              title: 'ARB 111 - Document Resources',
              onTap: () => state.onBackPressed()),
          backgroundColor: AppColors.backgroundWhite,
          body: WidgetWrapper(child: _body())),
    );
  }

  Widget _body() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: REdgeInsets.symmetric(horizontal: 10.0),
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
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      state.selectedPeriod == 0
                          ? WidgetWrapper(child: _firstPeriod())
                          : (state.selectedPeriod == 1
                              ? WidgetWrapper(child: _secondPeriod())
                              : WidgetWrapper(child: _thirdPeriod()))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _firstPeriod() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListView.separated(
          separatorBuilder: (context, index) => SizedBox(
            height: 10.h,
          ),
          itemCount: 5,
          shrinkWrap: true,
          itemBuilder: (context, index) => DocumentResourcesWidget(
              onTap: () {}, image: 'assets/images/pdf.svg'),
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
              onTap: () {}, image: 'assets/images/pdf.svg'),
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
          itemCount: 8,
          shrinkWrap: true,
          itemBuilder: (context, index) => DocumentResourcesWidget(
              onTap: () {}, image: 'assets/images/pdf.svg'),
        ),
      ],
    );
  }
}
