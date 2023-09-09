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
        appBar: AppBar(
          centerTitle: true,
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(40.0.h), child: const SizedBox()),
          title: Text(
            'iOUL E-Resource Journal',
            style: Styles.x18dp_202326_700w(),
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
              height: 22.h,
            ),
            EResourceWidget(onTap: () {  }, tittle: 'AGORA - AGRICULTURE'),
            EResourceWidget(onTap: () {  }, tittle: 'EBSCO'),
            EResourceWidget(onTap: () {  }, tittle: 'NATIONAL VIRTUAL LIBRARY'),
            EResourceWidget(onTap: () {  }, tittle: 'ONLINE ACCESS TO RESEARCH IN THE ENVIRONMENT (OARE)'),
            EResourceWidget(onTap: () {  }, tittle: 'Khan Academy'),
          ],
        ),
      ),
    );
  }
}
