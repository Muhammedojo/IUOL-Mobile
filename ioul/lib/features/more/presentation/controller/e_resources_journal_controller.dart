import '../../../../core/core.dart';
import '../bloc/bloc.dart';
import '../view/e_resources_journal_view.dart';

class EResources extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const EResources({Key? key}) : super(key: key);

  @override
  EResourcesController createState() => EResourcesController();
}

class EResourcesController extends State<EResources> {
  //... //Initialization code, state vars etc, all go here
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<JournalCubit>().loadJournalsFromServer();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => EResourcesView(this);

  //Control logic grouped together, at top of file
  void onBackPressed() {
    NavigatorHelper(context).closeScreen();
  }

  refresh() {
    context.read<JournalCubit>().loadJournalsFromServer();
  }
}
