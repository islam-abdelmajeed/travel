import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_agency_app/constants/constant.dart';
import 'package:travel_agency_app/modules/refund_reservation/cubit/cubit.dart';
import 'package:travel_agency_app/modules/refund_reservation/cubit/states.dart';
import 'package:travel_agency_app/shared/components/component.dart';

class RefundReservationScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController refNumberController = TextEditingController();
  RefundReservationCubit cubit = RefundReservationCubit();
  final _formKey = GlobalKey<FormState>();
  String? gender;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<RefundReservationCubit, RefundReservationStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: defaultColor,
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      Text(
                        'Manage your reservation',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        'View, print, email or change your itinerary',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      CustomFormField(
                        controller: emailController,
                        type: TextInputType.text,
                        hint: 'The email used during booking',
                        validate: 'Please enter email',
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      CustomFormField(
                        controller: refNumberController,
                        type: TextInputType.text,
                        hint: 'Fly Travel reference number',
                        validate: 'Please enter reference number',
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot your reference number?',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: lightColor),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      CustomButton(
                        function: () {
                          if (_formKey.currentState!.validate()) {}
                        },
                        text: 'Restore reservation',
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
