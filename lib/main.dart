import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:travel_agency_app/constants/app_locale.dart';
import 'package:travel_agency_app/constants/theme.dart';
import 'package:travel_agency_app/modules/flight_booking_details/cubit/cubit.dart';
import 'package:travel_agency_app/modules/flight_details/cubit/cubit.dart';
import 'package:travel_agency_app/modules/hotel_booking_details/cubit/cubit.dart';
import 'package:travel_agency_app/modules/hotel_details/cubit/cubit.dart';
import 'package:travel_agency_app/layout/cubit/cubit.dart';
import 'package:travel_agency_app/layout/cubit/states.dart';
import 'package:travel_agency_app/modules/account/cubit/cubit.dart';
import 'package:travel_agency_app/modules/airplane/cubit/cubit.dart';
import 'package:travel_agency_app/modules/favorites/cubit/cubit.dart';
import 'package:travel_agency_app/modules/forget%20password/cubit/cubit.dart';
import 'package:travel_agency_app/modules/home/cubit/cubit.dart';
import 'package:travel_agency_app/modules/hotels/cubit/cubit.dart';
import 'package:travel_agency_app/modules/login/cubit/cubit.dart';
import 'package:travel_agency_app/modules/login/login_screen.dart';
import 'package:travel_agency_app/modules/offers/cubit/cubit.dart';
import 'package:travel_agency_app/modules/refund_reservation/cubit/cubit.dart';
import 'package:travel_agency_app/modules/search/cubit/cubit.dart';
import 'package:travel_agency_app/modules/sign%20up/cubit/cubit.dart';
import 'package:travel_agency_app/modules/splash/splash_screen.dart';
import 'package:travel_agency_app/shared/components/bloc_observer.dart';
import 'package:travel_agency_app/shared/components/cache_helper.dart';
import 'package:travel_agency_app/shared/network/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}


class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en', '');

  void setLocale(Locale value) {
    setState(() {
      _locale = value;
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => LayoutCubit()),
        BlocProvider(create: (BuildContext context) => LoginCubit()),
        BlocProvider(create: (BuildContext context) => SignUpCubit()),
        BlocProvider(create: (BuildContext context) => ForgetPasswordCubit()),
        BlocProvider(create: (BuildContext context) => HomeCubit()),
        BlocProvider(create: (BuildContext context) => SearchCubit()),
        BlocProvider(create: (BuildContext context) => AirplaneCubit()),
        BlocProvider(create: (BuildContext context) => HotelsCubit()),
        BlocProvider(create: (BuildContext context) => AccountCubit()),
        BlocProvider(create: (BuildContext context) => OffersCubit()),
        BlocProvider(create: (BuildContext context) => HotelDetailsCubit()),
        BlocProvider(create: (BuildContext context) => FlightDetailsCubit()),
        BlocProvider(create: (BuildContext context) => FavoritesCubit()),
        BlocProvider(
            create: (BuildContext context) => FlightBookingDetailsCubit()),
        BlocProvider(
            create: (BuildContext context) => HotelBookingDetailsCubit()),
        BlocProvider(
            create: (BuildContext context) => RefundReservationCubit()),
      ],
      child: BlocConsumer<LayoutCubit, LayoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeData,
            supportedLocales: const [
              Locale('ar', 'EG'),
              Locale('en', 'US'),
            ],
            localizationsDelegates: const [
              AppLocale.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            locale: _locale,
            localeResolutionCallback: (currentLang, supportLang) {
              if (currentLang != null) {
                for (Locale locale in supportLang) {
                  if (locale.languageCode == currentLang.languageCode) {
                    return currentLang;
                  }
                }
              }
              return supportLang.first;
            },
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
