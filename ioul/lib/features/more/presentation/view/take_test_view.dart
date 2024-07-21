import '../../../../components/components.dart';
import '../../../../core/core.dart';
import '../controller/controller.dart';

class TakeTestView extends StatelessView<TakeTest, TakeTestController> {
  const TakeTestView(TakeTestController state, {Key? key})
      : super(state, key: key);

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
