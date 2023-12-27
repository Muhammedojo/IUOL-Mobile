import '../components/components.dart';
import '../helpers/helper.dart';
import '../packages/package.dart';
import '../screens/screens.dart';
import '../screens_controllers/terms_and_services_controller.dart';
import '../values/values.dart';
import 'stateless_view.dart';

class TermsAndServicesView
    extends StatelessView<TermsAndServices, TermsAndServicesController> {
  const TermsAndServicesView(TermsAndServicesController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundWhite,
        appBar: WidgetHelper()
            .appBackArrowWithTitle(context, title: 'Terms & Conditions'),
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
              height: 24.h,
            ),
            Text(
              '''
By using Iconic Open University’s website and student’s portal, you agree to abide by the following terms and conditions:

1. Access and Use: The website and student’s portal are provided solely for the purpose of accessing educational information, resources, and services related to your studies at Iconic Open University. You are responsible for ensuring that your use of the website and student portal is in compliance with all applicable laws, regulations, and policies.

2. Account Security: You are responsible for maintaining the confidentiality of your login credentials (username and password) and for the activities that occur under your account. You agree not to share your credentials with anyone else and to notify Iconic Open University immediately if you suspect any unauthorized use of your account.

3. Academic Resources: Iconic Open University provides academic resources, including course materials, lecture notes, videos, and assessments, through the website and student’s portal. These resources are intended for personal use and must not be reproduced, distributed, or used for any commercial purposes without prior written permission from Iconic Open University.

4. Communication and Collaboration: The website and student portal may include features that allow you to communicate and collaborate with faculty members, students, and staff. You agree to use these features in a respectful and professional manner, refraining from engaging in any form of harassment, discrimination, or inappropriate behavior.

5. Privacy and Data Protection: Iconic Open University takes the privacy and security of your personal information seriously. The collection and use of your personal data by Iconic Open University are governed by our Privacy Policy. By using the website and student portal, you consent to the collection, storage, and processing of your personal information in accordance with our Privacy Policy.

6. Intellectual Property: The website and student portal, including all materials and resources provided therein, are protected by copyright and other intellectual property rights. You agree not to reproduce, modify, distribute, or otherwise use any copyrighted materials without the prior written permission of the respective copyright holder.

7. Disclaimer of Warranty: Iconic Open University makes no warranties or representations regarding the accuracy, completeness, or reliability of the information, materials, and resources provided on the website and student portal. You agree to use these resources at your own risk.

8. Limitation of Liability: Iconic Open University shall not be liable for any direct, indirect, incidental, consequential, or punitive damages arising out of or in connection with your use of the website and student portal, including but not limited to any errors or omissions in the content, or any interruption, delay, or loss of data.

9. Changes to Terms and Conditions: Iconic Open University reserves the right to modify or update these terms and conditions at any time. Any changes will be posted on the website, and your continued use of the website and student portal after the posting of such changes constitutes your acceptance of the modified terms and conditions.

If you do not agree with these terms and conditions, you should not use the Iconic Open University website and student portal.
''',
              style: Styles.x12dp_090A0A_400w(),
            )
          ],
        ),
      ),
    );
  }
}
