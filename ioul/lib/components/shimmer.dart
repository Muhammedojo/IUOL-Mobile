import 'package:h3m_shimmer_card/h3m_shimmer_card.dart';
import 'package:ioul/values/values.dart';
import '../packages/package.dart';

class ShimmerTile extends StatelessWidget {
  const ShimmerTile({super.key, this.width, this.height, this.color});

  final double? height;
  final double? width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ShimmerCard(
      width: width ?? double.infinity,
      height: height ?? 70.h,
      beginAlignment: Alignment.topLeft,
      endAlignment: Alignment.bottomRight,
      backgroundColor:
          color?.withOpacity(0.05) ?? AppColors.primary.withOpacity(0.05),
      shimmerColor:
          color?.withOpacity(0.1) ?? AppColors.primary.withOpacity(0.1),
    );
  }
}
