import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:male_project/utils/app_assets.dart';
import 'package:male_project/utils/app_color.dart';
import 'package:male_project/utils/app_text_style.dart';

class CustomTopHomePart extends StatelessWidget {
  const CustomTopHomePart({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppAssets.homescreenImage,
          height: 270.h,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 24.h,
          left: 30.w,
          bottom: 20.h,
          child: Container(
            height: 186.h,
            width: 195.w,
            alignment: Alignment.center,

            decoration: BoxDecoration(
              color: AppColor.praimaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(48.r),
            ),
            child: Center(
              child: Text(
                textAlign: TextAlign.left,
                "Welcome Add A New Recipe",
                style: AppTextStyle.onBourdingTileStyle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
