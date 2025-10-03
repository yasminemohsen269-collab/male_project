import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:male_project/helper/db_helper.dart';
import 'package:male_project/routing/app_routes.dart';
import 'package:male_project/utils/app_color.dart';
import 'package:male_project/utils/app_text_style.dart';
import 'package:male_project/widgets/custom_food_item.dart';

import 'package:male_project/widgets/custom_top_home_part.dart';
import 'package:male_project/widgets/meal_model.dart';
import 'package:male_project/widgets/spacing_widgets.dart';

DatabaseHelper dbHelper = DatabaseHelper.instance;

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
            HightSpace(height: 20.h),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                    HightSpace(height: 12.h),
                    Expanded(
                      child: FutureBuilder(
                        future: dbHelper.getMeals(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: const CircularProgressIndicator(),
                            );
                          } else if (snapshot.hasData) {
                            return GridView.builder(
                              itemCount: snapshot.data!.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,

                                    mainAxisSpacing: 20.sp,
                                    crossAxisSpacing: 20.sp,
                                    childAspectRatio: 0.9,
                                  ),
                              itemBuilder: (context, index) {
                                Meal meal = snapshot.data![index];
                                return CustomFoodItem(
                                  imageUrl: meal.imageUrl,
                                  title: meal.title,
                                  rate: meal.rate,
                                  time: meal.time,
                                  onTap: () {
                                    GoRouter.of(context).push(
                                      AppRoutes.mealDetailsView,
                                      extra: meal,
                                    );
                                  },
                                );
                              },
                            );
                          } else if (snapshot.hasError) {
                            return Center(child: Text("${snapshot.error}"));
                          }
                          return Container();
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
          onPressed: () {
            GoRouter.of(context).push(AppRoutes.addMealView);
          },
        ),
      ),
    );
  }
}
