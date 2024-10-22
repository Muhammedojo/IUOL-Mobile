import '../../../../components/components.dart';
import '../../../../core/core.dart';
import '../bloc/bloc.dart';
import '../controller/controller.dart';

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
                BlocBuilder<CollectionCubit, CollectionState>(
                  builder: (context, stateBloc) {
                    if (stateBloc is CollectionLoading) {
                      return const Loader();
                    } else if (stateBloc is CollectionLoaded) {
                      List<dynamic> dataList = stateBloc.response.datas;
                      return Column(
                        children: [
                          // Search Bar
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0xffD1D5DB)),
                                      borderRadius: BorderRadius.circular(8.r),
                                      color: const Color(0xffD1D5DB)
                                          .withOpacity(0.2)),
                                  child: TextFormField(
                                    style: TextStyle(
                                        color: const Color(0xff000000),
                                        fontFamily: Styles.font,
                                        fontSize: 12.sp),
                                    controller: state.searchController,
                                    onChanged: (searchTerm) {
                                      // Update the search term in the controller
                                      state.searchTerm = searchTerm;
                                      context.read<CollectionCubit>().add(
                                          SearchCollectionEvent(searchTerm));
                                    },
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
                          // Category Section
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              'category'.toText(
                                  fontSize: 14, fontWeight: FontWeight.w700),
                              'view_all'.toText()
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          // Category List
                          dataList.isNotEmpty
                              ? SizedBox(
                                  height: 180,
                                  child: ListView.separated(
                                      separatorBuilder: (context, index) =>
                                          SizedBox(
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
                                ),
                          SizedBox(
                            height: 20.h,
                          ),
                          // Recently Viewed Section
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              'recently_viewed'.toText(
                                  fontSize: 14, fontWeight: FontWeight.w700),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          // Recently Viewed List
                          dataList.isNotEmpty
                              ? ListView.separated(
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
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
                                ),
                        ],
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
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
