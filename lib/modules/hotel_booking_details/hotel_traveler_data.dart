import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:travel_agency_app/constants/constant.dart';
import 'package:travel_agency_app/modules/hotel_booking_details/cubit/cubit.dart';
import 'package:travel_agency_app/modules/hotel_booking_details/cubit/states.dart';
import 'package:travel_agency_app/shared/components/component.dart';

class HotelTravelerData extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  //adult controllers
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController confirmEmailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    HotelBookingDetailsCubit cubit = HotelBookingDetailsCubit.get(context);

    return BlocConsumer<HotelBookingDetailsCubit, HotelBookingDetailsStates>(
      listener: (BuildContext context, HotelBookingDetailsStates state) {},
      builder: (BuildContext context, HotelBookingDetailsStates state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Hotel Traveler data',
            ),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  color: cardColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 20.0,
                          child: SvgPicture.asset(
                            'assets/images/Profile.svg',
                          ),
                        ),
                        Text(
                          'Traveler Data',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        CustomDivider(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'First Name',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            CustomFormField(
                              controller: firstNameController,
                              type: TextInputType.name,
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Text(
                              'Last Name',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            CustomFormField(
                              controller: lastNameController,
                              type: TextInputType.name,
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Text(
                              'Email',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            CustomFormField(
                              controller: emailController,
                              type: TextInputType.emailAddress,
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Text(
                              'Verify email',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            CustomFormField(
                              controller: confirmEmailController,
                              type: TextInputType.emailAddress,
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Text(
                              'Phone',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            IntlPhoneField(
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(fontSize: 16.0),
                              validator: (value) {
                                if (value == null) {
                                  return 'Please Enter Your Phone Number.';
                                }
                              },
                              controller: phoneController,
                              dropdownIconPosition: IconPosition.trailing,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(),
                                ),
                              ),
                              initialCountryCode: 'EG',
                              onChanged: (phone) {
                                print(phone.completeNumber);
                              },
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Text(
                              'Nationality',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            CustomFormField(
                              controller: nationalityController,
                              type: TextInputType.text,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        CustomButton(
                          function: () {
                            if (_formKey.currentState!.validate()) {}
                          },
                          width: double.infinity,
                          text: 'Go to the payment page',
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                      ],
                    ),
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
