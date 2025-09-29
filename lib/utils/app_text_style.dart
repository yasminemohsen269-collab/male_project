import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:male_project/utils/app_color.dart';

class AppTextStyle {
  static TextStyle onBourdingTileStyle = GoogleFonts.inter(
    fontSize: 32.sp,
    fontWeight: FontWeight.w700,
    color: AppColor.secondaryColor,
  );
  static TextStyle onBourdingDescriptionStyle = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColor.secondaryColor,
  );
  static TextStyle inter14SemiBoldStyle = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: AppColor.secondaryColor,
  );
  static TextStyle black16MediumStyle = GoogleFonts.inter(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColor.blacColor,
  );
}
