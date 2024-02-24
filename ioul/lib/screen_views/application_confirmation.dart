import 'package:group_button/group_button.dart';
import 'package:ioul/bloc/application_form_data/application_form_data_cubit.dart';
import 'package:ioul/bloc/country/country_cubit.dart';
import 'package:ioul/helpers/helper.dart';
import 'package:ioul/packages/package.dart';
import 'package:ioul/router/route_constants.dart';
import '../bloc/application_form_data/application_form_data_state.dart';
import '../components/components.dart';
import '../screens_controllers/application_confirmation.dart';
import '../values/values.dart';
import 'stateless_view.dart';

class ApplicationConfirmationView extends StatelessView<ApplicationConfirmation,
    ApplicationConfirmationController> {
  const ApplicationConfirmationView(ApplicationConfirmationController state,
      {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.backgroundWhite,
      appBar: WidgetHelper().appBackArrowOnly(context),
      body: WidgetWrapper(
        child: SingleChildScrollView(
          child: SizedBox(
            // padding: MediaQuery.of(context).viewInsets,
            child: Padding(
              padding: REdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(height: 60.h),
                  Image.asset(
                    "assets/images/iconic_logo.png",
                    // fit: BoxFit.contain,
                    height: 120.h,
                    width: 174.w,
                  ),
                  SizedBox(height: 36.h),
                  TextWidget(
                    text:
                        "Your application process is about to start. Choose one of the program types below.",
                    style: Styles.x18dp_000000_400w(),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 42.h),
                  GroupButton(
                    onSelected: (value, ind, isSelected) {
                      state.setSelectedValue(value);
                    },
                    buttons: const [
                      "Certification Program",
                      "Diploma Program",
                      "Degree Program",
                      "Masters Program"
                    ],
                    options: GroupButtonOptions(
                      groupingType: GroupingType.column,
                      runSpacing: 16,

                      // spacing: 16,
                      borderRadius: BorderRadius.circular(24.r),
                      buttonHeight: 48.h,
                      buttonWidth: 210.w,
                      selectedTextStyle: Styles.x16dp_4EAFFF_400w(),
                      unselectedTextStyle: Styles.x16dp_404446_400w(),
                      selectedColor: AppColors.primaryLightest,
                      unselectedColor: AppColors.inkLight,
                      //elevation: 1,
                      // selectedShadow: ,
                    ),
                  ),
                  SizedBox(height: 95.h),
                  BlocListener<ApplicationFormDataCubit,
                      ApplicationFormDataState>(
                    listener: (context, formDataState) {
                      if (formDataState is ApplicationFormDataLoading) {
                        WidgetHelper.showProgress(text: 'Processing');
                      }
                      if (formDataState is ApplicationFormDataLoaded) {
                        WidgetHelper.hideProgress();
                        context.pushNamed(RouteConstants.applicationForm);
                      }
                      if (formDataState is ApplicationFormDataFailure) {
                        WidgetHelper.hideProgress();
                        WidgetHelper.showToastError(
                          context,
                          formDataState.message,
                        );
                      }
                    },
                    child: ElevatedButtonWidget(
                        title: "Proceed",
                        onTap: () {
                          state.getFormDataForSelectedProgram();
                          // context.read<CountryCubit>().loadCountiresFromServer();
                          // context.pushNamed(RouteConstants.applicationForm);
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
