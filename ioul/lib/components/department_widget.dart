import '../packages/package.dart';
import '../helpers/helper.dart';
import '../values/values.dart';

class DeptWidget extends StatelessWidget {
  final String icon;
  final String label;
  final Color? color;

  const DeptWidget(
      {Key? key, required this.icon, required this.label, this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.backgroundWhite,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2.0,
              //spreadRadius: 0.0,
              //offset: Offset(1.0, 1.0), // shadow direction: bottom right
            ),
          ]),
      child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 40, vertical: 40.0),
          child: Column(
            children: [
              Image.asset(
                icon,
                fit: BoxFit.scaleDown,
                height: 60.w,
                width: 60.w,
              ),
              Expanded(
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  // maxLines: 1,
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff090A0A)),
                ),
              )
            ],
          )),
    );
  }
}
