import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_agency_app/constants/constant.dart';
import 'package:travel_agency_app/modules/offers/cubit/cubit.dart';
import 'package:travel_agency_app/modules/offers/cubit/states.dart';
import 'package:travel_agency_app/shared/components/component.dart';

class OffersScreen extends StatelessWidget {
  OffersCubit cubit = OffersCubit();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<OffersCubit, OffersStates>(
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
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    CustomImageBox(
                      height: size.height * 0.3,
                      width: double.infinity,
                      radius: 5.0,
                      image: 'assets/images/TravelBanner1.jpg',
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Book with Fly Travel and get free insurance with your flight reservation',
                        ),
                        Text(
                          'The offer is valid until October 30, 2023',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    const Text(
                      'Offer details',
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Card(
                        color: offerColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'If you book through FlyTravel\nyou will You get free insurance \n\nThe offer is valid on flight reservations',
                              style: Theme.of(context).textTheme.bodySmall!,
                            ),
                            CustomDivider(
                              height: size.height * 0.002,
                            ),
                            Text(
                              'Booking period \nUntil October 30, 2023',
                              style: Theme.of(context).textTheme.bodySmall!,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Terms and Conditions:',
                          ),
                          Row(
                            children: [
                              MyBullet(),
                              Text(
                                ' Offers are valid until October 31, 2023',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(overflow: TextOverflow.fade),
                                softWrap: false,
                                maxLines: 2,
                                overflow: TextOverflow.visible,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              MyBullet(),
                              Text(
                                ' Offers are valid until October 31, 2023',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(overflow: TextOverflow.fade),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              MyBullet(),
                              Text(
                                ' Offers are valid until October 31, 2023',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(overflow: TextOverflow.fade),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              MyBullet(),
                              Text(
                                ' Offers are valid until October 31, 2023',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(overflow: TextOverflow.fade),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              MyBullet(),
                              Text(
                                ' Offers are valid until October 31, 2023',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(overflow: TextOverflow.fade),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              MyBullet(),
                              Text(
                                ' Offers are valid until October 31, 2023',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(overflow: TextOverflow.fade),
                              ),
                            ],
                          ),
                          const Text(
                            'Terms and conditions apply',
                          ),
                        ],
                      ),
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
      },
    );
  }
}
