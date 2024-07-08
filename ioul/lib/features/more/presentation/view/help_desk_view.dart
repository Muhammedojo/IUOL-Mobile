import '../../../../components/components.dart';
import '../../../../core/core.dart';
import '../../../../screens/screens.dart';
import '../controller/help_desk_controller.dart';
import '../../../../screen_views/stateless_view.dart';

class HelpDeskView extends StatelessView<HelpDesk, HelpDeskController> {
  const HelpDeskView(HelpDeskController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundWhite,
        appBar: WidgetHelper().appBackArrowWithTitle(context,
            title: 'help_desk'.tr(), onTap: () => state.onBackPressed()),
        body: WidgetWrapper(child: _body()));
  }

  Widget _body() {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  'assets/images/mail.svg',
                  fit: BoxFit.scaleDown,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text('support@iconicuniversity.edu.ng',
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: Styles.font,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff090A0A))),
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            const Divider(),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/images/phone.svg',
                  fit: BoxFit.scaleDown,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text('+2347064658830',
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: Styles.font,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff090A0A))),
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            const Divider(),
            Row(
              children: [
                // SvgPicture.asset(
                //   'assets/images/whatsapp.svg',
                //   fit: BoxFit.scaleDown,
                //   color: Colors.green,
                // ),
                const Icon(Icons.chat_outlined),
                SizedBox(
                  width: 10.w,
                ),
                Text('+2347064658830',
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: Styles.font,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff090A0A))),
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
