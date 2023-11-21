import '../packages/package.dart';
import '../components/components.dart';
import '../screens/screens.dart';
import '../screens_controllers/library_controller.dart';
import '../values/values.dart';
import 'stateless_view.dart';

class LibraryView extends StatelessView<Library, LibraryController> {
  const LibraryView(LibraryController state, {Key? key})
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
            'iOUL Library',
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
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 25.h,
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
                        fontFamily: 'Inter',
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
          SizedBox(
            height: 12.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Category',
                style: Styles.x16dp_202325_400w(),
              ),
              InkWell(
                  onTap: () {},
                  child: Text(
                    'View All',
                    style: Styles.x16dp_4EAFFF_400w(),
                  ))
            ],
          ),
          SizedBox(
            height: 28.h,
          ),
          SizedBox(
            height: 192.h,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => SizedBox(
                      width: 10.w,
                    ),
                itemCount: 5,
                shrinkWrap: true,
                itemBuilder: (context, index) => DeptWidget(
                      icon: 'assets/images/computer-science 1.png',
                      label: 'Computer & IT',
                      onTap: () {},
                    )),
          ),
          SizedBox(
            height: 12.h,
          ),
          Row(
            children: [
              Text(
                'Recently viewed',
                style: Styles.x16dp_202325_400w(),
              ),
            ],
          ),
          SizedBox(
            height: 12.h,
          ),
          ListView.separated(
            separatorBuilder: (context, index) => SizedBox(
              height: 1.h,
            ),
            itemCount: 5,
            shrinkWrap: true,
            itemBuilder: (context, index) => EResourceWidget(
              onTap: () {},
              tittle: 'College Open Text Books',
            ),
          ),
        ],
      )),
    );
  }
}
