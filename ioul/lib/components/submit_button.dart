import '../packages/package.dart';
import '../values/values.dart';

class SubmitButtonWidget extends StatelessWidget {
  final String label;
  final Function() onPressed;
  const SubmitButtonWidget({Key? key, required this.label, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(45.sp),
          color: const Color(0xff25435B
          ),
        ),
        child: Center(
          child: Padding(
            padding: REdgeInsets.symmetric(vertical: 16.0,horizontal: 90),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily:'Inter',
                        color: const Color(0xffFFFFFF),
                        fontWeight: FontWeight.w500),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
