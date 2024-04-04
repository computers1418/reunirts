import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart' as nav;
import 'package:reunirts/pages/appointments_view.dart';
import 'package:reunirts/pages/booking_view.dart';
import 'package:reunirts/pages/doctor_view.dart';
import 'package:reunirts/pages/home_view.dart';
import 'package:reunirts/pages/payment_view.dart';

class Routes {
  //common routes
  static const String splash = '/';
  static const String booking = '/booking';
  static const String profile = '/profile';
  static const String appointments = '/appointments';
  static const String payment = '/payment';
}

class RouteGenerator {
  static List<GetPage> pages = [
    GetPage(
      name: '/',
      page: () => const HomeView(),
      transition: nav.Transition.noTransition,
    ),
    GetPage(
      name: '/booking',
      page: () => const BookingView(),
      transition: nav.Transition.noTransition,
    ),
    GetPage(
      name: '/profile',
      page: () => const DoctorView(),
      transition: nav.Transition.noTransition,
    ),
     GetPage(
      name: '/payment',
      page: () => const PaymentsView(),
      transition: nav.Transition.noTransition,
    ),
     GetPage(
      name: '/appointments',
      page: () => const AppointmentsView(),
      transition: nav.Transition.noTransition,
    ),
  ];
}