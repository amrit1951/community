import 'package:community_app/app/modules/authentication.dart/login_sc.dart';
import 'package:community_app/app/modules/authentication.dart/signup.dart';
import 'package:community_app/app/modules/community/view/community_view.dart';
import 'package:community_app/app/modules/community/view/splash_screen.dart';
import 'package:community_app/app/modules/members/member_details.dart';
import 'package:community_app/app/modules/members/member_page.dart';
import 'package:get/get.dart';
import 'app_routes.dart';

class AppPages {
  // The initial route when the app starts:
  static const INITIAL = AppRoutes.SPLASH;

  static final routes = <GetPage>[
    GetPage(
      name: AppRoutes.SPLASH,
      page: () =>
          const SplashView(), // replace with your actual SplashView if you have one
      // binding: CommunityBinding(),
    ),
    GetPage(
      name: AppRoutes.COMMUNITY,
      page: () =>
          const CommunityView(), // replace with your actual SplashView if you have one
      // binding: CommunityBinding(),
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      page: () =>
          const LogInScreen(), // replace with your actual SplashView if you have one
      // binding: CommunityBinding(),
    ),
    GetPage(
      name: AppRoutes.SIGNUP,
      page: () =>
          const SignUpPage(), // replace with your actual SplashView if you have one
      // binding: CommunityBinding(),
    ),
    GetPage(
      name: AppRoutes.MEMBERS,
      page: () =>
          const MembersPage(), // replace with your actual SplashView if you have one
      // binding: CommunityBinding(),
    ),
    GetPage(
      name: AppRoutes.MEMBERS,
      page: () =>
          MemberDetails(), // replace with your actual SplashView if you have one
      // binding: CommunityBinding(),
    ),
  ];
}
