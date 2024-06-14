import 'package:animated_custom_dropdown/custom_dropdown.dart';
import '../core/core.dart';

class CustomDropdownWidget extends StatelessWidget {
  const CustomDropdownWidget({
    super.key,
    required this.dropdownList,
    this.onChange,
    this.controller,
  });

  final List<String> dropdownList;
  final Function? onChange;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return CustomDropdown(
      borderSide: BorderSide(
        color: AppColors.inkLight,
        width: 1.w,
      ),
      borderRadius: BorderRadius.circular(8.r),
      hintText: 'select'.tr(),
      items: dropdownList,
      controller: controller!,
      selectedStyle: Styles.x16dp_72777A_400w(),
      listItemStyle: Styles.x16dp_000000_400w(),
      // fieldSuffixIcon: ,
      onChanged: (value) => onChange!(value),
    );
  }
}
