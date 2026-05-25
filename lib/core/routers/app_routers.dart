import 'package:e_commerce/core/utils/widgets/screens_id.dart';
import 'package:e_commerce/features/auth/presentation/views/login_view.dart';
import 'package:e_commerce/features/auth/presentation/views/signup_view.dart';
import 'package:e_commerce/features/cart/presentation/views/cart_view.dart';
import 'package:e_commerce/features/checkout/presentation/views/checkout_view.dart';
import 'package:e_commerce/features/get_started/presentation/views/get_started_veiw.dart';
import 'package:e_commerce/features/home/data/models/product_model/product_model.dart';
import 'package:e_commerce/features/home/presentation/views/app_view.dart';
import 'package:e_commerce/features/onBoarding/presentation/views/onboarding1_view.dart';
import 'package:e_commerce/features/onBoarding/presentation/views/onboarding2_view.dart';
import 'package:e_commerce/features/onBoarding/presentation/views/onboarding3_view.dart';
import 'package:e_commerce/features/onBoarding/presentation/views/onboarding_view.dart';
import 'package:e_commerce/features/product_details/presentation/views/product_details_view.dart';
import 'package:e_commerce/features/profile/presentation/views/update_profile.dart';
import 'package:e_commerce/features/splash/presentation/views/spalsh_view.dart';
import 'package:e_commerce/features/home/presentation/views/home_view.dart';
import 'package:go_router/go_router.dart';

class AppRouters {
  static final routers = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SpalshView()),
      GoRoute(
        path: '/${ScreensId.onboarding1View}',
        builder: (context, state) => const Onboarding1View(),
      ),
      GoRoute(
        path: '/${ScreensId.onboarding2View}',
        builder: (context, state) => const Onboarding2View(),
      ),
      GoRoute(
        path: '/${ScreensId.onboarding3View}',
        builder: (context, state) => const Onboarding3View(),
      ),
      GoRoute(
        path: '/${ScreensId.onBoardingView}',
        builder: (context, state) => const OnboardingView(),
      ),
      GoRoute(
        path: '/${ScreensId.getStartedView}',
        builder: (context, state) => const GetStartedVeiw(),
      ),
      GoRoute(
        path: '/${ScreensId.loginView}',
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: '/${ScreensId.signupView}',
        builder: (context, state) => const SignupView(),
      ),
      // GoRoute(
      //   path: '/${ScreensId.searchView}',
      //   builder: (context, state) => const SearchView(),
      // ),
      GoRoute(
        path: '/${ScreensId.homeView}',
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: '/${ScreensId.checkout}',
        builder: (context, state) {
          final product = state.extra as ProductModel;
      
          return CheckoutView(productModel: product);
        },
      ),
      GoRoute(
        path: '/${ScreensId.cartView}',
        builder: (context, state) {
          final product = state.extra as ProductModel;

          return CartView(productModel: product);
        },
      ),
      GoRoute(
        path: '/${ScreensId.appView}',
        builder: (context, state) => const AppView(),
      ),
      GoRoute(
        path: '/${ScreensId.productDetailsView}',
        builder: (context, state) {
          final product = state.extra as ProductModel;
          return ProductDetailsView(product: product);
        },
      ),
      GoRoute(
        path: '/${ScreensId.updateProfile}',
        builder: (context, state) => const UpdateProfileView(),
      ),
    ],
  );
}
