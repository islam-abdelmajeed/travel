import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:travel_agency_app/constants/constant.dart';
import 'package:travel_agency_app/modules/search/cubit/cubit.dart';
import 'package:travel_agency_app/modules/search/cubit/states.dart';
import 'package:travel_agency_app/shared/components/component.dart';

class HotelsSearchScreen extends StatefulWidget {
  @override
  State<HotelsSearchScreen> createState() => _HotelsSearchScreenState();
}

class _HotelsSearchScreenState extends State<HotelsSearchScreen> {
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
              'Hotels Search',
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
                              const Text('Enter'),
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
                              const Text('Leave'),
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
                    const Text('Nights'),
                    CustomFormField(
                      controller: travelerController,
                      type: TextInputType.number,
                      prefix: Icons.nights_stay,
                      validate: 'Please enter nights number',
                      hint: 'Nights Number',
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    const Text('Rooms and Guests'),
                    CustomDropDown(
                      hint: 'traveler',
                      validation: 'Please select Rooms and Guests',
                      list: list,
                      selectedDropDown: travelerController.text,
                      onChanged: (String? value) {
                        travelerController.text = value!;
                        print(travelerController.text);
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    CustomButton(
                      function: () {
                        if (_formKey.currentState!.validate()) {}
                      },
                      width: double.infinity,
                      text: 'Search',
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
