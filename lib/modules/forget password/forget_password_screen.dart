import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_agency_app/constants/constant.dart';
import 'package:travel_agency_app/modules/forget%20password/cubit/cubit.dart';
import 'package:travel_agency_app/modules/forget%20password/cubit/states.dart';
import 'package:travel_agency_app/modules/forget%20password/email_send_screen.dart';
import 'package:travel_agency_app/modules/home/home_screen.dart';
import 'package:travel_agency_app/modules/login/login_screen.dart';
import 'package:travel_agency_app/modules/sign%20up/signup_screen.dart';
import 'package:travel_agency_app/shared/components/component.dart';

class ForgetPasswordScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordStates>(
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
                        'Fprget Password',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Text(
                        'Moments to change the password',
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
                      CustomButton(
                        function: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const EmailSendScreen()));
                        },
                        text: 'Send',
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Remember password?',
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
