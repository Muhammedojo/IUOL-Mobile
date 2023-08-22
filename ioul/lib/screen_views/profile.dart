import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:ioul/components/components.dart';
import 'package:ioul/screen_views/stateless_view.dart';
import 'package:ioul/screens_controllers/personal_controller.dart';
import 'package:ioul/utils/utils.dart';
import 'package:ioul/values/values.dart';
import '../components/custom_dropdown_widget.dart';
import '../packages/package.dart';
import '../screens_controllers/profile.dart';

class ProfileView extends StatelessView<Profile, ProfileController> {
  const ProfileView(ProfileController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: false,
        backgroundColor: AppColors.backgroundWhite,
        body: WidgetWrapper(child: _body()));
  }

  Widget _body() {
    return WidgetWrapper(
      child: DefaultTabController(
        length: 7,
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: CustomSilverAppBarDelegate(expandedHeight: 570.h),
              pinned: true,
            ),
            // SliverToBoxAdapter(
            //   child: ListView.builder(
            //     itemCount: 100,
            //     shrinkWrap: true,
            //     primary: false,
            //     itemBuilder: (context, index) => const Text(
            //       "data",
            //       style: TextStyle(color: Colors.amber),
            //     ),
            //   ),
            // ),
            SliverFillRemaining(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  SingleChildScrollView(
                    child: Padding(
                      padding: REdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          SizedBox(height: 24.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextWidget(
                                text: "First Name",
                                style: Styles.x16dp_202325_400w(),
                              ),
                              SizedBox(width: 10.w),
                              SvgPicture.asset("assets/images/red_star.svg"),
                            ],
                          ),
                          SizedBox(height: 10.w),
                          TextFieldWidget(
                            hint: "Sulaiman",
                            controller: state.firstNameController,
                          ),
                          SizedBox(height: 28.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextWidget(
                                text: "Surname Name",
                                style: Styles.x16dp_202325_400w(),
                              ),
                              SizedBox(width: 10.w),
                              SvgPicture.asset("assets/images/red_star.svg"),
                            ],
                          ),
                          SizedBox(height: 10.w),
                          TextFieldWidget(
                            hint: "Idris",
                            controller: state.firstNameController,
                          ),
                          SizedBox(height: 28.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextWidget(
                                text: "Middle Name",
                                style: Styles.x16dp_202325_400w(),
                              ),
                              SizedBox(width: 10.w),
                              SvgPicture.asset("assets/images/red_star.svg"),
                            ],
                          ),
                          SizedBox(height: 10.w),
                          TextFieldWidget(
                            hint: "Ademola",
                            controller: state.firstNameController,
                          ),
                          SizedBox(height: 28.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextWidget(
                                text: "Email address",
                                style: Styles.x16dp_202325_400w(),
                              ),
                              SizedBox(width: 10.w),
                              SvgPicture.asset("assets/images/red_star.svg"),
                            ],
                          ),
                          SizedBox(height: 10.w),
                          TextFieldWidget(
                            hint: "spythonian@gmail.com",
                            controller: state.firstNameController,
                          ),
                          SizedBox(height: 28.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextWidget(
                                text: "Gender",
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
                              width: MediaQuery.of(GlobalVariables
                                      .rootNavigatorKey.currentContext!)
                                  .size
                                  .width,
                              child: CustomDropdownWidget(
                                dropdownList: const [
                                  'Male',
                                  'Female',
                                ],
                                controller: state.genderController,
                                onChange: (value) =>
                                    state.setSelectedValue(value),
                              ),
                            ),
                          ),
                          SizedBox(height: 28.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextWidget(
                                text: "Phone Number",
                                style: Styles.x16dp_202325_400w(),
                              ),
                              SizedBox(width: 10.w),
                              SvgPicture.asset("assets/images/red_star.svg"),
                            ],
                          ),
                          SizedBox(height: 10.w),
                          // IntlPhoneField(
                          //   initialCountryCode: 'NG',
                          //   disableAutoFillHints: true,
                          //   disableLengthCheck: true,
                          //   controller: state.phoneController,
                          //   style: Styles.x16dp_72777A_400w(),
                          //   dropdownIconPosition: IconPosition.trailing,
                          //   dropdownIcon: const Icon(Icons.arrow_drop_down),
                          //   flagsButtonMargin: const EdgeInsets.all(0),
                          //   flagsButtonPadding: const EdgeInsets.only(left: 16),
                          //   cursorHeight: 0,
                          //   cursorRadius: Radius.circular(0),
                          //   showCountryFlag: true,
                          //   decoration: InputDecoration(
                          //     contentPadding:
                          //         REdgeInsets.only(top: 16, right: 16, bottom: 16, left: 0),
                          //     hintStyle: Styles.x12dp_72777A_400w(),
                          //     fillColor: AppColors.backgroundWhite,
                          //     filled: true,
                          //     isDense: true,
                          //     isCollapsed: true,
                          //     hintText: 'Phone Number',
                          //     enabledBorder: OutlineInputBorder(
                          //       borderSide: const BorderSide(color: AppColors.inkLight),
                          //       borderRadius: BorderRadius.circular(8.r),
                          //     ),
                          //     focusedBorder: OutlineInputBorder(
                          //       borderSide: const BorderSide(color: AppColors.inkLighter),
                          //       borderRadius: BorderRadius.circular(8.r),
                          //     ),
                          //   ),
                          //   languageCode: "en",
                          //   onChanged: (phone) {
                          //     print(phone.completeNumber);
                          //   },
                          //   onCountryChanged: (country) {
                          //     print('Country changed to: ' + country.name);
                          //   },
                          // ),
                          IntlPhoneField(
                            initialCountryCode: 'NG',
                            languageCode: 'en',
                            controller: state.phoneController,
                            style: Styles.x16dp_72777A_400w(),
                            disableLengthCheck: true,
                            cursorColor: AppColors.lightGrey,
                            dropdownDecoration: BoxDecoration(),
                            dropdownTextStyle: Styles.x16dp_72777A_400w(),
                            decoration: InputDecoration(
                              helperStyle: Styles.x16dp_72777A_400w(),

                              contentPadding: REdgeInsets.only(
                                  top: 16, right: 16, bottom: 16, left: 0),
                              hintStyle: Styles.x12dp_72777A_400w(),
                              fillColor: AppColors.backgroundWhite,
                              filled: true,
                              // isDense: true,
                              isCollapsed: true,
                              hintText: 'Phone Number',
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: AppColors.inkLight),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: AppColors.inkLighter),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                            onChanged: (value) =>
                                state.phoneController.text = value.number,
                          ),
                          SizedBox(height: 28.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextWidget(
                                text: "Marital Status",
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
                              width: MediaQuery.of(GlobalVariables
                                      .rootNavigatorKey.currentContext!)
                                  .size
                                  .width,
                              child: CustomDropdownWidget(
                                dropdownList: const [
                                  'Single',
                                  'Married',
                                  'Divorced',
                                  'Widow',
                                ],
                                controller: state.maritalStatusController,
                                onChange: (value) =>
                                    state.setSelectedValue(value),
                              ),
                            ),
                          ),
                          SizedBox(height: 28.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextWidget(
                                text: "Religion",
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
                              width: MediaQuery.of(GlobalVariables
                                      .rootNavigatorKey.currentContext!)
                                  .size
                                  .width,
                              child: CustomDropdownWidget(
                                dropdownList: const [
                                  'Islam',
                                  'Christianity',
                                  'Traditionalist',
                                ],
                                controller: state.religionControllr,
                                onChange: (value) =>
                                    state.setSelectedValue(value),
                              ),
                            ),
                          ),
                          SizedBox(height: 28.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextWidget(
                                text: "Employment Status",
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
                              width: MediaQuery.of(GlobalVariables
                                      .rootNavigatorKey.currentContext!)
                                  .size
                                  .width,
                              child: CustomDropdownWidget(
                                dropdownList: const [
                                  'Employed',
                                  'Unemployed',
                                ],
                                controller: state.employmentStatusController,
                                onChange: (value) =>
                                    state.setSelectedValue(value),
                              ),
                            ),
                          ),
                          SizedBox(height: 28.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextWidget(
                                text: "Date of Birth",
                                style: Styles.x16dp_202325_400w(),
                              ),
                              SizedBox(width: 10.w),
                              SvgPicture.asset("assets/images/red_star.svg"),
                            ],
                          ),
                          SizedBox(height: 10.w),
                          TextFieldWidget(
                            hint: "Date of Birth",
                            readOnly: true,
                            controller: state.dateOfBirthController,
                            passwordIcon: GestureDetector(
                              onTap: () => state.showDatePickerDialog(),
                              child: const Icon(
                                Icons.date_range_outlined,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                          SizedBox(height: 28.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextWidget(
                                text: "Native Language",
                                style: Styles.x16dp_202325_400w(),
                              ),
                              SizedBox(width: 10.w),
                              SvgPicture.asset("assets/images/red_star.svg"),
                            ],
                          ),
                          SizedBox(height: 10.w),
                          TextFieldWidget(
                            hint: "Native language",
                            controller: state.nativeLanguageController,
                          ),
                          SizedBox(height: 28.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextWidget(
                                text: "National Identification Type",
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
                              width: MediaQuery.of(GlobalVariables
                                      .rootNavigatorKey.currentContext!)
                                  .size
                                  .width,
                              child: CustomDropdownWidget(
                                dropdownList: const [
                                  'Permanent Voters Card',
                                  'NIN',
                                  'International Passport',
                                  "Driver's License",
                                ],
                                controller: state.nationalIdTypeController,
                                onChange: (value) =>
                                    state.setSelectedValue(value),
                              ),
                            ),
                          ),
                          SizedBox(height: 28.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextWidget(
                                text: "Identification Number",
                                style: Styles.x16dp_202325_400w(),
                              ),
                              SizedBox(width: 10.w),
                              SvgPicture.asset("assets/images/red_star.svg"),
                            ],
                          ),
                          SizedBox(height: 10.w),
                          TextFieldWidget(
                            hint: "0000000000000",
                            controller: state.identityNumberController,
                          ),
                          SizedBox(height: 28.h),
                        ],
                      ),
                    ),
                  ),
                  Text("data"),
                  Text("data"),
                  Text("data"),
                  Text("data"),
                  Text("data"),
                  Text("data"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSilverAppBarDelegate extends SliverPersistentHeaderDelegate {
  CustomSilverAppBarDelegate({required this.expandedHeight});
  final double expandedHeight;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.loose,
      children: [
        buildBackground(shrinkOffset),
        buildAppBar(shrinkOffset),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 50.h,
                color: Colors.white,
                child: const TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  isScrollable: true,
                  indicatorColor: Colors.black,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(
                      text: "Personal",
                    ),
                    Tab(
                      text: "Address",
                    ),
                    Tab(
                      text: "Contacts",
                    ),
                    Tab(
                      text: "Sponsor",
                    ),
                    Tab(
                      text: "Programme",
                    ),
                    Tab(
                      text: "Certificates",
                    ),
                    Tab(
                      text: "Uploads",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  double appear(double shrinkOffset) => shrinkOffset / expandedHeight;

  Widget buildAppBar(double shrinkOffset) => Opacity(
        opacity: appear(shrinkOffset),
        child: AppBar(
          toolbarHeight: 80.h,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xff25435B),
                  Color(0xff2799F7),
                ],
              ),
            ),
          ),
          elevation: 0,
          // title: const Text("Title"),
          // bottomOpacity: 0.2,
          leadingWidth: 300.w,
          leading: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 8.w),
              Hero(
                tag: "profile_picture",
                child: Image.asset(
                  "assets/images/profile_picture.png",
                  fit: BoxFit.cover,
                  height: 60.h,
                  width: 60.w,
                ),
              ),
              SizedBox(width: 12.w),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: "Sulaiman Ademola Idris",
                    overflow: TextOverflow.ellipsis,
                    style: Styles.x16dp_404446_400w(
                        color: AppColors.backgroundWhite),
                  ),
                  SizedBox(height: 8.h),
                  TextWidget(
                    text: "Admission verified",
                    style: Styles.x12dp_090A0A_400w(
                        color: AppColors.backgroundWhite),
                  ),
                ],
              )
            ],
          ),
          actions: [
            SvgPicture.asset("assets/images/verified.svg"),
            SizedBox(width: 16.w),
          ],
        ),
      );

  Widget buildBackground(double shrinkOffset) => Stack(
        fit: StackFit.loose,
        children: [
          Container(
            padding: REdgeInsets.only(bottom: 8),
            height: 180.h,
            decoration: BoxDecoration(
              color: const Color(0xff25435B),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16.r),
                bottomRight: Radius.circular(16.r),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xff25435B),
                    Color(0xff2799F7),
                  ],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16.r),
                  bottomRight: Radius.circular(16.r),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Center(
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 90.h),
                  Hero(
                    tag: "profile_picture",
                    child: Image.asset(
                      "assets/images/profile_picture.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  TextWidget(
                    text: "Sulaiman Ademola Idris",
                    style: Styles.x24dp_090A0A_700w(weight: FontWeight.w500),
                  ),
                  SizedBox(height: 15.h),
                  Container(
                    // width: 310.w,
                    padding: REdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xffECFCE5),
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const TextWidget(
                          text: "Admission verified",
                          style: TextStyle(color: AppColors.inkDarker),
                        ),
                        SizedBox(width: 8.w),
                        SvgPicture.asset("assets/images/verified.svg"),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: REdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      // borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: "Current Level: 200",
                          style: Styles.x16dp_000000_400w(),
                        ),
                        SizedBox(height: 8.h),
                        TextWidget(
                          text: "Department: Agricultural Economics",
                          style: Styles.x16dp_000000_400w(),
                        ),
                        SizedBox(height: 8.h),
                        TextWidget(
                          text: "Faculty: Agricultural Science",
                          style: Styles.x16dp_000000_400w(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight + 120;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
