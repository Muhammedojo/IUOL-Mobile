import '../core/core.dart';

class LibraryWidget extends StatelessWidget {
  final Color? color;
  final Function() onTap;
  final Collection? collection;

  const LibraryWidget(
      {Key? key, this.color, required this.onTap, this.collection})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          width: 180.0, // Adjust the width as needed
          margin: REdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 0.9,
                blurRadius: 1.0,
              ),
            ],
          ),
          child: Padding(
            padding: REdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: 'grommet'.toSvg(height: 60.w, width: 60.w)),
                SizedBox(height: 15.0.h),
                Center(
                  child: Text(
                    '${collection?.title}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: Styles.font,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff090A0A)),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
