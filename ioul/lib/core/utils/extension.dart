import 'package:ioul/core/values/values.dart';

import '../packages/package.dart';

extension StringExtension on String {
  Text toText({
    bool translate = true,
    FontWeight fontWeight = FontWeight.w400,
    double fontSize = 14,
    double textHeight = 27.45 / 14.0,
    Color? color,
    TextAlign? textAlign,
    FontStyle? fontStyle,
    TextOverflow? textOverflow,
  }) {
    return Text(
      translate ? this.tr() : this,
      textAlign: textAlign,
      style: TextStyle(
          fontFamily: Styles.font,
          fontWeight: fontWeight,
          height: textHeight,
          fontSize: fontSize.sp,
          fontStyle: fontStyle,
          color: color ?? Colors.black12,
          overflow: textOverflow ?? TextOverflow.visible),
    );
  }

  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  SvgPicture toSvg({
    double? width,
    double? height,
    BoxFit? fit,
    Color? color,
  }) {
    return SvgPicture.asset(
      'assets/images/$this.svg',
      width: width,
      height: height,
      // ignore: deprecated_member_use
      color: color,
      fit: fit ?? BoxFit.contain,
    );
  }

  Image pngPicture({
    double? width,
    double? height,
    BoxFit? fit,
  }) {
    return Image.asset(
      'assets/images/$this.png',
      width: width,
      height: height,
      fit: fit,
    );
  }

  String currencyFormat() {
    final f = NumberFormat.currency(locale: "en_NG", symbol: "₦", name: "NGN");
    return f.format(num.parse(this).toDouble());
  }

  String readableDateTime(Locale locale) {
    if (isEmpty) return "";
    return DateFormat('d MMM y hh:mm aa', locale.languageCode)
        .format(DateTime.parse(this));
  }
}
