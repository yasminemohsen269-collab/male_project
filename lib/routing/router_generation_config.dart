import 'package:go_router/go_router.dart';
import 'package:male_project/routing/app_routes.dart';
import 'package:male_project/views/on_bourding_view.dart';

class RouterGenerationConfig {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRoutes.onBoardingView,
    routes: [
      GoRoute(
        path: AppRoutes.onBoardingView,
        builder: (context, state) => const OnBourdingView(),
      ),
    ],
  );
}
