import '../packages/package.dart';
import '../helpers/helper.dart';
import '../screen_views/profile.dart';
import '../values/colors.dart';

class Profile extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const Profile({Key? key}) : super(key: key);

  @override
  ProfileController createState() => ProfileController();
}

class ProfileController extends State<Profile> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController middlenameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController emailConfirmController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController maritalStatusController = TextEditingController();
  final TextEditingController religionControllr = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController employmentStatusController =
      TextEditingController();
  final TextEditingController nativeLanguageController =
      TextEditingController();
  final TextEditingController nationalIdTypeController =
      TextEditingController();
  final TextEditingController identityNumberController =
      TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();

  onNextPressed() {
    // if (widget.selectedIndex! < 6) {
    setState(() {});
    // }
  }

  String selectedValue = "";

  setSelectedValue(String value) {
    setState(() {
      selectedValue = value;
    });
  }

  showDatePickerDialog() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1970),
      lastDate: DateTime(2200),
      builder: (context, child) => Theme(
          data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
            primary: AppColors.primary,
          )),
          child: child!),
    );

    if (pickedDate != null) {
      setState(() {
        dateOfBirthController.text = pickedDate.toString();
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ProfileView(this);

  //Control logic grouped together, at top of file
  void onBackPressed() {
    NavigatorHelper(context).closeScreen();
  }
}
