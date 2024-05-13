import '../bloc/bloc.dart';
import '../helpers/helper.dart';
import '../screen_views/report_view.dart';
import '../packages/package.dart';

class Report extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const Report({Key? key}) : super(key: key);

  @override
  ReportController createState() => ReportController();
}

class ReportController extends State<Report> {
  //... //Initialization code, state vars etc, all go here

  @override
  void initState() {
    context.read<ReportCubit>().loadReportsFromServer();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ReportView(this);

  //Control logic grouped together, at top of file
  void onBackPressed() {
    NavigatorHelper(context).closeScreen();
  }

  refresh() {
    context.read<ReportCubit>().loadReportsFromServer();
  }
}
