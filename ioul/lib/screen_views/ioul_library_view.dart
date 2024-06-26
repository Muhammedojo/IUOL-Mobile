import 'package:ioul/core/utils/extension.dart';

import '../components/components.dart';
import '../core/core.dart';
import '../screens/screens.dart';
import '../screens_controllers/ioul_library_controller.dart';
import 'stateless_view.dart';

class IOULLibraryView
    extends StatelessView<IOULLibrary, IOULLibraryController> {
  const IOULLibraryView(IOULLibraryController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: WidgetWrapper(child: _body(context)),
      appBar: WidgetHelper().appBackArrowWithTitle(context,
          title: 'ioul_library'.tr(), onTap: () => state.onBackPressed()),
    );
  }

  Widget _body(context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      const Column(
        mainAxisSize: MainAxisSize.min,
        children: [],
      ),
      Expanded(
        child: SingleChildScrollView(
          child: Padding(
            padding: REdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 20.h,
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
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    'category'
                        .toText(fontSize: 14, fontWeight: FontWeight.w700),
                    'view_all'.toText()
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                BlocBuilder<CollectionCubit, CollectionState>(
                    builder: (context, stateBloc) {
                  if (stateBloc is CollectionLoading) {
                    return const Loader();
                  } else if (stateBloc is CollectionLoaded) {
                    List<dynamic> dataList = stateBloc.response.datas;
                    return dataList.isNotEmpty
                        ? SizedBox(
                            height: 180,
                            child: ListView.separated(
                                separatorBuilder: (context, index) => SizedBox(
                                      width: 10.h,
                                    ),
                                scrollDirection: Axis.horizontal,
                                itemCount: 4,
                                shrinkWrap: true,
                                // physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  var item = dataList[index];
                                  var link = item['url'] as String?;
                                  return LibraryWidget(
                                    onTap: () {
                                      if (link != null) {
                                        WidgetHelper().launchURL(link);
                                      }
                                    },
                                    collection: Collection.fromJson(item),
                                  );
                                }))
                        : ErrorItemWidget(
                            title: "empty_list".tr(),
                            message: "journal_list_empty".tr(),
                            hideButton: false,
                            onTap: () {
                              state.refresh();
                            },
                          );
                  } else {
                    return ErrorItemWidget(
                      title: "error_occurred".tr(),
                      message: 'stateBloc.message',
                      hideButton: false,
                      onTap: () {
                        state.refresh();
                      },
                    );
                  }
                }),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    'recently_viewed'
                        .toText(fontSize: 14, fontWeight: FontWeight.w700),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                BlocBuilder<CollectionCubit, CollectionState>(
                    builder: (context, stateBloc) {
                  if (stateBloc is CollectionLoading) {
                    return const Loader();
                  } else if (stateBloc is CollectionLoaded) {
                    List<dynamic> dataList = stateBloc.response.datas;
                    return dataList.isNotEmpty
                        ? ListView.separated(
                            separatorBuilder: (context, index) => SizedBox(
                                  height: 10.h,
                                ),
                            itemCount: 4,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              var item = dataList[index];
                              var link = item['url'] as String?;
                              return DeptWidget(
                                onTap: () {
                                  if (link != null) {
                                    WidgetHelper().launchURL(link);
                                  }
                                },
                                collection: Collection.fromJson(item),
                              );
                            })
                        : ErrorItemWidget(
                            title: "empty_list".tr(),
                            message: "journal_list_empty".tr(),
                            hideButton: false,
                            onTap: () {
                              state.refresh();
                            },
                          );
                  } else {
                    return ErrorItemWidget(
                      title: "error_occurred".tr(),
                      message: 'stateBloc.message',
                      hideButton: false,
                      onTap: () {
                        state.refresh();
                      },
                    );
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
  // Widget _body(context) {
  //   return Column(
  //     mainAxisSize: MainAxisSize.min,
  //     children: [
  //       const Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [],
  //       ),
  //       Expanded(
  //         child: SingleChildScrollView(
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               SizedBox(
  //                 height: 15.h,
  //               ),
  //               // Row(
  //               //   children: [
  //               //     Expanded(
  //               //       child: Container(
  //               //         decoration: BoxDecoration(
  //               //             border: Border.all(color: const Color(0xffD1D5DB)),
  //               //             borderRadius: BorderRadius.circular(8.r),
  //               //             color: const Color(0xffD1D5DB).withOpacity(0.2)),
  //               //         child: TextFormField(
  //               //           style: TextStyle(
  //               //               color: const Color(0xff000000),
  //               //               fontFamily: Styles.font,
  //               //               fontSize: 12.sp),
  //               //           controller: state.searchController,
  //               //           onChanged: (_) {},
  //               //           autofocus: false,
  //               //           decoration: InputDecoration(
  //               //             border: InputBorder.none,
  //               //             focusedBorder: InputBorder.none,
  //               //             prefixIcon: SvgPicture.asset(
  //               //               'assets/images/search.svg',
  //               //               color: const Color(0xff000000),
  //               //               width: 16.w,
  //               //               height: 16.w,
  //               //               fit: BoxFit.scaleDown,
  //               //             ),
  //               //             hintText: "search".tr(),
  //               //             hintStyle: TextStyle(
  //               //                 fontSize: 16.sp,
  //               //                 fontWeight: FontWeight.w400,
  //               //                 fontFamily: Styles.font,
  //               //                 color: const Color(0xff6C7072)),
  //               //             //onChanged: searchOperation,
  //               //           ),
  //               //           textInputAction: TextInputAction.search,
  //               //         ),
  //               //       ),
  //               //     ),
  //               //   ],
  //               // ),
  //               // SizedBox(
  //               //   height: 10.h,
  //               // ),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   'category'
  //                       .toText(fontSize: 14, fontWeight: FontWeight.w700),
  //                   'view_all'.toText()
  //                 ],
  //               ),
  //               SizedBox(
  //                 height: 10.h,
  //               ),

  //               BlocBuilder<CollectionCubit, CollectionState>(
  //                   builder: (context, stateBloc) {
  //                 if (stateBloc is CollectionLoading) {
  //                   print('Loading');
  //                   return const Loader();
  //                 } else if (stateBloc is CollectionLoaded) {
  //                   print('Loaded');
  //                   List<dynamic> dataList = stateBloc.response.datas;
  //                   return dataList.isNotEmpty
  //                       ? ListView.separated(
  //                           separatorBuilder: (context, index) => SizedBox(
  //                                 height: 10.h,
  //                               ),
  //                           itemCount: dataList.length,
  //                           shrinkWrap: true,
  //                           physics: const NeverScrollableScrollPhysics(),
  //                           itemBuilder: (context, index) {
  //                             var item = dataList[index];
  //                             var link = item['url'] as String?;
  //                             return DeptWidget(
  //                               onTap: () {
  //                                 if (link != null) {
  //                                   WidgetHelper().launchURL(link);
  //                                 }
  //                               },
  //                               collection: Collection.fromJson(item),
  //                             );
  //                           })
  //                       : ErrorItemWidget(
  //                           title: "empty_list".tr(),
  //                           message: "journal_list_empty".tr(),
  //                           hideButton: false,
  //                           onTap: () {
  //                             state.refresh();
  //                           },
  //                         );
  //                 } else {
  //                   print('Loaded failed');
  //                   return ErrorItemWidget(
  //                     title: "error_occurred".tr(),
  //                     message: 'stateBloc.message',
  //                     hideButton: false,
  //                     onTap: () {
  //                       state.refresh();
  //                     },
  //                   );
  //                 }
  //               }),

  //               // 'Hello'.toText(),
  //               // GridView.count(
  //               //   crossAxisCount: 2,
  //               //   physics: const NeverScrollableScrollPhysics(),
  //               //   mainAxisSpacing: 10,
  //               //   crossAxisSpacing: 12,
  //               //   shrinkWrap: true,
  //               //   children: [
  //               //     DeptWidget(
  //               //       icon: 'assets/images/pine 1.png',
  //               //       label: 'Agriculture & Forestry',
  //               //       onTap: () {},
  //               //     ),
  //               //     DeptWidget(
  //               //       onTap: () {},
  //               //       icon: 'assets/images/microscope (1) 1.png',
  //               //       label: 'Applied Sciences & Professions',
  //               //     ),
  //               //     DeptWidget(
  //               //       onTap: () {},
  //               //       icon: 'assets/images/web-design 1.png',
  //               //       label: 'Arts, Design & Architecture',
  //               //     ),
  //               //     DeptWidget(
  //               //       onTap: () {},
  //               //       icon: 'assets/images/briefcase 1.png',
  //               //       label: 'Business & Management',
  //               //     ),
  //               //     DeptWidget(
  //               //       onTap: () {},
  //               //       icon: 'assets/images/computer-science 1.png',
  //               //       label: 'Computer Science & IT',
  //               //     ),
  //               //     DeptWidget(
  //               //       onTap: () {},
  //               //       icon: 'assets/images/book 1.png',
  //               //       label: 'Education & Training',
  //               //     ),
  //               //     DeptWidget(
  //               //       onTap: () {},
  //               //       icon: 'assets/images/engineering 1.png',
  //               //       label: 'Engineering',
  //               //     ),
  //               //     DeptWidget(
  //               //       onTap: () {},
  //               //       icon: 'assets/images/environmental 1.png',
  //               //       label: 'Earth & Environmental',
  //               //     ),
  //               //     SizedBox(
  //               //       height: 5.h,
  //               //     )
  //               //   ],
  //               // ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
