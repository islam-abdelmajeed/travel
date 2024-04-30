import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:travel_agency_app/constants/constant.dart';
import 'package:travel_agency_app/modules/search/cubit/cubit.dart';
import 'package:travel_agency_app/modules/search/cubit/states.dart';
import 'package:travel_agency_app/shared/components/component.dart';

class AirlineSearchScreen extends StatefulWidget {
  @override
  State<AirlineSearchScreen> createState() => _AirlineSearchScreenState();
}

class _AirlineSearchScreenState extends State<AirlineSearchScreen> {
  TextEditingController fromController = TextEditingController();

  TextEditingController toController = TextEditingController();

  TextEditingController leaveDateController = TextEditingController();

  TextEditingController returnDateController = TextEditingController();

  TextEditingController travelerController = TextEditingController();
  List<String> list = ['Ahmed', 'Mohamed', 'Ibrahim'];
  SearchCubit cubit = SearchCubit();
  int selectedTravelType = 1;
  int selectedTravelTime = 1;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<SearchCubit, SearchStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Airline Search',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: whiteColor,
                  ),
            ),
            backgroundColor: defaultColor,
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Radio(
                                activeColor: defaultColor,
                                value: 1,
                                toggleable: true,
                                groupValue: selectedTravelType,
                                onChanged: (value) {
                                  setState(() {
                                    selectedTravelType = value!;
                                  });
                                },
                              ),
                              Text(
                                'Travel & Return',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        color: selectedTravelType == 1
                                            ? defaultColor
                                            : blackColor),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Radio(
                                activeColor: defaultColor,
                                value: 2,
                                toggleable: true,
                                groupValue: selectedTravelType,
                                onChanged: (value) {
                                  setState(() {
                                    selectedTravelType = value!;
                                  });
                                },
                              ),
                              Text(
                                'Just Travel',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        color: selectedTravelType == 2
                                            ? defaultColor
                                            : blackColor),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    const Text('From'),
                    CustomFormField(
                      prefix: Icons.location_on,
                      controller: fromController,
                      type: TextInputType.text,
                      hint: 'City or Airport',
                      validate: 'Please enter place',
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    const Text('To'),
                    CustomFormField(
                      prefix: Icons.location_on,
                      controller: toController,
                      type: TextInputType.text,
                      hint: 'City or Airport',
                      validate: 'Please enter place',
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Leave'),
                              CustomFormField(
                                controller: leaveDateController,
                                type: TextInputType.none,
                                hint: 'Leaving Date',
                                validate: 'Please enter date',
                                prefix: Icons.calendar_month,
                                onTap: () {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(3030),
                                  ).then((value) {
                                    leaveDateController.text =
                                        DateFormat.yMMMd().format(value!);
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.03,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Return'),
                              CustomFormField(
                                controller: returnDateController,
                                hint: 'Return Date',
                                type: TextInputType.none,
                                validate: 'Please choose date',
                                prefix: Icons.calendar_month,
                                onTap: () {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(3030),
                                  ).then((value) {
                                    returnDateController.text =
                                        DateFormat.yMMMd().format(value!);
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Travelers & class'),
                        CustomDropDown(
                          hint: 'traveler',
                          validation: 'Please select class',
                          list: list,
                          selectedDropDown: travelerController.text,
                          onChanged: (String? value) {
                            travelerController.text = value!;
                            print(travelerController.text);
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Radio(
                                activeColor: defaultColor,
                                value: 1,
                                toggleable: true,
                                groupValue: selectedTravelTime,
                                onChanged: (value) {
                                  setState(() {
                                    selectedTravelTime = value!;
                                  });
                                },
                              ),
                              Text(
                                'Non-stop flights',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        color: selectedTravelTime == 1
                                            ? defaultColor
                                            : blackColor),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Radio(
                                activeColor: defaultColor,
                                value: 2,
                                toggleable: true,
                                groupValue: selectedTravelTime,
                                onChanged: (value) {
                                  setState(() {
                                    selectedTravelTime = value!;
                                  });
                                },
                              ),
                              Text(
                                'Flexible dates',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        color: selectedTravelTime == 2
                                            ? defaultColor
                                            : blackColor),
                              )
                            ],
                          ),
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
                      text: 'Search',
                      width: double.infinity,
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
