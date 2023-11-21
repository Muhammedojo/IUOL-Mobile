import '../components/custom_dropdown_widget.dart';
import '../packages/package.dart';
import '../components/components.dart';
import '../screens/screens.dart';
import '../screens_controllers/payment_controller.dart';
import '../values/values.dart';
import 'stateless_view.dart';

class PaymentView extends StatelessView<Payment, PaymentController> {
  const PaymentView(PaymentController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        //AppColors.backgroundWhite,
        appBar: AppBar(
          // backgroundColor: const Color(0xff25435B),
          centerTitle: true,
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(40.0.h), child: const SizedBox()),
          title: Text(
            'Result History',
            style: TextStyle(
                fontSize: 18.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[Color(0xff25435B), Color(0xff2799F7)]),
            ),
          ),
        ),
        body: WidgetWrapper(child: _body(context)));
  }

  Widget _body(context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      // const Column(
      //   mainAxisSize: MainAxisSize.min,
      //   children: [],
      // ),
      Expanded(
        child: SingleChildScrollView(
          child: Padding(
            padding: REdgeInsets.symmetric(horizontal: 13.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextWidget(
                      text: "Select Payment Type:",
                      style: Styles.x16dp_202325_400w(),
                    ),
                    SizedBox(width: 10.w),
                    SvgPicture.asset("assets/images/red_star.svg"),
                  ],
                ),
                SizedBox(height: 12.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: CustomDropdownWidget(
                      dropdownList: const [
                        'Tuition Fee',
                        'Acceptance Fee',
                        'Management Fee',
                        'Departmental Fee',
                      ],
                      controller: state.dropdownController,
                      onChange: (value) => state.setSelectedValue(value),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Center(
                    child: Text(state.selectedValue.isEmpty ? '' :
                  '${state.selectedValue} Payment',
                  style: Styles.x16dp_202325_400w(),
                )),
                SizedBox(height: 60.h),
                SubmitButtonWidget(
                  label: 'Proceed to Payment',
                  onPressed: () {},
                  color: state.selectedValue.isEmpty
                      ? Colors.grey
                      : const Color(0xff25435B),
                )
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
