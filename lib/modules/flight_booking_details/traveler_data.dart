import 'package:country_list_pick/country_list_pick.dart';
import 'package:country_list_pick/country_selection_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:travel_agency_app/constants/constant.dart';
import 'package:travel_agency_app/modules/flight_booking_details/cubit/cubit.dart';
import 'package:travel_agency_app/modules/flight_booking_details/cubit/states.dart';
import 'package:travel_agency_app/shared/components/component.dart';

class TravelerData extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  //adult controllers
  TextEditingController firstNameController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController confirmEmailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController passportNumberController = TextEditingController();

  //child controllers
  TextEditingController firstNameChildController = TextEditingController();
  TextEditingController middleNameChildController = TextEditingController();
  TextEditingController lastNameChildController = TextEditingController();
  TextEditingController birthDayChildController = TextEditingController();
  TextEditingController birthMonthChildController = TextEditingController();
  TextEditingController birthYearChildController = TextEditingController();
  TextEditingController nationalityChildController = TextEditingController();

  //baby controllers
  TextEditingController firstNameBabyController = TextEditingController();
  TextEditingController middleNameBabyController = TextEditingController();
  TextEditingController lastNameBabyController = TextEditingController();
  TextEditingController birthDayBabyController = TextEditingController();
  TextEditingController birthMonthBabyController = TextEditingController();
  TextEditingController birthYearBabyController = TextEditingController();
  TextEditingController nationalityBabyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    FlightBookingDetailsCubit cubit = FlightBookingDetailsCubit.get(context);

    return BlocConsumer<FlightBookingDetailsCubit, FlightBookingDetailsStates>(
      listener: (BuildContext context, FlightBookingDetailsStates state) {},
      builder: (BuildContext context, FlightBookingDetailsStates state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Traveler data',
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
                          'Traveler 1 (adult)',
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
                              'Middle Name',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            CustomFormField(
                              controller: middleNameController,
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
                            Container(
                              width: double.infinity,
                              height: size.height * 0.09,
                              decoration: BoxDecoration(
                                border: Border.all(color: lightGreyColor),
                                borderRadius: BorderRadius.circular(
                                  6.0,
                                ),
                              ),
                              child: CountryListPick(
                                theme: CountryTheme(
                                  alphabetSelectedBackgroundColor: defaultColor,
                                  isShowFlag: true,
                                  isShowTitle: true,
                                  isShowCode: false,
                                  isDownIcon: true,
                                  showEnglishName: true,
                                ),
                                initialSelection: 'US',
                                onChanged: (CountryCode? code) {
                                  nationalityController.text = code!.name!;
                                  print(
                                      'Nationality is a ${nationalityController.text}');
                                },
                                useUiOverlay: true,
                                useSafeArea: false,
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Text(
                              'Passport Number',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            CustomFormField(
                              controller: passportNumberController,
                              type: TextInputType.text,
                            ),
                          ],
                        ),
                        CustomDivider(),
                        Text(
                          'Traveler 2 (child)',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'First Name',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            CustomFormField(
                              controller: firstNameChildController,
                              type: TextInputType.name,
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Text(
                              'Middle Name',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            CustomFormField(
                              controller: middleNameChildController,
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
                              controller: lastNameChildController,
                              type: TextInputType.name,
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Text(
                              'Birth Day',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            CustomFormField(
                              controller: birthDayChildController,
                              type: TextInputType.number,
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Text(
                              'Birth Month',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            CustomFormField(
                              controller: birthMonthChildController,
                              type: TextInputType.number,
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Text(
                              'Birth Year',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            CustomFormField(
                              controller: birthYearChildController,
                              type: TextInputType.number,
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Text(
                              'Nationality',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            CustomFormField(
                              controller: nationalityChildController,
                              type: TextInputType.text,
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                          ],
                        ),
                        CustomDivider(),
                        Text(
                          'Traveler 3 (baby)',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'First Name',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            CustomFormField(
                              controller: firstNameBabyController,
                              type: TextInputType.name,
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Text(
                              'Middle Name',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            CustomFormField(
                              controller: middleNameBabyController,
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
                              controller: lastNameBabyController,
                              type: TextInputType.name,
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Text(
                              'Birth Day',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            CustomFormField(
                              controller: birthDayBabyController,
                              type: TextInputType.number,
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Text(
                              'Birth Month',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            CustomFormField(
                              controller: birthMonthBabyController,
                              type: TextInputType.number,
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Text(
                              'Birth Year',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            CustomFormField(
                              controller: birthYearBabyController,
                              type: TextInputType.number,
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Text(
                              'Nationality',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            CustomFormField(
                              controller: nationalityBabyController,
                              type: TextInputType.text,
                            ),
                            SizedBox(
                              height: size.height * 0.03,
                            ),
                          ],
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
