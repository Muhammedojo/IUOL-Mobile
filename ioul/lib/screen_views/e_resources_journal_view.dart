import 'dart:convert';

import 'package:pinput/pinput.dart';

import '../bloc/bloc.dart';
import '../helpers/helper.dart';
import '../packages/package.dart';
import '../components/components.dart';
import '../screens/screens.dart';
import '../screens_controllers/e_resources_journal_controller.dart';
import '../values/values.dart';
import 'stateless_view.dart';

class EResourcesView extends StatelessView<EResources, EResourcesController> {
  const EResourcesView(EResourcesController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: WidgetHelper().appBackArrowWithTitle(context,
            title: 'e_resource_library'.tr(),
            onTap: () => state.onBackPressed()),
        body: WidgetWrapper(child: _body(context)));
  }

  Widget _body(context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 30.h,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xffD1D5DB)),
                        borderRadius: BorderRadius.circular(8.r),
                        color: const Color(0xffD1D5DB).withOpacity(0.2)),
                    child: TextFormField(
                      style: TextStyle(
                          color: const Color(0xff000000),
                          fontFamily: Styles.font,
                          fontSize: 12.sp),
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
                        hintText: "search".tr(),
                        hintStyle: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: Styles.font,
                            color: const Color(0xff6C7072)),
                        //onChanged: searchOperation,
                      ),
                      textInputAction: TextInputAction.search,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 22.h,
            ),
            BlocBuilder<JournalCubit, JournalState>(
                builder: (context, stateBloc) {
              if (stateBloc is JournalLoading) {
                return const Loader();
              } else if (stateBloc is JournalLoaded) {
                Map<String, dynamic> decodedResponse =
                    jsonDecode('${stateBloc.response.data}');

                List<dynamic> dataList = decodedResponse['data'];

                return stateBloc.response.isRequestSuccessful()
                    ? ListView.separated(
                        separatorBuilder: (context, index) => SizedBox(
                              height: 10.h,
                            ),
                        itemCount: dataList.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          var item = dataList[index];
                          var link = item['url'];
                          return EResourceWidget(
                            onTap: () => WidgetHelper().launchURL(link),
                            journal: item,
                          );
                        })
                    : ErrorItemWidget(
                        title: "empty_list".tr(),
                        message: "course_list_empty".tr(),
                        hideButton: false,
                        onTap: () {
                          state.refresh();
                        },
                      );
              }
              return ErrorItemWidget(
                title: "error_occurred".tr(),
                message: "Couldn't fetch courses",
                hideButton: false,
                onTap: () {
                  state.refresh();
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
