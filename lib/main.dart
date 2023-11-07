import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:grandatma_mobile/common/utils.dart';
import 'package:grandatma_mobile/presentation/bloc/auth/changepass/change_password_bloc.dart';
import 'package:grandatma_mobile/presentation/bloc/auth/signin/signin_bloc.dart';
import 'package:grandatma_mobile/presentation/bloc/auth/signup/signup_bloc.dart';
import 'package:grandatma_mobile/presentation/bloc/customer/profile/edit_profile/edit_profile_bloc.dart';
import 'package:grandatma_mobile/presentation/bloc/customer/profile/profile_bloc.dart';
import 'package:grandatma_mobile/presentation/bloc/customer/transaction/detail/transaction_detail_bloc.dart';
import 'package:grandatma_mobile/presentation/bloc/customer/transaction/history/transaction_history_bloc.dart';
import 'package:grandatma_mobile/presentation/pages/auth/hotel_information_page.dart';
import 'package:grandatma_mobile/presentation/pages/auth/signin_page.dart';
import 'package:grandatma_mobile/presentation/pages/auth/signup_page.dart';
import 'package:grandatma_mobile/presentation/pages/customer/customer_main_page.dart';
import 'package:grandatma_mobile/presentation/pages/customer/home/customer_home_page.dart';
import 'package:grandatma_mobile/presentation/pages/customer/profile/customer_edit_password_page.dart';
import 'package:grandatma_mobile/presentation/pages/customer/profile/customer_edit_profile_page.dart';
import 'package:grandatma_mobile/presentation/pages/customer/profile/customer_profile_page.dart';
import 'package:grandatma_mobile/presentation/pages/customer/transaction/transaction_detail_page.dart';
import 'package:grandatma_mobile/presentation/pages/customer/transaction/transaction_history_page.dart';
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

          //user
          BlocProvider<EditProfileBloc>(
            create: (context) => di.locator<EditProfileBloc>(),
          ),
          BlocProvider<ProfileBloc>(
            create: (context) => di.locator<ProfileBloc>(),
          ),

          //transaction
          BlocProvider<TransactionHistoryBloc>(
            create: (context) => di.locator<TransactionHistoryBloc>(),
          ),
          BlocProvider<TransactionDetailBloc>(
            create: (context) => di.locator<TransactionDetailBloc>(),
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
                    case '/customer_transaction_history_page':
                      return MaterialPageRoute(
                          builder: (context) =>
                              CustomerTransactionHistoryPage());
                    case '/customer_transaction_detail_page':
                      return MaterialPageRoute(
                          builder: (context) =>
                              CustomerTransactionDetailPage(), settings: settings);

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
