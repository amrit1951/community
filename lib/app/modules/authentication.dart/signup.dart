import 'package:community_app/app/modules/authentication.dart/login_widgets.dart';
import 'package:community_app/app/routes/app_routes.dart';
import 'package:community_app/shared/themes/colors.dart';
import 'package:community_app/shared/utils/space.dart';
import 'package:community_app/shared/widgets/btn.dart';
import 'package:community_app/shared/widgets/textfeild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart'; // Your colors file

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  DateTime? _selectedDate;
  // Country _selectedCountry = Country.US;

  Future<void> _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration:
            const BoxDecoration(gradient: AppGradients.linearBlueTealWhite),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                space(height: Get.height * 0),
                logoPart(),
                Container(
                  height: Get.height * 0.7,
                  width: Get.width * 0.8,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Back button
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () => Navigator.pop(context),
                      ),

                      // const SizedBox(height: 10),

                      /// Title
                      const Text(
                        "Sign up",
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 6),

                      /// Subtitle
                      Row(
                        children: [
                          const Text("Already have an account? "),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.LOGIN);
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      /// Full Name
                      CustomTextFormField(
                        label: "Full Name",
                        controller: fullNameController,
                      ),
                      space(height: 10),

                      /// Email
                      CustomTextFormField(
                        label: "Email",
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      space(height: 10),

                      /// Birth of Date
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Birth of date",
                              style: TextStyle(
                                  fontSize: 14, color: Colors.black54)),
                          const SizedBox(height: 6),
                          GestureDetector(
                            onTap: _pickDate,
                            child: Container(
                              height: 50,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: const Color(0xFFE0E0E0)),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              alignment: Alignment.centerLeft,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    _selectedDate == null
                                        ? 'Select date'
                                        : DateFormat('dd/MM/yyyy')
                                            .format(_selectedDate!),
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  const Icon(Icons.calendar_today,
                                      size: 20, color: Colors.grey),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      space(height: 10),

                      /// Phone Number
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Phone Number",
                              style: TextStyle(
                                  fontSize: 14, color: Colors.black54)),
                          const SizedBox(height: 6),
                          Container(
                            height: 50,
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border:
                                  Border.all(color: const Color(0xFFE0E0E0)),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                Text("+91"),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: TextFormField(
                                    controller: phoneController,
                                    keyboardType: TextInputType.phone,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "98564 46564",
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      space(height: 10),

                      /// Password
                      CustomPasswordField(controller: passwordController),
                      const SizedBox(height: 24),

                      /// Register Button
                      CustomButton(
                        label: "Register",
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Submit logic
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
