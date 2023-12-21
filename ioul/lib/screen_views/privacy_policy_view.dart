import '../components/components.dart';
import '../helpers/helper.dart';
import '../packages/package.dart';
import '../screens/screens.dart';
import '../screens_controllers/privacy_policy_controller.dart';
import '../values/values.dart';
import 'stateless_view.dart';

class PrivacyPolicyView
    extends StatelessView<PrivacyPolicy, PrivacyPolicyController> {
  const PrivacyPolicyView(PrivacyPolicyController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundWhite,
        appBar: WidgetHelper()
            .appBackArrowWithTitle(context, title: 'Privacy Policy'),
        body: WidgetWrapper(child: _body()));
  }

  Widget _body() {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 25.h,
          ),
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: AppColors.backgroundWhite,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2.0,
                    spreadRadius: 0.0,
                    offset: Offset(1.0, 1.0), // shadow direction: bottom right
                  ),
                ],
              ),
              child: ExpansionTile(
                title: Text(
                  'The Policy',
                  style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff191C1C)),
                ),
                textColor: Colors.red,
                children: [
                  Padding(
                    padding:
                        REdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                    child: Text(
                      '''This Privacy Policy describes how we collect and use your personal data during your use of the Iconic University website https://www.iconicuniversity.edu.ng and any other sub-domain under iconicuniversity.edu.ng. By using this website, you are consenting to our collection and use of information in accordance with our Privacy Policy.''',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: const Color(0xff000000),
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )
                ],
              )),
          SizedBox(
            height: 10.h,
          ),
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: AppColors.backgroundWhite,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2.0,
                    spreadRadius: 0.0,
                    offset: Offset(1.0, 1.0), // shadow direction: bottom right
                  ),
                ],
              ),
              child: ExpansionTile(
                title: Text(
                  'The Information We Gathered',
                  style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff191C1C)),
                ),
                textColor: Colors.red,
                children: [
                  Padding(
                    padding:
                        REdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                    child: Text(
                      '''The Iconic University  and her regulatory agencies accumulate certain information regarding your use of our website, such as your Location, IP address and Browser type. All your activity and the pages you visit on the website will be tracked, but you will remain unidentified. We may use the information gathered to know about your location identity and from where you are accessing our website. All information gathered are treated officially not personal.''',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: const Color(0xff000000),
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )
                ],
              )),
          SizedBox(
            height: 10.h,
          ),
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: AppColors.backgroundWhite,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2.0,
                    spreadRadius: 0.0,
                    offset: Offset(1.0, 1.0), // shadow direction: bottom right
                  ),
                ],
              ),
              child: ExpansionTile(
                title: Text(
                  'The Information Usage',
                  style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff191C1C)),
                ),
                textColor: Colors.red,
                children: [
                  Padding(
                    padding:
                        REdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                    child: Text(
                      '''The University processes the information gathered from you for systems administration, abuse prevention, and track of user trends, and for the other purposes described in this policy. When you send an email, the email address you provide may be used to send you information, respond to inquiries, and/or other requests or questions. The University do not share, sell, rent, exchange, swap, trade or authorize any outside party to use your data/email address for marketing purposes without your approval. Be notified that, your information may be shared with our regulatory agencies or vendors to the level where necessary to provide and improve our website services or other communications to users and students.''',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: const Color(0xff000000),
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )
                ],
              )),
          SizedBox(
            height: 10.h,
          ),
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: AppColors.backgroundWhite,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2.0,
                    spreadRadius: 0.0,
                    offset: Offset(1.0, 1.0), // shadow direction: bottom right
                  ),
                ],
              ),
              child: ExpansionTile(
                title: Text(
                  'The Collection of Information',
                  style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff191C1C)),
                ),
                textColor: Colors.red,
                children: [
                  Padding(
                    padding:
                        REdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                    child: Text(
                      '''Organizations like Amazon, Google and others may use cookies, web beacons, and similar technologies to collect or receive information from our website and elsewhere on the internet and use that information to provide measurement services and target ads. You can opt out of the collection and use of this information through this link http://www.networkadvertising.org/managing/opt_out.asp.''',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: const Color(0xff000000),
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )
                ],
              )),
          SizedBox(
            height: 10.h,
          ),
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: AppColors.backgroundWhite,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2.0,
                    spreadRadius: 0.0,
                    offset: Offset(1.0, 1.0), // shadow direction: bottom right
                  ),
                ],
              ),
              child: ExpansionTile(
                title: Text(
                  'The Cookies',
                  style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff191C1C)),
                ),
                textColor: Colors.red,
                children: [
                  Padding(
                    padding:
                        REdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                    child: Text(
                      '''Our site uses cookies to distinguish you from other users of our site. This helps us to provide you with a good experience when you browse our site and also allows us to improve our site. Cookies are small files that are stored on your computer (unless you block them). We use cookies to understand and save your preferences for future visits and compile aggregate data about site traffic and site interaction so that we can offer better site experiences and tools in the future. You may disable cookies through your individual browser options.''',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: const Color(0xff000000),
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )
                ],
              )),
          SizedBox(
            height: 10.h,
          ),
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: AppColors.backgroundWhite,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2.0,
                    spreadRadius: 0.0,
                    offset: Offset(1.0, 1.0), // shadow direction: bottom right
                  ),
                ],
              ),
              child: ExpansionTile(
                title: Text(
                  'The Information Protection',
                  style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff191C1C)),
                ),
                textColor: Colors.red,
                children: [
                  Padding(
                    padding:
                        REdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                    child: Text(
                      '''This site has highly attended security measures put in place to help protect against the loss, misuse, and alteration of the information under our domain. However, no method of transmission over the Internet or method of electronic storage is 100% safe and secure.''',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: const Color(0xff000000),
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )
                ],
              )),
          SizedBox(
            height: 10.h,
          ),
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: AppColors.backgroundWhite,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2.0,
                    spreadRadius: 0.0,
                    offset: Offset(1.0, 1.0), // shadow direction: bottom right
                  ),
                ],
              ),
              child: ExpansionTile(
                title: Text(
                  'The Changes to Policy',
                  style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff191C1C)),
                ),
                textColor: Colors.red,
                children: [
                  Padding(
                    padding:
                        REdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                    child: Text(
                      '''This Privacy Policy may be amended from time to time. Any changes we may make to our privacy policy in the future will be posted on this page. Please check back frequently to see any updates or changes to our privacy policy.''',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: const Color(0xff000000),
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )
                ],
              )),
          SizedBox(
            height: 10.h,
          )
        ],
      )),
    );
  }
}
