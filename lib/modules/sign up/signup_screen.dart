import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_agency_app/constants/constant.dart';
import 'package:travel_agency_app/modules/home/home_screen.dart';
import 'package:travel_agency_app/modules/sign%20up/cubit/cubit.dart';
import 'package:travel_agency_app/modules/sign%20up/cubit/states.dart';
import 'package:travel_agency_app/shared/components/component.dart';

class SignUpScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<SignUpCubit, SignUpStates>(
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
                            'Confirm Password',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  color: darkGreyColor,
                                ),
                          ),
                          CustomFormField(
                            controller: confirmPasswordController,
                            type: TextInputType.visiblePassword,
                            hint: 'Enter same Password, please',
                            validate: 'Please, enter same password',
                          ),
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
                                    builder: (context) => const HomeScreen()));
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
                            'Already have account?',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: blackColor),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Login',
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
                        'I have read and agree to the terms of use and privacy policy of Fly Travel.',
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
