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
      body: WidgetWrapper(child: _body()),
      appBar: WidgetHelper().appBackArrowWithTitle(context,
          title: 'ioul_library'.tr(), onTap: () => state.onBackPressed()),
    );
  }

  Widget _body() {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
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
                          itemCount: dataList.length,
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
                } else if (stateBloc is JournalFailure) {
                  return ErrorItemWidget(
                    title: "error_occurred".tr(),
                    message: 'stateBloc.message',
                    hideButton: false,
                    onTap: () {
                      state.refresh();
                    },
                  );
                }
                return Container();
              },
            ),
            // 'Hello'.toText(),
            // GridView.count(
            //   crossAxisCount: 2,
            //   physics: const NeverScrollableScrollPhysics(),
            //   mainAxisSpacing: 10,
            //   crossAxisSpacing: 12,
            //   shrinkWrap: true,
            //   children: [
            //     DeptWidget(
            //       icon: 'assets/images/pine 1.png',
            //       label: 'Agriculture & Forestry',
            //       onTap: () {},
            //     ),
            //     DeptWidget(
            //       onTap: () {},
            //       icon: 'assets/images/microscope (1) 1.png',
            //       label: 'Applied Sciences & Professions',
            //     ),
            //     DeptWidget(
            //       onTap: () {},
            //       icon: 'assets/images/web-design 1.png',
            //       label: 'Arts, Design & Architecture',
            //     ),
            //     DeptWidget(
            //       onTap: () {},
            //       icon: 'assets/images/briefcase 1.png',
            //       label: 'Business & Management',
            //     ),
            //     DeptWidget(
            //       onTap: () {},
            //       icon: 'assets/images/computer-science 1.png',
            //       label: 'Computer Science & IT',
            //     ),
            //     DeptWidget(
            //       onTap: () {},
            //       icon: 'assets/images/book 1.png',
            //       label: 'Education & Training',
            //     ),
            //     DeptWidget(
            //       onTap: () {},
            //       icon: 'assets/images/engineering 1.png',
            //       label: 'Engineering',
            //     ),
            //     DeptWidget(
            //       onTap: () {},
            //       icon: 'assets/images/environmental 1.png',
            //       label: 'Earth & Environmental',
            //     ),
            //     SizedBox(
            //       height: 5.h,
            //     )
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
