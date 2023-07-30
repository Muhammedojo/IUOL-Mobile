import '../components/custom_dropdown_widget.dart';
import '../values/values.dart';
import '../components/components.dart';
import '../screens/screens.dart';
import '../packages/package.dart';
import '../screens_controllers/address_controller.dart';
import '../values/values.dart';
import 'stateless_view.dart';

class AddressView extends StatelessView<Address, AddressController> {
  const AddressView(AddressController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.transparent,
      body: WidgetWrapper(child: _body(context)),
    );
  }

  Widget _body(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextWidget(
                  text: "Nationality",
                  style: Styles.x16dp_202325_400w(),
                ),
                SizedBox(width: 10.w),
                SvgPicture.asset("assets/images/red_star.svg"),
              ],
            ),
            SizedBox(height: 10.w),
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: CustomDropdownWidget(
                  dropdownList: const [
                    'Islam',
                    'Christianity',
                    'Traditionalist',
                  ],
                  controller: state.nationalityController,
                  onChange: (value) => state.setSelectedValue(value),
                ),
              ),
            ),
            SizedBox(height: 28.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextWidget(
                  text: "State",
                  style: Styles.x16dp_202325_400w(),
                ),
                SizedBox(width: 10.w),
                SvgPicture.asset("assets/images/red_star.svg"),
              ],
            ),
            SizedBox(height: 10.w),
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: CustomDropdownWidget(
                  dropdownList: const [
                    'Islam',
                    'Christianity',
                    'Traditionalist',
                  ],
                  controller: state.nationalityController,
                  onChange: (value) => state.setSelectedValue(value),
                ),
              ),
            ),
            SizedBox(height: 28.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextWidget(
                  text: "Local Government Area",
                  style: Styles.x16dp_202325_400w(),
                ),
                SizedBox(width: 10.w),
                SvgPicture.asset("assets/images/red_star.svg"),
              ],
            ),
            SizedBox(height: 10.w),
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: CustomDropdownWidget(
                  dropdownList: const [
                    'Islam',
                    'Christianity',
                    'Traditionalist',
                  ],
                  controller: state.nationalityController,
                  onChange: (value) => state.setSelectedValue(value),
                ),
              ),
            ),
            SizedBox(height: 28.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextWidget(
                  text: "Residence Country",
                  style: Styles.x16dp_202325_400w(),
                ),
                SizedBox(width: 10.w),
                SvgPicture.asset("assets/images/red_star.svg"),
              ],
            ),
            SizedBox(height: 10.w),
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: CustomDropdownWidget(
                  dropdownList: const [
                    'Islam',
                    'Christianity',
                    'Traditionalist',
                  ],
                  controller: state.nationalityController,
                  onChange: (value) => state.setSelectedValue(value),
                ),
              ),
            ),
            SizedBox(height: 28.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextWidget(
                  text: "Residence State",
                  style: Styles.x16dp_202325_400w(),
                ),
                SizedBox(width: 10.w),
                SvgPicture.asset("assets/images/red_star.svg"),
              ],
            ),
            SizedBox(height: 10.w),
            TextFieldWidget(
              hint: "LGA",
              controller: state.surnameController,
            ),
            SizedBox(height: 28.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextWidget(
                  text: "Permanent Address",
                  style: Styles.x16dp_202325_400w(),
                ),
                SizedBox(width: 10.w),
                SvgPicture.asset("assets/images/red_star.svg"),
              ],
            ),
            SizedBox(height: 10.w),
            TextFieldWidget(
              hint: "LGA",
              controller: state.surnameController,
            ),
            SizedBox(height: 28.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextWidget(
                  text: "Work Address",
                  style: Styles.x16dp_202325_400w(),
                ),
                SizedBox(width: 10.w),
                SvgPicture.asset("assets/images/red_star.svg"),
              ],
            ),
            SizedBox(height: 10.w),
            TextFieldWidget(
              hint: "Country",
              controller: state.surnameController,
            ),
            SizedBox(height: 28.h),
            SizedBox(height: 24.h),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: ElevatedButtonWidget(
                      onTap: () => state.onReversePressed(), title: "Back"),
                ),
                SizedBox(width: 132.w),
                Expanded(
                  flex: 1,
                  child: ElevatedButtonWidget(
                      onTap: () => state.onNextPressed(), title: "Next"),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
