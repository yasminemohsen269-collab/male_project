import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:male_project/utils/app_assets.dart';
import 'package:male_project/utils/app_color.dart';
import 'package:male_project/utils/app_text_style.dart';
import 'package:male_project/widgets/spacing_widgets.dart';

class OnBourdingView extends StatefulWidget {
  const OnBourdingView({super.key});

  @override
  State<OnBourdingView> createState() => _OnBourdingViewState();
}

class _OnBourdingViewState extends State<OnBourdingView> {
  List<String> tiles = [
    "Save Your Meals Ingredient",
    "Use Our App The Best Choice",
    " Our App Your Ultimate Choice",
  ];
  List<String> descriptions = [
    "Add Your Meals and its Ingredients and we will save it for you",
    "the best choice for your kitchen do not hesitate",
    "All the best restaurants and their top menus are ready for you",
  ];
  int currentIndexPage = 0;
  CarouselSliderController controller = CarouselSliderController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.onBourdingImage),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            bottom: 30.h,
            top: 328.h,
            right: 32.w,
            left: 32.w,
            child: Container(
              width: 311.w,
              height: 400.h,
              padding: EdgeInsets.all(32.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(48.r),
                color: AppColor.praimaryColor.withOpacity(0.9),
              ),
              child: Column(
                children: [
                  CarouselSlider(
                    carouselController: controller,
                    options: CarouselOptions(
                      height: 250.h,
                      viewportFraction: 0.9,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndexPage = index;
                        });
                      },
                    ),

                    items: List.generate(tiles.length, (index) {
                      return Builder(
                        builder: (BuildContext context) {
                          return SizedBox(
                            width: 252.w,

                            child: Column(
                              children: [
                                Text(
                                  tiles[index],
                                  textAlign: TextAlign.center,
                                  style: AppTextStyle.onBourdingTileStyle,
                                ),
                                HightSpace(height: 16.h),
                                Text(
                                  descriptions[index],
                                  textAlign: TextAlign.center,
                                  style:
                                      AppTextStyle.onBourdingDescriptionStyle,
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }),
                  ),
                  HightSpace(height: 36.sp),
                  DotsIndicator(
                    dotsCount: 3,
                    position: currentIndexPage.toDouble(),
                    decorator: DotsDecorator(
                      size: const Size(24, 6),
                      activeSize: const Size(24.0, 6.0),
                      color: Colors.grey,
                      activeColor: AppColor.secondaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onTap: (index) {
                      controller.animateToPage(index);
                      currentIndexPage = index;
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
