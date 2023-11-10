import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:grandatma_mobile/common/utils.dart';
import 'package:grandatma_mobile/presentation/bloc/auth/changepass/change_password_bloc.dart';
import 'package:grandatma_mobile/presentation/bloc/auth/signin/signin_bloc.dart';
import 'package:grandatma_mobile/presentation/bloc/auth/signup/signup_bloc.dart';
import 'package:grandatma_mobile/presentation/bloc/customer/jaminan/get_jaminan/get_jaminan_bloc.dart';
import 'package:grandatma_mobile/presentation/bloc/customer/jaminan/pay_jaminan/pay_jaminan_bloc.dart';
import 'package:grandatma_mobile/presentation/bloc/customer/paid_facilities/get_paid_facilities/get_paid_facilities_bloc.dart';
import 'package:grandatma_mobile/presentation/bloc/customer/paid_facilities/reserve_paid_facilities/reserve_paid_facilities_bloc.dart';
import 'package:grandatma_mobile/presentation/bloc/customer/profile/edit_profile/edit_profile_bloc.dart';
import 'package:grandatma_mobile/presentation/bloc/customer/profile/profile_bloc.dart';
import 'package:grandatma_mobile/presentation/bloc/customer/reservation/add_reservation/add_reservation_bloc.dart';
import 'package:grandatma_mobile/presentation/bloc/customer/room/get_available_room/get_available_room_bloc.dart';
import 'package:grandatma_mobile/presentation/bloc/customer/room/get_room_detail/get_room_detail_bloc.dart';
import 'package:grandatma_mobile/presentation/bloc/customer/transaction/detail/transaction_detail_bloc.dart';
import 'package:grandatma_mobile/presentation/bloc/customer/transaction/do_cancel_transaction/do_cancel_transaction_bloc.dart';
import 'package:grandatma_mobile/presentation/bloc/customer/transaction/get_transaction_can_cancel/get_transaction_can_cancel_bloc.dart';
import 'package:grandatma_mobile/presentation/bloc/customer/transaction/history/transaction_history_bloc.dart';
import 'package:grandatma_mobile/presentation/bloc/customer/transaction/search_transaction_can_cancel/search_transaction_can_cancel_bloc.dart';
import 'package:grandatma_mobile/presentation/pages/auth/hotel_information_page.dart';
import 'package:grandatma_mobile/presentation/pages/auth/signin_page.dart';
import 'package:grandatma_mobile/presentation/pages/auth/signup_page.dart';
import 'package:grandatma_mobile/presentation/pages/customer/customer_main_page.dart';
import 'package:grandatma_mobile/presentation/pages/customer/home/customer_home_page.dart';
import 'package:grandatma_mobile/presentation/pages/customer/profile/customer_edit_password_page.dart';
import 'package:grandatma_mobile/presentation/pages/customer/profile/customer_edit_profile_page.dart';
import 'package:grandatma_mobile/presentation/pages/customer/profile/customer_profile_page.dart';
import 'package:grandatma_mobile/presentation/pages/customer/reservation/add_paid_facilities_page.dart';
import 'package:grandatma_mobile/presentation/pages/customer/reservation/add_reservation_page.dart';
import 'package:grandatma_mobile/presentation/pages/customer/reservation/checkout_confirmation_page.dart';
import 'package:grandatma_mobile/presentation/pages/customer/reservation/order_receipt_page.dart';
import 'package:grandatma_mobile/presentation/pages/customer/reservation/paid_facilities_confirmation_page.dart';
import 'package:grandatma_mobile/presentation/pages/customer/reservation/reservation_confirmation_page.dart';
import 'package:grandatma_mobile/presentation/pages/customer/room/check_avail_room_page.dart';
import 'package:grandatma_mobile/presentation/pages/customer/room/room_detail_page.dart';
import 'package:grandatma_mobile/presentation/pages/customer/room/room_list_page.dart';
import 'package:grandatma_mobile/presentation/pages/customer/transaction/transaction_cancel_page.dart';
import 'package:grandatma_mobile/presentation/pages/customer/transaction/transaction_detail_page.dart';
import 'package:grandatma_mobile/presentation/pages/customer/transaction/transaction_history_page.dart';
import 'package:grandatma_mobile/presentation/pages/customer/transaction/transaction_unpaid_page.dart';
import 'package:grandatma_mobile/presentation/pages/gm/gm_main_page.dart';
import 'package:grandatma_mobile/presentation/pages/gm/home/gm_home_page.dart';
import 'package:grandatma_mobile/presentation/pages/gm/profile/gm_edit_password_page.dart';
import 'package:grandatma_mobile/presentation/pages/gm/profile/gm_profile_page.dart';
import 'package:grandatma_mobile/presentation/pages/owner/home/owner_home_page.dart';
import 'package:grandatma_mobile/presentation/pages/owner/owner_main_page.dart';
import 'package:grandatma_mobile/presentation/pages/owner/profile/owner_edit_password_page.dart';
import 'package:grandatma_mobile/presentation/pages/owner/profile/owner_profile_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'injection.dart' as di;

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  di.initializeDependencies();
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  Future<String?> getRoleFromSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('role');
  }

  Future<Widget> getInitialPage() async {
    String? role = await getRoleFromSharedPrefs();
    switch (role) {
      case 'customer':
        return CustomerMainPage();
      case 'gm':
        return GmMainPage();
      case 'owner':
        return OwnerMainPage();
      default:
        return SigninPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          //auth
          BlocProvider<SigninBloc>(
            create: (context) => di.locator<SigninBloc>(),
          ),
          BlocProvider<SignupBloc>(
            create: (context) => di.locator<SignupBloc>(),
          ),
          BlocProvider<ChangePasswordBloc>(
            create: (context) => di.locator<ChangePasswordBloc>(),
          ),

          //jaminan
          BlocProvider<GetJaminanBloc>(
            create: (context) => di.locator<GetJaminanBloc>(),
          ),
          BlocProvider<PayJaminanBloc>(
            create: (context) => di.locator<PayJaminanBloc>(),
          ),

          //paid facilities
          BlocProvider<GetPaidFacilitiesBloc>(
            create: (context) => di.locator<GetPaidFacilitiesBloc>(),
          ),
          BlocProvider<ReservePaidFacilitiesBloc>(
            create: (context) => di.locator<ReservePaidFacilitiesBloc>(),
          ),

          //reservation
          BlocProvider<AddReservationBloc>(
            create: (context) => di.locator<AddReservationBloc>(),
          ),

          //room
          BlocProvider<GetAvailableRoomBloc>(
            create: (context) => di.locator<GetAvailableRoomBloc>(),
          ),
          BlocProvider<GetRoomDetailBloc>(
            create: (context) => di.locator<GetRoomDetailBloc>(),
          ),

          //user
          BlocProvider<EditProfileBloc>(
            create: (context) => di.locator<EditProfileBloc>(),
          ),
          BlocProvider<ProfileBloc>(
            create: (context) => di.locator<ProfileBloc>(),
          ),

          //transaction
          BlocProvider<TransactionDetailBloc>(
            create: (context) => di.locator<TransactionDetailBloc>(),
          ),
          BlocProvider<DoCancelTransactionBloc>(
            create: (context) => di.locator<DoCancelTransactionBloc>(),
          ),
          BlocProvider<GetTransactionCanCancelBloc>(
            create: (context) => di.locator<GetTransactionCanCancelBloc>(),
          ),
          BlocProvider<TransactionHistoryBloc>(
            create: (context) => di.locator<TransactionHistoryBloc>(),
          ),
          BlocProvider<SearchTransactionCanCancelBloc>(
            create: (context) => di.locator<SearchTransactionCanCancelBloc>(),
          ),

        ],
        child: FutureBuilder<Widget>(
          future: getInitialPage(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return MaterialApp(
                home:
                    Scaffold(body: Center(child: CircularProgressIndicator())),
              );
            } else if (snapshot.hasError) {
              return MaterialApp(
                home: Scaffold(
                    body: Center(child: Text('Error: ${snapshot.error}'))),
              );
            } else {
              return MaterialApp(
                supportedLocales: [
                  const Locale('id', 'ID'),
                ],
                localizationsDelegates: [
                  FormBuilderLocalizations.delegate,
                ],
                title: 'Grandatma',
                home: snapshot.data,
                navigatorObservers: [routeObserver],
                navigatorKey: navigatorKey,
                onGenerateRoute: (RouteSettings settings) {
                  switch (settings.name) {
                    //auth
                    case '/':
                      return MaterialPageRoute(
                          builder: (context) => SigninPage());
                    case '/signup':
                      return MaterialPageRoute(
                          builder: (context) => SignupPage());
                    case '/hotel_information_page':
                      return MaterialPageRoute(
                          builder: (context) => HotelInformationPage());

                    //customer
                    case '/customer_main_page':
                      return MaterialPageRoute(
                          builder: (context) => CustomerMainPage());
                    case '/customer_home_page':
                      return MaterialPageRoute(
                          builder: (context) => CustomerHomePage());

                      //room
                    case '/check_avail_room_page':
                      return MaterialPageRoute(
                          builder: (context) => CheckAvailRoomPage());
                    case '/room_list_page':
                      return MaterialPageRoute(
                          builder: (context) => RoomListPage(),
                          settings: settings);
                    case '/room_detail_page':
                      return MaterialPageRoute(
                          builder: (context) => RoomDetailPage(),
                          settings: settings);

                      //reservation
                    case '/add_reservation_page':
                      return MaterialPageRoute(
                          builder: (context) => AddReservationPage(),
                          settings: settings);
                    case '/reservation_confirmation_page':
                      return MaterialPageRoute(
                          builder: (context) => ReservationConfirmationPage(),
                          settings: settings);
                    case '/add_paid_facilities_page':
                      return MaterialPageRoute(
                          builder: (context) => AddPaidFacilitiesPage(),
                          settings: settings);
                    case '/paid_facilities_confirmation_page':
                      return MaterialPageRoute(
                          builder: (context) => PaidFacilitiesConfirmationPage(),
                          settings: settings);
                    case '/checkout_confirmation_page':
                      return MaterialPageRoute(
                          builder: (context) => CheckoutConfirmationPage(),
                          settings: settings);

                    case "/order_receipt_page":
                      return MaterialPageRoute(
                          builder: (context) => OrderReceiptPage(),
                          settings: settings);

                      //profile
                    case '/customer_profile_page':
                      return MaterialPageRoute(
                          builder: (context) => CustomerProfilePage());
                    case '/customer_edit_password_page':
                      return MaterialPageRoute(
                          builder: (context) => CustomerEditPasswordPage());
                    case '/customer_edit_profile_page':
                      {
                        return MaterialPageRoute(
                            builder: (context) => CustomerEditProfilePage(),
                            settings: settings);
                      }

                      //transaction
                    case '/customer_transaction_history_page':
                      return MaterialPageRoute(
                          builder: (context) =>
                              CustomerTransactionHistoryPage());
                    case '/customer_transaction_detail_page':
                      return MaterialPageRoute(
                          builder: (context) =>
                              CustomerTransactionDetailPage(), settings: settings);
                    case '/customer_transaction_unpaid_page':
                      return MaterialPageRoute(
                          builder: (context) =>
                              TransactionUnpaidPage(), settings: settings);
                    case '/customer_transaction_cancel_page':
                      return MaterialPageRoute(
                          builder: (context) =>
                              TransactionCancelPage(), settings: settings);

                    //owner
                    case '/owner_main_page':
                      return MaterialPageRoute(
                          builder: (context) => OwnerMainPage());
                    case '/owner_home_page':
                      return MaterialPageRoute(
                          builder: (context) => OwnerHomePage());
                    case '/owner_profile_page':
                      return MaterialPageRoute(
                          builder: (context) => OwnerProfilePage());
                    case '/owner_edit_password_page':
                      return MaterialPageRoute(
                          builder: (context) => OwnerEditPasswordPage());

                    //gm
                    case '/gm_main_page':
                      return MaterialPageRoute(
                          builder: (context) => GmMainPage());
                    case '/gm_home_page':
                      return MaterialPageRoute(
                          builder: (context) => GmHomePage());
                    case '/gm_profile_page':
                      return MaterialPageRoute(
                          builder: (context) => GmProfilePage());
                    case '/gm_edit_password_page':
                      return MaterialPageRoute(
                          builder: (context) => GmEditPasswordPage());

                    default:
                      return MaterialPageRoute(
                          builder: (context) => Scaffold(
                                body: Center(
                                    child: Text(
                                        'No route defined for ${settings.name}')),
                              ));
                  }
                },
              );
            }
          },
        ));
  }
}
