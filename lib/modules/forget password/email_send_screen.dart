import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_agency_app/constants/constant.dart';
import 'package:travel_agency_app/modules/login/login_screen.dart';
import 'package:travel_agency_app/shared/components/component.dart';

class EmailSendScreen extends StatelessWidget {
  const EmailSendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.1,
                ),
                SvgPicture.asset(
                  'assets/images/success_icon.svg',
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Text(
                  'Email Sended Successfully',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Text(
                  'Please check your email and click on the link to reset your password',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                CustomButton(
                    function: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    text: 'Login'),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Didn't receive the link?",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: blackColor),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Resend the link',
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
    );
  }
}
