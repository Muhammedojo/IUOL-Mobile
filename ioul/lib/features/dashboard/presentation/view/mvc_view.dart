import '../../../../components/components.dart';
import '../../../../core/core.dart';
import '../controller/controller.dart';

class BlankView extends StatelessView<Blank, BlankController> {
  const BlankView(BlankController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundWhite,
        body: WidgetWrapper(child: _body()));
  }

  Widget _body() {
    return const SizedBox();
  }
}
