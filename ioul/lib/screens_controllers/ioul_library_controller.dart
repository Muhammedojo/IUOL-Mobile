import 'package:ioul/core/packages/package.dart';
import '../core/bloc/collection/collection_cubit.dart';
import '../screen_views/ioul_library_view.dart';
import '../core/helpers/helper.dart';

class IOULLibrary extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const IOULLibrary({Key? key}) : super(key: key);

  @override
  IOULLibraryController createState() => IOULLibraryController();
}

class IOULLibraryController extends State<IOULLibrary> {
  //... //Initialization code, state vars etc, all go here

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    context.read<CollectionCubit>().loadCollectionsFromServer();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => IOULLibraryView(this);

  //Control logic grouped together, at top of file
  void onBackPressed() {
    NavigatorHelper(context).closeScreen();
  }

  refresh() {
    if (mounted) {
      context.read<CollectionCubit>().loadCollectionsFromServer();
    }
  }
}
