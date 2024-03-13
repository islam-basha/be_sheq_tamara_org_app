import 'package:be_sheq_tamara_org_app/features/authentication/presentation/profile_screen.dart';
import 'package:be_sheq_tamara_org_app/features/authentication/presentation/sign_in_screen.dart';
import 'package:be_sheq_tamara_org_app/features/donation/presentation/donations_history_screen.dart';
import 'package:be_sheq_tamara_org_app/features/messages/presentation/messages_screen.dart';
import 'package:be_sheq_tamara_org_app/features/notifications/presentation/notifications_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import '../features/authentication/presentation/edit_profile_screen.dart';
import '../features/primary/presentation/bottom_nav_bar.dart';
import '../features/primary/presentation/first_screen.dart';


final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _homeNavigatorKey = GlobalKey<NavigatorState>();
final _donateNavigatorKey = GlobalKey<NavigatorState>();
final _profileNavigatorKey = GlobalKey<NavigatorState>();

//final goRouterProvider=Provider((ref) => appRoute());

GoRouter appRoute(){
  return GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: '/first_page',
      routes: [
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell){
            return TamaraNavBar(navigationShell);
          },
          branches: [
            StatefulShellBranch(
                navigatorKey: _profileNavigatorKey ,
                routes: [
                  GoRoute(
                    path: '/profile',
                    name: 'profile',
                    builder: (context, state) =>  const Profile(),
                  )
                ]),
            StatefulShellBranch(
                navigatorKey: _donateNavigatorKey ,
                routes: [
                  GoRoute(
                      path: '/donate',
                      name: 'donate',
                      builder: (context, state) =>  const Profile(),)
                ]),
            StatefulShellBranch(
                navigatorKey: _homeNavigatorKey ,
                routes: [
                  GoRoute(
                    path: '/history',
                    name: 'history',
                      builder:(context, state) =>  const DonationsHistory(),
                  )
                ]),
          ]
        ),
        GoRoute(
          path: '/first_page',
          name: 'first_page',
          builder: (context, state) =>  const FirstPage(),
          routes: [
            GoRoute(
                path:'sign_in',
              name: 'sign_in',
              builder: (context, state) =>  const SignIn(),
            ),
          ]
        ),
        GoRoute(
          path: '/edit_profile',
          name:  'edit_profile',
          builder:(context, state) =>  const EditProfile(),
        ),
        GoRoute(
          path: '/notifications',
          name:  'notifications',
          builder:(context, state) =>  const Notifications(),
        ),
        GoRoute(
          path: '/messages',
          name:  'messages',
          builder:(context, state) =>  const Messages(),
        ),
      ]);
}