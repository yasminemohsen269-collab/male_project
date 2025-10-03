import 'package:go_router/go_router.dart';
import 'package:male_project/routing/app_routes.dart';
import 'package:male_project/views/add_meal_view.dart';
import 'package:male_project/views/home_view.dart';
import 'package:male_project/views/meal_details_view.dart';
import 'package:male_project/views/on_bourding_view.dart';
import 'package:male_project/widgets/meal_model.dart';

class RouterGenerationConfig {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRoutes.onBoardingView,
    routes: [
      GoRoute(
        path: AppRoutes.onBoardingView,
        builder: (context, state) => const OnBourdingView(),
      ),
      GoRoute(
        path: AppRoutes.homeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: AppRoutes.addMealView,
        builder: (context, state) => const AddMealView(),
      ),
      GoRoute(
        path: AppRoutes.mealDetailsView,
        builder: (context, state) {
          Meal meal = state.extra as Meal;
          return MealDetailsView(meal: meal);
        },
      ),
    ],
  );
}
