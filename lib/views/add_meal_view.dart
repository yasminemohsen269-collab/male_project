import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:male_project/helper/db_helper.dart';
import 'package:male_project/routing/app_routes.dart';
import 'package:male_project/utils/app_color.dart';
import 'package:male_project/utils/app_text_style.dart';
import 'package:male_project/widgets/custom_text_field.dart';
import 'package:male_project/widgets/meal_model.dart';
import 'package:male_project/widgets/primary_button.dart';
import 'package:male_project/widgets/spacing_widgets.dart';

class AddMealView extends StatefulWidget {
  const AddMealView({super.key});

  @override
  State<AddMealView> createState() => _AddMealViewState();
}

class _AddMealViewState extends State<AddMealView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController mealNameController = TextEditingController();
  TextEditingController imageURLController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  DatabaseHelper dbHelper = DatabaseHelper.instance;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Add Meal", style: AppTextStyle.black16MediumStyle),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: isLoading
                ? SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    child: Center(
                      child: SizedBox(
                        width: 40.sp,
                        height: 40.sp,
                        child: CircularProgressIndicator(
                          color: AppColor.praimaryColor,
                        ),
                      ),
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Meal Name", style: AppTextStyle.black16MediumStyle),
                      const HightSpace(height: 16),
                      CustomTextField(
                        controller: mealNameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "please add Meal name";
                          } else if (value.length < 2) {
                            return "please add more than 2 characters";
                          }
                          return null;
                        },
                      ),
                      const HightSpace(height: 16),
                      Text("Image URL", style: AppTextStyle.black16MediumStyle),
                      const HightSpace(height: 8),
                      CustomTextField(
                        controller: imageURLController,
                        maxLines: 2,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "please add image url";
                          }
                          return null;
                        },
                      ),
                      const HightSpace(height: 16),
                      Text("Rate", style: AppTextStyle.black16MediumStyle),
                      const HightSpace(height: 8),
                      CustomTextField(
                        controller: rateController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "please add rate";
                          }

                          return null;
                        },
                      ),
                      const HightSpace(height: 16),
                      Text("Time", style: AppTextStyle.black16MediumStyle),
                      const HightSpace(height: 8),
                      CustomTextField(
                        controller: timeController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "please add time for meal";
                          }

                          return null;
                        },
                      ),
                      const HightSpace(height: 16),
                      Text(
                        "Description",
                        style: AppTextStyle.black16MediumStyle,
                      ),
                      const HightSpace(height: 8),
                      CustomTextField(
                        controller: descriptionController,
                        maxLines: 4,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "please add Description for meal";
                          }

                          return null;
                        },
                      ),
                      const HightSpace(height: 30),
                      PrimaryButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            isLoading = true;
                            setState(() {});
                            Meal meal = Meal(
                              imageUrl: imageURLController.text,
                              title: mealNameController.text,
                              description: descriptionController.text,
                              time: timeController.text,
                              rate: double.parse(rateController.text),
                            );
                            dbHelper.insertMeal(meal).then((value) {
                              GoRouter.of(
                                context,
                              ).pushReplacement(AppRoutes.homeView);
                            });
                          }
                        },
                        text: "Save",
                      ),
                      const HightSpace(height: 20),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
