import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:male_project/utils/app_color.dart';
import 'package:male_project/utils/app_text_style.dart';
import 'package:male_project/widgets/spacing_widgets.dart';

class CustomFoodItem extends StatelessWidget {
  const CustomFoodItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.rate,
    required this.time,
    this.onTap,
  });

  final String imageUrl;
  final String title;
  final double rate;
  final String time;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8.sp),
        width: 153.w,

        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 246, 237, 237),
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.asset(
                imageUrl,
                height: 145.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            HightSpace(height: 8.h),
            SizedBox(
              width: 120.w,
              child: Text(
                title,
                maxLines: 1,
                style: AppTextStyle.black16MediumStyle,
              ),
            ),
            HightSpace(height: 18.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: AppColor.praimaryColor,
                      size: 16.sp,
                    ),
                    WidthSpace(width: 4.w),
                    Text(
                      rate.toString(),
                      style: AppTextStyle.black16MediumStyle.copyWith(
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.timelapse,
                      color: AppColor.praimaryColor,
                      size: 16.sp,
                    ),
                    WidthSpace(width: 4.w),
                    Text(
                      time,
                      style: AppTextStyle.black16MediumStyle.copyWith(
                        fontSize: 12.sp,
                        color: const Color.fromARGB(255, 155, 154, 154),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
