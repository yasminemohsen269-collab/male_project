import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:male_project/utils/app_color.dart';
import 'package:male_project/utils/app_text_style.dart';
import 'package:male_project/widgets/custom_pop_button.dart';
import 'package:male_project/widgets/meal_model.dart';
import 'package:male_project/widgets/spacing_widgets.dart';

class MealDetailsView extends StatelessWidget {
  const MealDetailsView({super.key, required this.meal});
  final Meal meal;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(8.sp),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(16.r),
                      child: CachedNetworkImage(
                        imageUrl: meal.imageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 327.h,
                      ),
                    ),
                    Positioned(
                      left: 12.w,
                      top: 12.h,
                      child: CustomPopButton(Iconcolor: Colors.white),
                    ),
                  ],
                ),
              ),
              HightSpace(height: 16),
              Padding(
                padding: EdgeInsets.all(24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      meal.title,
                      style: AppTextStyle.black16MediumStyle.copyWith(
                        fontSize: 24.sp,
                      ),
                    ),
                    HightSpace(height: 21),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(8.sp),
                      decoration: BoxDecoration(
                        color: AppColor.praimaryColor.withOpacity(0.09),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.timelapse,
                                color: AppColor.praimaryColor,
                                size: 16.sp,
                              ),
                              WidthSpace(width: 4.w),
                              Text(
                                meal.time,
                                style: AppTextStyle.black16MediumStyle.copyWith(
                                  fontSize: 12.sp,
                                  color: const Color.fromARGB(
                                    255,
                                    155,
                                    154,
                                    154,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: AppColor.praimaryColor,
                                size: 16.sp,
                              ),
                              WidthSpace(width: 4.w),
                              Text(
                                meal.rate.toString(),
                                style: AppTextStyle.black16MediumStyle.copyWith(
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    HightSpace(height: 27),
                    Divider(thickness: 2),
                    HightSpace(height: 24),
                    Text("description", style: AppTextStyle.black16MediumStyle),

                    HightSpace(height: 8),

                    Text(
                      meal.description + " , happy to see you again",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 117, 112, 112),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
