import 'package:flutter/material.dart';
import '../../../shared/constants/app_color.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color? color;
  final Color? textColor;
  final String btnText;
  final double? width;
  final double? height;
  final Widget? prefixIcon;

  const CustomElevatedButton(
      {Key? key,
      required this.onPressed,
      this.color = AppColor.primary,
      this.width,
      this.textColor,
      this.height,
      this.prefixIcon,
      required this.btnText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (prefixIcon != null) const SizedBox(width: 20),
            prefixIcon ?? const SizedBox.shrink(),
            Expanded(
              child : Text(
                btnText,
                style: TextStyle(color: textColor,fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
