import 'package:shopaz_e_commerce/core/routes_manager/routes.dart';
import 'package:shopaz_e_commerce/core/widget/custom_elevated_button.dart';
import 'package:shopaz_e_commerce/di.dart';
import 'package:shopaz_e_commerce/features/auth/data/models/signup_request.dart';
import 'package:shopaz_e_commerce/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/widget/main_text_field.dart';
import '../../../../core/widget/validators.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var rePasswordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: BlocProvider(
        create: (context) => getIt<AuthBloc>(),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state.signUpRequestState == RequestState.success) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.mainRoute,
                (route) => false,
              );
            } else if (state.signUpRequestState == RequestState.error) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("Error"),
                  content: Text(state.signUpFailure?.message ??""),
                ),
              );
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: AppSize.s40.h),
                    Center(child: Image.asset(ImageAssets.shopazLogo)),
                      SizedBox(height: AppSize.s60.h),
                      BuildTextField(
                        backgroundColor: ColorManager.white,
                        hint: 'enter your full name',
                        label: 'Full Name',
                        controller: nameController,
                        textInputType: TextInputType.name,
                        validation: AppValidators.validateFullName,
                      ),
                      SizedBox(height: AppSize.s18.h),
                      BuildTextField(
                        hint: 'enter your mobile no.',
                        backgroundColor: ColorManager.white,
                        label: 'Mobile Number',
                        controller: phoneController,

                        validation: AppValidators.validatePhoneNumber,
                        textInputType: TextInputType.phone,
                      ),
                      SizedBox(height: AppSize.s18.h),
                      BuildTextField(
                        hint: 'enter your email address',
                        backgroundColor: ColorManager.white,
                        label: 'E-mail address',
                        controller: emailController,

                        validation: AppValidators.validateEmail,
                        textInputType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: AppSize.s18.h),
                      BuildTextField(
                        hint: 'enter your password',
                        backgroundColor: ColorManager.white,
                        label: 'password',
                        controller: passwordController,

                        validation: AppValidators.validatePassword,
                        isObscured: true,
                        textInputType: TextInputType.text,
                      ),
                      SizedBox(height: AppSize.s50.h),
                      Center(
                        child: SizedBox(
                          height: AppSize.s60.h,
                          width: MediaQuery.of(context).size.width * .9,
                          child: CustomElevatedButton(
                            // borderRadius: AppSize.s8,
                            label: 'Sign Up',
                            backgroundColor: ColorManager.white,
                            textStyle: getBoldStyle(
                              color: ColorManager.primary,
                              fontSize: AppSize.s20,
                            ),
                            onTap: () {
                              SignupRequest request = SignupRequest(
                                name: nameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                                rePassword: passwordController.text,
                                phone: phoneController.text,
                              );

                              BlocProvider.of<AuthBloc>(
                                context,
                              ).add(SignUpEvent(request));
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: AppSize.s50.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'already have an account?',
                            style: getSemiBoldStyle(
                              color: ColorManager.white,
                            ).copyWith(fontSize: FontSize.s16.sp),
                          ),
                          SizedBox(width: AppSize.s8.w),
                          GestureDetector(
                            onTap: () => Navigator.pushNamed(
                              context,
                              Routes.signInRoute,
                            ),
                            child: Text(
                              'Log in',
                              style: getSemiBoldStyle(
                                color: ColorManager.white,
                              ).copyWith(fontSize: FontSize.s16.sp),
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
