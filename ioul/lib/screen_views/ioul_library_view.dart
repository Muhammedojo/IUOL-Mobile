import '../components/components.dart';
import '../helpers/widget_helper.dart';
import '../packages/package.dart';
import '../screens/screens.dart';
import '../screens_controllers/ioul_library_controller.dart';
import '../values/values.dart';
import 'stateless_view.dart';

class IOULLibraryView
    extends StatelessView<IOULLibrary, IOULLibraryController> {
  const IOULLibraryView(IOULLibraryController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: WidgetWrapper(child: _body()),
      appBar:
          WidgetHelper().appBackArrowWithTitle(context, title: 'iOUL Library'),
    );
  }

  Widget _body() {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: REdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xffD1D5DB)),
                            borderRadius: BorderRadius.circular(8.r),
                            color: const Color(0xffD1D5DB).withOpacity(0.2)),
                        child: TextFormField(
                          style: TextStyle(color: const Color(0xff000000), fontFamily: 'Inter', fontSize: 12.sp),
                          controller: state.searchController,
                          onChanged: (_) {},
                          autofocus: false,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            prefixIcon: SvgPicture.asset(
                              'assets/images/search.svg',
                              color: const Color(0xff000000),
                              width: 16.w,
                              height: 16.w,
                              fit: BoxFit.scaleDown,
                            ),
                            hintText: "Search",
                            hintStyle: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Inter',
                                color: const Color(0xff6C7072)),
                            //onChanged: searchOperation,
                          ),
                          textInputAction: TextInputAction.search,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 26.h,
              ),
            ],
          ),
          Expanded(
              child: SingleChildScrollView(
                  child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GridView.count(
                crossAxisCount: 2,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 10,
                crossAxisSpacing: 12,
                shrinkWrap: true,
                children: [
                  InkWell(
                      onTap: () {
                       // state.onBackPressed();
                      },
                      child: const DeptWidget(
                        icon: 'assets/images/pine 1.png',
                        label: 'Agriculture & Forestry',
                      )),
                  InkWell(
                    onTap: () {
                     // state.onBackPressed();
                    },
                    child: const DeptWidget(
                      icon: 'assets/images/microscope (1) 1.png',
                      label: 'Applied Sciences & Professions',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                     // state.onBackPressed();
                    },
                    child: const DeptWidget(
                      icon: 'assets/images/web-design 1.png',
                      label: 'Arts, Design & Architecture',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                     // state.onBackPressed();
                    },
                    child: const DeptWidget(
                      icon: 'assets/images/briefcase 1.png',
                      label: 'Business & Management',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                     // state.onBackPressed();
                    },
                    child: const DeptWidget(
                      icon: 'assets/images/computer-science 1.png',
                      label: 'Computer Science & IT',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                    //  state.onBackPressed();
                    },
                    child: const DeptWidget(
                      icon: 'assets/images/book 1.png',
                      label: 'Education & Training',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                     // state.onBackPressed();
                    },
                    child: const DeptWidget(
                      icon: 'assets/images/engineering 1.png',
                      label: 'Engineering',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                     // state.onBackPressed();
                    },
                    child: const DeptWidget(
                      icon: 'assets/images/environmental 1.png',
                      label: 'Earth & Environmental',
                    ),
                  ),
                  SizedBox(height: 5.h,)
                ],
              ),
            ],
          )))
        ],
      ),
    );
  }
}
