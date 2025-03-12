import 'dart:io';

import '../../../../core/core.dart';
import '../../../../core/data/response/responses.dart';
import '../../../more/presentation/bloc/bloc.dart';
import '../bloc/bloc.dart';
import '../view/application_view.dart';

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  ApplicationController createState() => ApplicationController();
}

class ApplicationController extends State<Application> {
  //... //Initialization code, state vars etc, all go here

  final formKey = GlobalKey<FormState>();
  CountryData selectedCountry = CountryData();
  bool visible = false;
  bool checked = false;
  final picker = ImagePicker();

  final ScrollController tabScrollController = ScrollController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController middlenameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController emailConfirmController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController maritalStatusController = TextEditingController();
  final TextEditingController religionController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController employmentStatusController =
      TextEditingController();
  final TextEditingController nativeLanguageController =
      TextEditingController();
  final TextEditingController nationalIdTypeController =
      TextEditingController();
  final TextEditingController identityNumberController =
      TextEditingController();
  final TextEditingController nationalityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController lgaController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController stateOfResidenceController =
      TextEditingController();
  final TextEditingController permanentAddressController =
      TextEditingController();
  final TextEditingController workAddressController = TextEditingController();
  final TextEditingController nokNameController = TextEditingController();
  final TextEditingController nokEmailController = TextEditingController();
  final TextEditingController nokAddressController = TextEditingController();
  final TextEditingController refEmailController = TextEditingController();
  final TextEditingController nokPhoneController = TextEditingController();
  final TextEditingController refNameController = TextEditingController();
  final TextEditingController refPhoneController = TextEditingController();
  final TextEditingController refAddressController = TextEditingController();
  final TextEditingController sponsorController = TextEditingController();
  final TextEditingController sponsorNameController = TextEditingController();
  final TextEditingController sponsorAddressController =
      TextEditingController();
  final TextEditingController programController = TextEditingController();
  final TextEditingController highestQualificationController =
      TextEditingController();
  final TextEditingController levelController = TextEditingController();
  final TextEditingController qualificationController = TextEditingController();
  final TextEditingController certificateTypeController =
      TextEditingController();
  final TextEditingController centerNameController = TextEditingController();
  final TextEditingController centerNumberController = TextEditingController();
  final TextEditingController examNumberController = TextEditingController();
  final TextEditingController examYearController = TextEditingController();
  final TextEditingController passportImageController = TextEditingController();
  final TextEditingController pdfDocumentController = TextEditingController();
  int currentStep = 0;
  File? passportImage;
  File? documentImage;
  final List<String> tabs = [
    'Personal',
    'Address',
    'Contacts',
    'Sponsor',
    'Program',
    'Certificate',
    'Upload',
  ];

  String? selectedValue = "",
      selectedGender,
      maritalStatus,
      employmentStatus,
      selectedIDType,
      countryCode = "";

  String nokCountryCode = "";
  String refCountryCode = "";
  String selectedProgramme = "";

  setSelectedValue(String value) {
    setState(() {
      selectedValue = value;
    });
  }

  previous() {
    setState(() {
      currentStep--;
    });
  }

  next() {
    setState(() {
      currentStep++;
    });
  }

  @override
  void initState() {
    super.initState();
    FilePicker.platform;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollToActiveTab();
    });
  }

  @override
  void dispose() {
    tabScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ApplicationView(this);

  //Control logic grouped together, at top of file
  void onBackPressed() {
    NavigatorHelper(context).closeScreen();
  }

  // void scrollToActiveTab() {
  //   // Calculate the position to scroll to (approximate)
  //   double screenWidth = MediaQuery.of(context).size.width;
  //   double tabWidth = screenWidth / 3; // Assuming ~3 tabs visible at once
  //   double offset = currentStep * tabWidth - (screenWidth / 2) + (tabWidth / 2);

  //   offset = offset.clamp(0.0, tabScrollController.position.maxScrollExtent);

  //   // Animate to the position
  //   tabScrollController.animateTo(
  //     offset,
  //     duration: const Duration(milliseconds: 300),
  //     curve: Curves.easeInOut,
  //   );
  // }
  void scrollToActiveTab() {
    // Calculate the position to scroll to (approximate)
    double screenWidth = MediaQuery.of(context).size.width;
    double tabWidth = screenWidth / 3; // Assuming ~3 tabs visible at once
    double indicatorWidth = 40; // Width of the active indicator
    double tabPadding = 16; // Padding added to the tabs
    double offset = currentStep * tabWidth - (screenWidth / 2) + (tabWidth / 2);

    // Adjust offset to ensure the indicator is visible
    if (currentStep >= tabs.length - 2) {
      // If it's one of the last two tabs, scroll to the end
      offset = tabScrollController.position.maxScrollExtent;
    } else if (currentStep > 0) {
      // If it's not the first tab, adjust for the indicator width
      offset += indicatorWidth / 2 + tabPadding;
    }

    offset = offset.clamp(0.0, tabScrollController.position.maxScrollExtent);

    // Animate to the position
    tabScrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void onSelectProgramme(String selectedValue) {
    ApplicationFormDataState states =
        context.read<ApplicationFormDataCubit>().state;
    if (states is ApplicationFormDataLoaded) {
      Map<String, String> programmesMap = states.formData.programmesMap!;
      String? selectedKey;
      programmesMap.forEach((key, value) {
        if (value == selectedValue) {
          selectedKey = key;
        }
      });
      if (selectedKey != null) {
      } else {}
    }
  }

  toggleCheck() {
    setState(() {
      checked = !checked;
    });
  }

  Future<void> choosePassport(
      ImageSource source, TextEditingController controller) async {
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      if (pickedFile.path.isNotEmpty) {
        final file = File(pickedFile.path);
        final fileSize = await file.length();
        if (!mounted) return;
        if (fileSize <= 1048576) {
          setState(() {
            passportImage = file;
          });
        } else {
          WidgetHelper.showToastError(context, "Image size exceed 1MB");
        }
      }
    }
  }

  Future<void> chooseDocument(TextEditingController controller) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;
      if (!mounted) return;
      if (file.extension == 'pdf') {
        setState(() {
          documentImage = File(file.path!);
        });
      } else {
        WidgetHelper.showToastError(context, "Selected file is not a PDF");
      }
    }
  }

  onSelectCountry(String value) {
    CountryState state = context.read<CountryCubit>().state;
    if (state is CountryLoaded) {
      selectedCountry = state.response.data!.firstWhere((element) =>
          element.name!.trim().toLowerCase() == value.trim().toLowerCase());
    }
  }

  void submitForm() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Form submitted successfully!')),
    );
  }

  showDatePickerDialog() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1970),
      lastDate: DateTime(2200),
      builder: (context, child) => Theme(
          data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
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
}
