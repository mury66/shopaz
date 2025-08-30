import 'package:ecommerce_c15_str/core/resources/assets_manager.dart';
import 'package:ecommerce_c15_str/core/resources/color_manager.dart';
import 'package:ecommerce_c15_str/core/resources/values_manager.dart';
import 'package:ecommerce_c15_str/core/routes_manager/routes.dart';
import 'package:ecommerce_c15_str/core/widget/custom_elevated_button.dart';
import 'package:ecommerce_c15_str/core/widget/main_text_field.dart';
import 'package:ecommerce_c15_str/core/widget/validators.dart';
import 'package:ecommerce_c15_str/di.dart';
import 'package:ecommerce_c15_str/features/auth/data/datasources/auth_remote_ds_impl.dart';
import 'package:ecommerce_c15_str/features/auth/data/reposiotry/auth_repo_impl.dart';
import 'package:ecommerce_c15_str/features/auth/domain/usecases/login_usecase.dart';
import 'package:ecommerce_c15_str/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/styles_manager.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: BlocProvider(
        create: (context) => getIt<AuthBloc>(),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state.loginRequestState == RequestState.success) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.mainRoute,
                (route) => false,
              );
            } else if (state.loginRequestState == RequestState.error) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("Error"),
                  content: Text(state.loginFailure?.message ?? ""),
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
                      Center(child: SvgPicture.asset(SvgAssets.routeLogo)),
                      SizedBox(height: AppSize.s40.h),
                      Text(
                        'Welcome Back To Route',
                        style: getBoldStyle(
                          color: ColorManager.white,
                        ).copyWith(fontSize: FontSize.s24.sp),
                      ),
                      Text(
                        'Please sign in with your mail',
                        style: getLightStyle(
                          color: ColorManager.white,
                        ).copyWith(fontSize: FontSize.s16.sp),
                      ),
                      SizedBox(height: AppSize.s50.h),
                      BuildTextField(
                        backgroundColor: ColorManager.white,
                        hint: 'enter your name',
                        label: 'User name',
                        controller: emailController,
                        textInputType: TextInputType.emailAddress,
                        validation: AppValidators.validateEmail,
                      ),
                      SizedBox(height: AppSize.s28.h),
                      BuildTextField(
                        hint: 'enter your password',
                        backgroundColor: ColorManager.white,
                        label: 'Password',
                        controller: passwordController,
                        validation: AppValidators.validatePassword,
                        isObscured: true,
                        textInputType: TextInputType.text,
                      ),
                      SizedBox(height: AppSize.s8.h),
                      Row(
                        children: [
                          const Spacer(),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              'Forget password?',
                              style: getMediumStyle(
                                color: ColorManager.white,
                              ).copyWith(fontSize: FontSize.s18.sp),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: AppSize.s60.h),
                      Center(
                        child: SizedBox(
                          // width: MediaQuery.of(context).size.width * .8,
                          child: CustomElevatedButton(
                            // borderRadius: AppSize.s8,
                            isStadiumBorder: false,
                            label: 'Login',
                            backgroundColor: ColorManager.white,
                            textStyle: getBoldStyle(
                              color: ColorManager.primary,
                              fontSize: AppSize.s18,
                            ),
                            onTap: () {
                              BlocProvider.of<AuthBloc>(context).add(
                                LoginEvent(
                                  emailController.text,
                                  passwordController.text,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 30.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don’t have an account?',
                            style: getSemiBoldStyle(
                              color: ColorManager.white,
                            ).copyWith(fontSize: FontSize.s16.sp),
                          ),
                          SizedBox(width: AppSize.s8.w),
                          GestureDetector(
                            onTap: () => Navigator.pushNamed(
                              context,
                              Routes.signUpRoute,
                            ),
                            child: Text(
                              'Create Account',
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
