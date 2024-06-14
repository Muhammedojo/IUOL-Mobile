import '../core/core.dart';
import '../screens/screens.dart';
import '../components/components.dart';
import '../screens_controllers/assignment_controller.dart';
import 'stateless_view.dart';

class AssignmentView extends StatelessView<Assignments, AssignmentController> {
  const AssignmentView(AssignmentController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.skyLightest,
        appBar: AppBar(
          centerTitle: true,
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(40.0.h), child: const SizedBox()),
          title: Text('semester_assignment'.tr(),
              style: Styles.x18dp_202326_700w()),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[Color(0xff25435B), Color(0xff2799F7)]),
            ),
          ),
        ),
        body: WidgetWrapper(child: _body(context)));
  }

  Widget _body(context) {
    return SingleChildScrollView(
      child: Padding(
        padding: REdgeInsets.all(10.0),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(
            height: 20.h,
          ),
          BlocBuilder<AssignmentCubit, AssignmentState>(
              builder: (context, stateBloc) {
            if (stateBloc is AssignmentLoading) {
              return const Loader();
            } else if (stateBloc is AssignmentLoaded) {
              return stateBloc.assignmentList.isNotEmpty
                  ? ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                            height: 10.h,
                          ),
                      itemCount: stateBloc.assignmentList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        var assignment = stateBloc.assignmentList[index];
                        return AssignmentWidget(
                          onTap: () => state.showAssignmentPreview(assignment),
                          assignment: assignment,
                        );
                      })
                  : ErrorItemWidget(
                      title: "empty_list".tr(),
                      message: "Assignment List is empty",
                      hideButton: false,
                      onTap: () {
                        state.refresh();
                      },
                    );
            }
            return ErrorItemWidget(
              title: "error_occurred".tr(),
              message: "Couldn't fetch assignments",
              hideButton: false,
              onTap: () {
                state.refresh();
              },
            );
          }),
        ]),
      ),
    );
  }
}
