import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPopButton extends StatelessWidget {
  const CustomPopButton({
    super.key,
    this.onTap,
    this.Iconcolor,
    this.Bordercolor,
  });
  final void Function()? onTap;
  final Color? Iconcolor;
  final Color? Bordercolor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () => Navigator.of(context).pop(),
      child: Container(
        padding: EdgeInsets.all(12.sp),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: Bordercolor ?? Colors.white, width: 0.7),
          shape: BoxShape.circle,
          color: Colors.transparent,
        ),
        child: Center(
          child: Icon(Icons.arrow_back, color: Iconcolor, size: 16.sp),
        ),
      ),
    );
  }
}
