import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../shared/constants/app_color.dart';
import '../../../utils/ui_helper.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color? color;
  final String btnText;
  final double? width;
  final double? height;

  const CustomElevatedButton(
      {Key? key,
      required this.onPressed,
      this.color = AppColor.accent,
      this.width,
      this.height,
      required this.btnText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 56.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: color, elevation: 0),
        onPressed: onPressed,
        child: Text(
          btnText,
          style: UITextStyle.buttonTextStyle(color: AppColor.textWhite),
        ),
      ),
    );
  }
}
