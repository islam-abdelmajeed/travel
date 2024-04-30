import 'dart:math';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_agency_app/constants/constant.dart';

class CustomDivider extends StatelessWidget {
  double? height = 1.0;
  CustomDivider({this.height});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height,
      color: Colors.black,
      endIndent: 25.0,
      indent: 30.0,
    );
  }
}

class CustomDrawerButton extends StatelessWidget {
  String text;
  Function function;
  CustomDrawerButton({super.key, required this.text, required this.function});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Row(
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios),
        ],
      ),
      onPressed: () {
        function();
      },
    );
  }
}

class CustomFormField extends StatelessWidget {
  TextEditingController controller;
  TextInputType type;
  Function? onSubmit;
  Function? onChanged;
  Function? onTap;
  String? validate;
  List<TextInputFormatter>? inputFormatter;
  String? label;

  IconData? prefix;
  IconData? suffix;
  String? hint;
  int? maxLine = 1;

  Function? suffixPressed;
  CustomFormField({
    required this.controller,
    required this.type,
    this.label,
    this.prefix,
    this.onChanged,
    this.onSubmit,
    this.onTap,
    this.inputFormatter,
    this.hint,
    this.suffix,
    this.suffixPressed,
    this.validate,
    this.maxLine,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16.0),
      maxLines: maxLine,
      inputFormatters: inputFormatter,
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      //enabled: isClickable,
      validator: (value) {
        if (value!.isEmpty) {
          return validate;
        }
      },

      // obscureText: isPassword!,
      decoration: InputDecoration(
        prefixIcon: Icon(
          prefix,
          size: 20.0,
        ),
        hintText: hint,
        hintStyle: Theme.of(context).textTheme.titleSmall,
        suffixIcon: suffix != null
            ? IconButton(
                icon: Icon(suffix),
                onPressed: () {
                  suffixPressed!();
                },
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            6.0,
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  Color? background;
  double? radius;
  bool? isUpperCase;
  Function function;
  String text;
  double? height;
  double? width;
  bool? smallStyle;

  CustomButton(
      {required this.function,
      required this.text,
      this.background,
      this.height,
      this.width,
      this.isUpperCase,
      this.radius,
      this.smallStyle});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: width,
      height: height ?? size.height * 0.05,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 5.0),
        color: background ?? defaultColor,
      ),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 5.0)),
        onPressed: () {
          function();
        },
        child: Text(
          isUpperCase ?? false ? text.toUpperCase() : text,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: whiteColor,
              ),
        ),
      ),
    );
  }
}

class CustomDropDown extends StatelessWidget {
  String? selectedDropDown;
  String? hint;
  String? validation;
  List? list;
  Function? onChanged;

  CustomDropDown({
    required this.hint,
    required this.validation,
    required this.list,
    required this.selectedDropDown,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2(
      validator: (value) {
        if (value == null) {
          return validation;
        }
        return null;
      },
      onChanged: (value) {
        onChanged!(value);
      },
      hint: Text(
        hint!,
        style: Theme.of(context).textTheme.titleSmall,
      ),
      isExpanded: true,
      icon: const Icon(
        Icons.keyboard_arrow_down,
      ),
      iconSize: 30,
      buttonHeight: 65,
      buttonPadding: const EdgeInsets.only(left: 20, right: 10),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: const BorderSide(
            color: lightGreyColor,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: const BorderSide(
            color: defaultColor,
            width: 2.0,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: const BorderSide(
            color: defaultColor,
            width: 2.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.0,
          ),
        ),
      ),
      items: list?.map<DropdownMenuItem<String>>((item) {
        return DropdownMenuItem(
          child: Text(
            item,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontSize: 16.0),
          ),
          value: item,
        );
      }).toList(),
    );
  }
}

class CustomOrderCard extends StatelessWidget {
  String orderName;
  String orderDate;
  String price;
  String? orderStatus;

  CustomOrderCard({
    required this.orderName,
    required this.orderDate,
    required this.price,
    this.orderStatus,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(width: 1.0),
          borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                orderName,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(
                width: width * 0.06,
              ),
              Text(
                orderDate,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(
                width: width * 0.06,
              ),
              Text(
                price,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomImagePicker extends StatelessWidget {
  IconData? icon;
  String? text;
  Function function;

  CustomImagePicker(
      {required this.icon, required this.text, required this.function});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        function();
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        height: height * 0.08,
        decoration: BoxDecoration(
            border: Border.all(width: 1.0),
            borderRadius: BorderRadius.circular(15.0)),
        child: Row(
          children: [
            Icon(
              icon,
            ),
            SizedBox(
              width: width * 0.01,
            ),
            Text(
              text!,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class CustomImageBox extends StatelessWidget {
  double? width;
  double? height;
  double? radius;
  String? image;
  bool? isGradient;
  BoxFit? fit;

  CustomImageBox({
    this.isGradient,
    this.fit,
    required this.height,
    required this.width,
    required this.radius,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: height,
      width: width,
      foregroundDecoration: isGradient == true
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(radius!),
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.transparent,
                  blackColor.withOpacity(0.7),
                  blackColor.withOpacity(0.7),
                  // blackColor,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.5, 0.6, 0.8, 1],
              ),
            )
          : null,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius!),
        image: DecorationImage(
          fit: fit ?? BoxFit.cover,
          image: AssetImage(
            image!,
          ),
        ),
      ),
    );
  }
}

class AdvantagesStyle extends StatelessWidget {
  String? svgIcon;
  String? title;
  String? description;

  AdvantagesStyle({
    required this.svgIcon,
    required this.title,
    required this.description,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          svgIcon!,
        ),
        Text(
          title!,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Text(
          description!,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: lightGreyColor,
                fontWeight: FontWeight.w400,
              ),
        ),
      ],
    );
  }
}

class OffersListView extends StatelessWidget {
  String? image;
  String? title;
  String? description;
  IconData? icon = Icons.arrow_forward_ios;

  OffersListView({
    this.image,
    this.title,
    this.description,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.3,
      width: double.infinity,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  CustomImageBox(
                    height: size.height * 0.3,
                    width: size.width * 0.7,
                    radius: 15.0,
                    isGradient: true,
                    image: image ?? 'assets/images/Post1.jpg',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: size.width * 0.02,
                      ),
                      Column(
                        children: [
                          Text(
                            title ??
                                'Free insurance with every flight reservation',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: whiteColor,
                                    ),
                          ),
                          Text(
                            description ??
                                'Travel with peace of mind with Fly Travel',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: lightGreyColor,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: size.width * 0.05,
                      ),
                      Icon(
                        icon != null ? icon : null,
                        color: whiteColor,
                        size: 10.0,
                      )
                    ],
                  ),
                ],
              ),
            ],
          );
        },
        shrinkWrap: true,
        itemCount: 10,
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: size.width * 0.05,
          );
        },
      ),
    );
  }
}

class CustomAccountInfoCard extends StatelessWidget {
  String? title;
  String? value;
  String? icon;
  Function? function;

  CustomAccountInfoCard({
    required this.title,
    required this.value,
    required this.function,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title!,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: blackColor,
                  ),
            ),
            Text(
              value!,
            ),
          ],
        ),
        const Spacer(),
        OutlinedButton(
            onPressed: () {
              function!();
            },
            child: Row(
              children: [
                Text(
                  'Change',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: blackColor,
                      ),
                ),
                SizedBox(
                  width: size.width * 0.02,
                ),
                SvgPicture.asset(icon ?? 'assets/images/Edit.svg')
              ],
            ))
      ],
    );
  }
}

class MyBullet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7,
      width: 7,
      decoration: const BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
    );
  }
}

//AirPlaneCard
class AirPlaneCard extends StatefulWidget {
  @override
  State<AirPlaneCard> createState() => _AirPlaneCardState();
}

class _AirPlaneCardState extends State<AirPlaneCard> {
  ScrollController _scrollController = ScrollController();
  List<int> _data = List.generate(5, (index) => index); // Initial data

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_loadMoreData);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _loadMoreData() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      // User has reached the end of the list
      // Load more data or trigger pagination in flutter
      setState(() {
        _data.addAll(List.generate(5, (index) => _data.length + index));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollEndNotification &&
            notification.metrics.extentAfter == 0) {
          // User has reached the end of the list
          // Load more data or trigger pagination in flutter
          _loadMoreData();
        }
        return false;
      },
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        controller: _scrollController,
        itemBuilder: (context, index) => Card(
          color: cardColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const Image(
                      image: AssetImage(
                        'assets/images/emirates-airline-logo.png',
                      ),
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        Text(
                          'Cairo',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: blackColor),
                        ),
                        Text(
                          '12:00 PM',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontSize: 14.0),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: size.width * 0.02,
                    ),
                    SvgPicture.asset('assets/images/Line 6.svg'),
                    SvgPicture.asset(
                      'assets/images/airplane0.svg',
                      width: size.width * 0.08,
                    ),
                    SvgPicture.asset('assets/images/Line 5.svg'),
                    SizedBox(
                      width: size.width * 0.02,
                    ),
                    Column(
                      children: [
                        Text(
                          'Dubai',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: blackColor),
                        ),
                        Text(
                          '12:00 PM',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontSize: 14.0),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset('assets/images/calender.svg'),
                        Column(
                          children: [
                            Text(
                              'Date',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            Text(
                              '12-11-2023',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        SvgPicture.asset('assets/images/timmer.svg'),
                        Column(
                          children: [
                            Text(
                              'Gate',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            Text(
                              'A12',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset('assets/images/door.svg'),
                        Column(
                          children: [
                            Text(
                              'time of departure',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            Text(
                              '12 midnight Cairo time',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        SvgPicture.asset('assets/images/airline-seat.svg'),
                        Column(
                          children: [
                            Text(
                              'Chair Number',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            Text(
                              '128',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                CustomButton(
                  function: () {},
                  text: 'Download Ticket',
                  radius: 5.0,
                ),
              ],
            ),
          ),
        ),
        separatorBuilder: (context, index) => SizedBox(
          height: size.height * 0.03,
        ),
        itemCount: _data.length,
      ),
    );
  }
}

//AirPlaneDetailsCard
class AirplaneDetailsCard extends StatefulWidget {
  @override
  State<AirplaneDetailsCard> createState() => _AirplaneDetailsCardState();
}

class _AirplaneDetailsCardState extends State<AirplaneDetailsCard> {
  ScrollController _scrollController = ScrollController();
  List<int> _data = List.generate(5, (index) => index); // Initial data

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_loadMoreData);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _loadMoreData() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      // User has reached the end of the list
      // Load more data or trigger pagination in flutter
      setState(() {
        _data.addAll(List.generate(5, (index) => _data.length + index));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollEndNotification &&
            notification.metrics.extentAfter == 0) {
          // User has reached the end of the list
          // Load more data or trigger pagination in flutter
          _loadMoreData();
        }
        return false;
      },
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        controller: _scrollController,
        itemBuilder: (context, index) => Card(
          color: cardColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Emirates A380 Airbus',
                ),
                Row(
                  children: [
                    Text(
                      'Wednesday, October 8',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const Spacer(),
                    Text(
                      '2h 28m',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5.0),
                      color: whiteColor,
                      child: Row(
                        children: [
                          const Image(
                            image: AssetImage(
                              'assets/images/emirates-airline-logo.png',
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.02,
                          ),
                          Column(
                            children: [
                              Text(
                                'The UAE',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(color: blackColor),
                              ),
                              Text(
                                'Airbus A320',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(5.0),
                      color: whiteColor,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/airline-seat.svg',
                            color: blackColor,
                            width: size.width * 0.05,
                          ),
                          SvgPicture.asset(
                            'assets/images/Breakfast.svg',
                            color: blackColor,
                            width: size.width * 0.05,
                          ),
                          SvgPicture.asset(
                            'assets/images/Wifi.svg',
                            color: blackColor,
                            width: size.width * 0.05,
                          ),
                          SvgPicture.asset(
                            'assets/images/timmer.svg',
                            color: blackColor,
                            width: size.width * 0.05,
                          ),
                          SvgPicture.asset(
                            'assets/images/airplane0.svg',
                            color: blackColor,
                            width: size.width * 0.05,
                          ),
                        ],
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
                    Column(
                      children: [
                        Text(
                          'Cairo, Egypt',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: blackColor),
                        ),
                        Text(
                          '12:00 PM',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontSize: 14.0),
                        ),
                      ],
                    ),
                    const Spacer(),
                    SvgPicture.asset('assets/images/Line 6.svg'),
                    SizedBox(
                      width: size.width * 0.01,
                    ),
                    SvgPicture.asset(
                      'assets/images/airplane0.svg',
                    ),
                    SizedBox(
                      width: size.width * 0.01,
                    ),
                    SvgPicture.asset('assets/images/Line 5.svg'),
                    const Spacer(),
                    Column(
                      children: [
                        Text(
                          'Dubai, UAE',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: blackColor),
                        ),
                        Text(
                          '12:00 PM',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontSize: 14.0),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        separatorBuilder: (context, index) => SizedBox(
          height: size.height * 0.03,
        ),
        itemCount: _data.length,
      ),
    );
  }
}

class AirplaneBookingDetails extends StatelessWidget {
  const AirplaneBookingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      color: cardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Emirates A380 Airbus',
            ),
            Row(
              children: [
                Text(
                  'Wednesday, October 8',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const Spacer(),
                Text(
                  '2h 28m',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(5.0),
                  color: whiteColor,
                  child: Row(
                    children: [
                      const Image(
                        image: AssetImage(
                          'assets/images/emirates-airline-logo.png',
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.02,
                      ),
                      Column(
                        children: [
                          Text(
                            'The UAE',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: blackColor),
                          ),
                          Text(
                            'Airbus A320',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(5.0),
                  color: whiteColor,
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/airline-seat.svg',
                        color: blackColor,
                        width: size.width * 0.05,
                      ),
                      SvgPicture.asset(
                        'assets/images/Breakfast.svg',
                        color: blackColor,
                        width: size.width * 0.05,
                      ),
                      SvgPicture.asset(
                        'assets/images/Wifi.svg',
                        color: blackColor,
                        width: size.width * 0.05,
                      ),
                      SvgPicture.asset(
                        'assets/images/timmer.svg',
                        color: blackColor,
                        width: size.width * 0.05,
                      ),
                      SvgPicture.asset(
                        'assets/images/airplane0.svg',
                        color: blackColor,
                        width: size.width * 0.05,
                      ),
                    ],
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
                Column(
                  children: [
                    Text(
                      'Cairo, Egypt',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: blackColor),
                    ),
                    Text(
                      '12:00 PM',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 14.0),
                    ),
                  ],
                ),
                const Spacer(),
                SvgPicture.asset('assets/images/Line 6.svg'),
                SizedBox(
                  width: size.width * 0.01,
                ),
                SvgPicture.asset(
                  'assets/images/airplane0.svg',
                ),
                SizedBox(
                  width: size.width * 0.01,
                ),
                SvgPicture.asset('assets/images/Line 5.svg'),
                const Spacer(),
                Column(
                  children: [
                    Text(
                      'Dubai, UAE',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: blackColor),
                    ),
                    Text(
                      '12:00 PM',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 14.0),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AirplanePriceDetails extends StatelessWidget {
  const AirplanePriceDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      color: cardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                CustomImageBox(
                  height: size.height * 0.1,
                  width: size.width * 0.2,
                  radius: 10.0,
                  image: 'assets/images/Frame 186.jpg',
                ),
                const Spacer(),
                Column(
                  children: [
                    Text(
                      'Economy',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 16.0),
                    ),
                    Text(
                      'Emirates A380 Airbus',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontSize: 20.0),
                    ),
                  ],
                ),
              ],
            ),
            CustomDivider(),
            Text(
              '3 tickets: round trip, 1 adult, 1 child, 1 infant',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontSize: 18.0),
            ),
            CustomDivider(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Price details',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 16.0),
                ),
                Row(
                  children: [
                    Text(
                      'Traveler 1: Adult',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const Spacer(),
                    Text(
                      '18433.00 Egyptian pounds',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Traveler 2: Child',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const Spacer(),
                    Text(
                      '12702.00 Egyptian pounds',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Traveler 3: An infant',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const Spacer(),
                    Text(
                      '2680.00 Egyptian pounds',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'rival',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const Spacer(),
                    Text(
                      '0 Egyptian pounds',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Other fees',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const Spacer(),
                    Text(
                      '300 Egyptian pounds',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                CustomDivider(),
                Row(
                  children: [
                    Text(
                      'Total',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 12.0),
                    ),
                    const Spacer(),
                    Text(
                      '34155.00 Egyptian pounds',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 12.0),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HotelPriceDetails extends StatelessWidget {
  const HotelPriceDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      color: cardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                CustomImageBox(
                  height: size.height * 0.1,
                  width: size.width * 0.2,
                  radius: 10.0,
                  image: 'assets/images/hotel3.jpg',
                ),
                const Spacer(),
                Column(
                  children: [
                    Text(
                      'Hyatt Place Dubai Baniyas Square',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 16.0),
                    ),
                    Text(
                      'Special room-double room-2 beds',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontSize: 16.0),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/Star.svg',
                        ),
                        SvgPicture.asset(
                          'assets/images/Star.svg',
                        ),
                        SvgPicture.asset(
                          'assets/images/Star.svg',
                        ),
                        SvgPicture.asset(
                          'assets/images/Star.svg',
                        ),
                        SvgPicture.asset(
                          'assets/images/Star.svg',
                        ),
                        Text(
                          'Hotel five star',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            CustomDivider(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Price details',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 16.0),
                ),
                Row(
                  children: [
                    Text(
                      'Price per night',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const Spacer(),
                    Text(
                      '350\$',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'discount',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const Spacer(),
                    Text(
                      '0',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Number of nights',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const Spacer(),
                    Text(
                      '3',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '1 room 2 adults, 1 child',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const Spacer(),
                    Text(
                      '3',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                CustomDivider(),
                Row(
                  children: [
                    Text(
                      'Total',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 12.0),
                    ),
                    const Spacer(),
                    Text(
                      '750\$',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 12.0),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HotelBookingDetails extends StatelessWidget {
  const HotelBookingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      color: cardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Special room - double room - 2 beds',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      '250\$',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: const Color(0xffFF8682),
                          ),
                    ),
                    Text(
                      '/night',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: const Color(0xffFF8682),
                          ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Container(
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: defaultColor,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                children: [
                  CustomImageBox(
                      height: size.height * 0.1,
                      width: size.width * 0.2,
                      radius: 10.0,
                      image: 'assets/images/hotel2.jpg'),
                  Spacer(),
                  Column(
                    children: [
                      Text(
                        'Hyatt Place Dubai Baniyas Square',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: blackColor),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 12,
                          ),
                          Text(
                            'Hotel five star',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      'Fri, Oct 9th',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: blackColor),
                    ),
                    Text(
                      'Enter',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 14.0),
                    ),
                  ],
                ),
                const Spacer(),
                SvgPicture.asset('assets/images/Line 6.svg'),
                SizedBox(
                  width: size.width * 0.01,
                ),
                SvgPicture.asset(
                  'assets/images/building.svg',
                ),
                SizedBox(
                  width: size.width * 0.01,
                ),
                SvgPicture.asset('assets/images/Line 5.svg'),
                const Spacer(),
                Column(
                  children: [
                    Text(
                      'Mon, Oct 12',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: blackColor),
                    ),
                    Text(
                      'Exit',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 14.0),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//HotelsCard
class HotelsCard extends StatefulWidget {
  const HotelsCard({super.key});

  @override
  State<HotelsCard> createState() => _HotelsCardState();
}

class _HotelsCardState extends State<HotelsCard> {
  ScrollController _scrollController = ScrollController();
  List<int> _data = List.generate(5, (index) => index); // Initial data

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_loadMoreData);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _loadMoreData() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      // User has reached the end of the list
      // Load more data or trigger pagination in flutter
      setState(() {
        _data.addAll(List.generate(5, (index) => _data.length + index));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      controller: _scrollController,
      itemBuilder: (context, index) => Card(
        color: cardColor,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Image(
                    image: AssetImage(
                      'assets/images/download 2.jpg',
                    ),
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      Text(
                        'Enter',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: blackColor),
                      ),
                      Text(
                        'Friday, 9October',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      Text(
                        'Exit',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: blackColor),
                      ),
                      Text(
                        'Mon, 12October',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/timmer.svg',
                        color: defaultColor,
                      ),
                      Column(
                        children: [
                          Text(
                            'Enter At',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Text(
                            '12:00 pm',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/timmer.svg',
                        color: defaultColor,
                      ),
                      Column(
                        children: [
                          Text(
                            'Exit At',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Text(
                            '11:30 pm',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/hotel_door.svg',
                      ),
                      Column(
                        children: [
                          Text(
                            'Room number',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Text(
                            'A250',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              CustomButton(
                function: () {},
                text: 'Download reservation',
                radius: 5.0,
              ),
            ],
          ),
        ),
      ),
      separatorBuilder: (context, index) => SizedBox(
        height: size.height * 0.03,
      ),
      itemCount: _data.length,
    );
  }
}

//TripsList
class TripsList extends StatefulWidget {
  const TripsList({super.key});

  @override
  State<TripsList> createState() => _TripsListState();
}

class _TripsListState extends State<TripsList> {
  ScrollController _scrollController = ScrollController();
  List<int> _data = List.generate(5, (index) => index); // Initial data

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_loadMoreData);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _loadMoreData() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      // User has reached the end of the list
      // Load more data or trigger pagination in flutter
      setState(() {
        _data.addAll(List.generate(5, (index) => _data.length + index));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      controller: _scrollController,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Row(
          children: [
            CustomImageBox(
              height: size.height * 0.2,
              width: size.width * 0.55,
              radius: 10.0,
              image: 'assets/images/Istanbul 1.jpg',
            ),
            SizedBox(
              width: size.width * 0.01,
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Cairo',
                ),
                Icon(
                  Icons.swap_horiz,
                ),
                Text(
                  'Istanbul',
                ),
              ],
            ),
          ],
        );
      },
      itemCount: _data.length,
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          width: size.width * 0.05,
        );
      },
    );
  }
}

//ExpandableText
class ExpandableText extends StatefulWidget {
  ExpandableText(
    this.text, {
    this.trimLines = 2,
    this.style,
  });

  final String? text;
  TextStyle? style;
  final int trimLines;

  @override
  ExpandableTextState createState() => ExpandableTextState();
}

class ExpandableTextState extends State<ExpandableText> {
  bool _readMore = true;
  void _onTapLink() {
    setState(() => _readMore = !_readMore);
  }

  @override
  Widget build(BuildContext context) {
    TextSpan link = TextSpan(
        text: _readMore ? "... read more" : " read less",
        style: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(color: defaultColor),
        recognizer: TapGestureRecognizer()..onTap = _onTapLink);
    Widget result = LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        assert(constraints.hasBoundedWidth);
        final double maxWidth = constraints.maxWidth;
        // Create a TextSpan with data
        final text = TextSpan(
          text: widget.text,
        );
        // Layout and measure link
        TextPainter textPainter = TextPainter(
          text: link,
          textDirection: TextDirection
              .rtl, //better to pass this from master widget if ltr and rtl both supported
          maxLines: widget.trimLines,
          ellipsis: '...',
        );
        textPainter.layout(minWidth: constraints.minWidth, maxWidth: maxWidth);
        final linkSize = textPainter.size;
        // Layout and measure text
        textPainter.text = text;
        textPainter.layout(minWidth: constraints.minWidth, maxWidth: maxWidth);
        final textSize = textPainter.size;
        // Get the endIndex of data
        int? endIndex;
        final pos = textPainter.getPositionForOffset(Offset(
          textSize.width - linkSize.width,
          textSize.height,
        ));
        endIndex = textPainter.getOffsetBefore(pos.offset);
        var textSpan;
        if (textPainter.didExceedMaxLines) {
          textSpan = TextSpan(
            text: _readMore ? widget.text?.substring(0, endIndex) : widget.text,
            style: widget.style ?? Theme.of(context).textTheme.bodySmall,
            children: <TextSpan>[link],
          );
        } else {
          textSpan = TextSpan(
            text: widget.text,
          );
        }
        return RichText(
          softWrap: true,
          overflow: TextOverflow.clip,
          text: textSpan,
        );
      },
    );
    return result;
  }
}

class CustomDrawerItem extends StatelessWidget {
  String? text;
  Widget? widget;
  IconData? icon;

  CustomDrawerItem({required this.text, required this.widget, this.icon});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => widget!,
          ),
        );
      },
      child: Row(
        children: [
          Text(
            text!,
            textScaleFactor: ScaleSize.textScaleFactor(context),
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: whiteColor),
          ),
          const Spacer(),
          Icon(
            icon ?? Icons.arrow_forward_ios,
            color: whiteColor,
          ),
        ],
      ),
    );
  }
}

class ScaleSize {
  static double textScaleFactor(BuildContext context,
      {double maxTextScaleFactor = 2}) {
    final width = MediaQuery.of(context).size.width;
    double val = (width / 1400) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }
}
