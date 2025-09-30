import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:male_project/utils/app_assets.dart';
import 'package:male_project/utils/app_color.dart';
import 'package:male_project/utils/app_text_style.dart';
import 'package:male_project/widgets/custom_food_item.dart';

import 'package:male_project/widgets/custom_top_home_part.dart';
import 'package:male_project/widgets/spacing_widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTopHomePart(),
            HightSpace(height: 25.h),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 8.sp),
                      child: Text(
                        "Your Food",
                        style: AppTextStyle.black16MediumStyle,
                      ),
                    ),
                    HightSpace(height: 8.h),
                    Expanded(
                      child: GridView.builder(
                        itemCount: 30,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,

                          mainAxisSpacing: 22.sp,
                          crossAxisSpacing: 16.sp,
                          childAspectRatio: 0.9,
                        ),
                        itemBuilder: (context, index) {
                          return CustomFoodItem(
                            imageUrl: AppAssets.foodItemImage,
                            title: "Burger",
                            rate: 4.9,
                            time: "20 - 30",
                            onTap: () {},
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.praimaryColor,
          shape: const CircleBorder(),

          child: Icon(Icons.add, color: Colors.white, size: 24.sp),
          onPressed: () {},
        ),
      ),
    );
  }
}
