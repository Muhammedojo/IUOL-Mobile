import '../../../../core/core.dart';
import '../view/document_resources_view.dart';

class DocumentResources extends StatefulWidget {
  final Course? course;

  const DocumentResources({Key? key, this.course}) : super(key: key);

  @override
  DocumentResourcesController createState() => DocumentResourcesController();
}

class DocumentResourcesController extends State<DocumentResources> {
  //... //Initialization code, state vars etc, all go here
  int selectedPeriod = 0;
  String selectedPeriodType = "First Study Period";
  List<String> periodType = [
    "First Study Period",
    "Second Study Period",
    "Third Study Period",
  ];
  List<String> pdfUrls = [
    'https://www.invoicely.com/download/pdf/Invoice-Sample.pdf',
    'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf',
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => DocumentResourcesView(this);

  //Control logic grouped together, at top of file
  void onBackPressed() {
    NavigatorHelper(context).closeScreen();
  }

  onChipSelected(int index) {
    // print("new index: $index");
    setState(() {
      selectedPeriod = index;
    });
  }
}
