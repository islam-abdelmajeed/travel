import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_agency_app/constants/constant.dart';
import 'package:travel_agency_app/modules/forget%20password/forget_password_screen.dart';
import 'package:travel_agency_app/modules/home/home_screen.dart';
import 'package:travel_agency_app/layout/layout_screen.dart';
import 'package:travel_agency_app/modules/login/cubit/cubit.dart';
import 'package:travel_agency_app/modules/login/cubit/states.dart';
import 'package:travel_agency_app/modules/sign%20up/signup_screen.dart';
import 'package:travel_agency_app/shared/components/component.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        return Scaffold(
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: size.height * 0.1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Fly ',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  color: blackColor,
                                ),
                          ),
                          Text(
                            'Travel',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  color: defaultColor,
                                ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Text(
                        'Login',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Text(
                        'Welcome back',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Email',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  color: darkGreyColor,
                                ),
                          ),
                          CustomFormField(
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            hint: 'Enter your email, please',
                            validate: 'Please, enter your email',
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Password',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  color: darkGreyColor,
                                ),
                          ),
                          CustomFormField(
                            controller: passwordController,
                            type: TextInputType.visiblePassword,
                            hint: 'Enter your Password, please',
                            validate: 'Please, enter your password',
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ForgetPasswordScreen()));
                              },
                              child: Text(
                                'Forget Password?',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: lightColor),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      CustomButton(
                        function: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LayoutScreen()));
                          }
                        },
                        text: 'Login',
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'New User?',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: blackColor),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpScreen()));
                            },
                            child: Text(
                              'Create Account',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(color: lightColor),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: CustomDivider(
                              height: 1.0,
                            ),
                          ),
                          Text(
                            'Or loign via',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Expanded(
                            child: CustomDivider(
                              height: 2.0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: SvgPicture.asset('assets/images/google.svg'),
                          ),
                          SizedBox(
                            width: size.width * 0.1,
                          ),
                          InkWell(
                            onTap: () {},
                            child:
                                SvgPicture.asset('assets/images/facebook.svg'),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Text(
                        'By logging in, you agree to the terms of use and privacy policy.',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      SizedBox(
                        height: size.height * 0.1,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
