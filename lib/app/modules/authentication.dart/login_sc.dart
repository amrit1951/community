import 'package:community_app/app/modules/authentication.dart/login_widgets.dart';
import 'package:community_app/app/routes/app_routes.dart';
import 'package:community_app/shared/themes/colors.dart';
import 'package:community_app/shared/themes/text_styles.dart';
import 'package:community_app/shared/utils/space.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../shared/widgets/textfeild.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    bool _rememberMe = false;
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration:
            const BoxDecoration(gradient: AppGradients.linearBlueTealWhite),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              space(height: Get.height * 0.08),
              logoPart(),
              Container(
                height: Get.height * 0.6,
                width: Get.width * 0.8,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.arrow_back),
                        ),
                        space(width: 60),
                        Text(
                          "Login",
                          style: XB24.copyWith(
                              color: AppColors.textPrimary, fontSize: 30),
                        ),
                      ],
                    ),

                    space(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have a account?",
                          style: M16.copyWith(color: AppColors.textSecondary),
                        ),
                        space(width: 5),
                        InkWell(
                          onTap: () {
                            Get.toNamed(AppRoutes.SIGNUP);
                          },
                          child: Text(
                            "Sign Up",
                            style: M16.copyWith(color: AppColors.primary),
                          ),
                        )
                      ],
                    ),
                    space(height: 10),
                    CustomTextFormField(
                      label: 'Email',
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return 'Email is required';
                        if (!value.contains('@')) return 'Enter a valid email';
                        return null;
                      },
                    ),
                    space(height: 10),
                    CustomPasswordField(
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return 'Password is required';
                        if (value.length < 6)
                          return 'Password must be at least 6 characters';
                        return null;
                      },
                    ),
                    space(height: 10),

                    /// Row: Remember Me & Forgot Password
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: _rememberMe,
                              onChanged: (value) {
                                setState(() {
                                  _rememberMe = value!;
                                });
                              },
                            ),
                            const Text(
                              'Remember me',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Forgot Password ?',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    /// Login Button
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0066CC),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          'Log In',
                          style: M16.copyWith(color: AppColors.background),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// OR Divider
                    const Row(
                      children: [
                        Expanded(child: Divider()),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child:
                              Text('Or', style: TextStyle(color: Colors.grey)),
                        ),
                        Expanded(child: Divider()),
                      ],
                    ),

                    const SizedBox(height: 20),

                    /// Google Button
                    socialButton(
                      icon: "assets/icons/google.png",
                      text: 'Continue with Google',
                      onPressed: () {},
                    ),

                    const SizedBox(height: 12),

                    /// Facebook Button
                    socialButton(
                      icon: "assets/icons/fb.png",
                      text: 'Continue with Facebook',
                      onPressed: () {},
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
