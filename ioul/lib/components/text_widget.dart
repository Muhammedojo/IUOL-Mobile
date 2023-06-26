import 'package:flutter/cupertino.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    Key? key,
    required this.text,
    this.style,
    this.maxLines,
    this.overflow,
    this.textAlign,
  }) : super(key: key);
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: style,
        textAlign: textAlign,
        overflow: overflow,
        maxLines: maxLines);
  }
}
