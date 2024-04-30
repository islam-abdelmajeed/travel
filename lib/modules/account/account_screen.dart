import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_agency_app/constants/constant.dart';
import 'package:travel_agency_app/modules/account/cubit/cubit.dart';
import 'package:travel_agency_app/modules/account/cubit/states.dart';
import 'package:travel_agency_app/shared/components/component.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AccountCubit cubit = AccountCubit.get(context);
    cubit.isAccount = true;
    cubit.isAirplane = true;

    return BlocConsumer<AccountCubit, AccountStates>(
      listener: (BuildContext context, AccountStates state) {},
      builder: (BuildContext context, AccountStates state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: defaultColor,
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  height: size.height * 0.35,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Align(
                        alignment: AlignmentDirectional.topCenter,
                        child: Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            Container(
                              height: size.height * 0.3,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/accountcover.jpg'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          const CircleAvatar(
                            radius: 70.0,
                            backgroundColor: defaultColor,
                            child: CircleAvatar(
                              radius: 66.0,
                              backgroundImage:
                                  AssetImage('assets/images/hotel3.jpg'),
                            ),
                          ),
                          CircleAvatar(
                            radius: 20.0,
                            backgroundColor: defaultColor,
                            child: IconButton(
                              icon: const Icon(
                                Icons.edit,
                                color: whiteColor,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Text(
                  'Ahmed Taha',
                ),
                Text(
                  'ahmed.taha@gmail.com',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        elevation: 3.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        color: cardColor,
                        child: Row(
                          children: [
                            Expanded(
                              child: TextButton(
                                onPressed: () {
                                  cubit.changeAccountInfo(true);
                                },
                                child: Text(
                                  'Account',
                                  style: TextStyle(
                                    color: cubit.isAccount
                                        ? defaultColor
                                        : blackColor,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: TextButton(
                                onPressed: () {
                                  cubit.changeAccountInfo(false);
                                },
                                child: Text(
                                  'Tickets & reservations',
                                  style: TextStyle(
                                    color: !cubit.isAccount
                                        ? defaultColor
                                        : blackColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        cubit.isAccount ? 'Account' : 'Tickets & reservations',
                      ),
                      cubit.isAccount
                          ? Column(
                              children: [
                                Card(
                                  color: cardColor,
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        CustomAccountInfoCard(
                                          title: 'Name',
                                          value: 'Ahmed Taha',
                                          function: () {},
                                        ),
                                        SizedBox(
                                          height: size.height * 0.01,
                                        ),
                                        CustomAccountInfoCard(
                                          title: 'Email',
                                          value: 'ahmed.taha@gmail.com',
                                          function: () {},
                                        ),
                                        SizedBox(
                                          height: size.height * 0.01,
                                        ),
                                        CustomAccountInfoCard(
                                          title: 'Password',
                                          value: '**********',
                                          function: () {},
                                        ),
                                        SizedBox(
                                          height: size.height * 0.01,
                                        ),
                                        CustomAccountInfoCard(
                                          title: 'Phone',
                                          value: '+02 011 222 333',
                                          function: () {},
                                        ),
                                        SizedBox(
                                          height: size.height * 0.01,
                                        ),
                                        CustomAccountInfoCard(
                                          title: 'Birthday',
                                          value: '01 - 02 - 2000 ',
                                          function: () {},
                                        ),
                                        SizedBox(
                                          height: size.height * 0.01,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.03,
                                ),
                                CustomButton(
                                  function: () {},
                                  text: 'Logout',
                                  width: size.width * 0.35,
                                  background: Colors.red,
                                  radius: 5.0,
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                Card(
                                  elevation: 3.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  color: cardColor,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: TextButton(
                                          onPressed: () {
                                            cubit.changeAirPlaneInfo(true);
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Airplane',
                                                style: TextStyle(
                                                  color: cubit.isAirplane
                                                      ? defaultColor
                                                      : blackColor,
                                                ),
                                              ),
                                              SizedBox(
                                                width: size.width * 0.03,
                                              ),
                                              SvgPicture.asset(
                                                'assets/images/airplane.svg',
                                                color: cubit.isAirplane
                                                    ? defaultColor
                                                    : blackColor,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: TextButton(
                                          onPressed: () {
                                            cubit.changeAirPlaneInfo(false);
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Hotels',
                                                style: TextStyle(
                                                  color: !cubit.isAirplane
                                                      ? defaultColor
                                                      : blackColor,
                                                ),
                                              ),
                                              SizedBox(
                                                width: size.width * 0.03,
                                              ),
                                              SvgPicture.asset(
                                                'assets/images/hotel.svg',
                                                color: !cubit.isAirplane
                                                    ? defaultColor
                                                    : blackColor,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.03,
                                ),
                                cubit.isAirplane
                                    ? Container(
                                        height: size.height * 0.4,
                                        child:  AirPlaneCard())
                                    : Container(
                                        height: size.height * 0.4,
                                        child:  HotelsCard())
                              ],
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
