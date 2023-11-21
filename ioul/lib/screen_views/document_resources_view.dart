
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
    return Container(
      height: 50.h,
      color: const Color(0xff25435B),
      child: SafeArea(
        child: Scaffold(
            backgroundColor: AppColors.backgroundWhite,
            body: WidgetWrapper(child: _body())),
      ),
    );
  }

  Widget _body() {
    return Column(
      children: [
        Column(
          children: [
            Container(
              color: const Color(0xff25435B),
              height: 120.h,
              alignment: Alignment.centerLeft,
              padding: REdgeInsets.only(left: 24),
              width: double.infinity,
              child: Column(
                children: [
                  Row(children: [
                    GestureDetector(
                      onTap: () => state.onBackPressed(),
                      child: Container(
                        width: 36.w,
                        height: 36.h,
                        constraints: BoxConstraints(maxHeight: 36.h, maxWidth: 36.w),
                        margin: REdgeInsets.only(top: 8),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ],),
                  SizedBox(height: 15.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '2023 Spring Semester Report',style: TextStyle(fontSize: 18.sp,fontFamily: 'Inter',
                          fontWeight: FontWeight.w700),),

                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
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
