import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';


import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? const HomePageWidget() : const TestWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? const HomePageWidget() : const TestWidget(),
        ),
        FFRoute(
          name: 'HomePage2',
          path: '/homePage2',
          requireAuth: true,
          builder: (context, params) => const HomePage2Widget(),
        ),
        FFRoute(
          name: 'Login',
          path: '/login',
          builder: (context, params) => const LoginWidget(),
        ),
        FFRoute(
          name: 'User_Profile',
          path: '/userProfile',
          builder: (context, params) => UserProfileWidget(
            userID: params.getParam(
              'userID',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'Message',
          path: '/message',
          builder: (context, params) => MessageWidget(
            chatID: params.getParam(
              'chatID',
              ParamType.String,
            ),
            userId: params.getParam(
              'userId',
              ParamType.String,
            ),
            messageNum: params.getParam(
              'messageNum',
              ParamType.int,
            ),
            image: params.getParam(
              'image',
              ParamType.String,
            ),
            gender: params.getParam(
              'gender',
              ParamType.String,
            ),
            sender: params.getParam(
              'sender',
              ParamType.String,
            ),
            username: params.getParam(
              'username',
              ParamType.String,
            ),
            fullName: params.getParam(
              'fullName',
              ParamType.String,
            ),
            uSERID: params.getParam(
              'uSERID',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'Form',
          path: '/form',
          builder: (context, params) => const FormWidget(),
        ),
        FFRoute(
          name: 'Update_Profile',
          path: '/updateProfile',
          builder: (context, params) => const UpdateProfileWidget(),
        ),
        FFRoute(
          name: 'Privacy_Policy',
          path: '/privacyPolicy',
          builder: (context, params) => const PrivacyPolicyWidget(),
        ),
        FFRoute(
          name: 'HelpCenter',
          path: '/helpCenter',
          builder: (context, params) => const HelpCenterWidget(),
        ),
        FFRoute(
          name: 'Security',
          path: '/security',
          builder: (context, params) => const SecurityWidget(),
        ),
        FFRoute(
          name: 'Account_Settings',
          path: '/accountSettings',
          builder: (context, params) => const AccountSettingsWidget(),
        ),
        FFRoute(
          name: 'Account_Information',
          path: '/accountInformation',
          builder: (context, params) => const AccountInformationWidget(),
        ),
        FFRoute(
          name: 'Auth1',
          path: '/auth1',
          builder: (context, params) => const Auth1Widget(),
        ),
        FFRoute(
          name: 'Check',
          path: '/check',
          builder: (context, params) => const CheckWidget(),
        ),
        FFRoute(
          name: 'ProfileViews',
          path: '/profileViews',
          builder: (context, params) => const ProfileViewsWidget(),
        ),
        FFRoute(
          name: 'Blocked',
          path: '/blocked',
          builder: (context, params) => const BlockedWidget(),
        ),
        FFRoute(
          name: 'All_Users',
          path: '/allUsers',
          builder: (context, params) => const AllUsersWidget(),
        ),
        FFRoute(
          name: 'Live_Audio',
          path: '/liveAudio',
          builder: (context, params) => LiveAudioWidget(
            id: params.getParam(
              'id',
              ParamType.String,
            ),
            host: params.getParam(
              'host',
              ParamType.bool,
            ),
            url: params.getParam(
              'url',
              ParamType.String,
            ),
            appId: params.getParam(
              'appId',
              ParamType.int,
            ),
            appSign: params.getParam(
              'appSign',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'Users-NoProfile',
          path: '/usersNoProfile',
          builder: (context, params) => const UsersNoProfileWidget(),
        ),
        FFRoute(
          name: 'Call_Join',
          path: '/callJoin',
          builder: (context, params) => CallJoinWidget(
            url: params.getParam(
              'url',
              ParamType.String,
            ),
            id: params.getParam(
              'id',
              ParamType.String,
            ),
            admin: params.getParam(
              'admin',
              ParamType.bool,
            ),
            url2: params.getParam(
              'url2',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'Search',
          path: '/search',
          builder: (context, params) => const SearchWidget(),
        ),
        FFRoute(
          name: 'Live_AudioCopy',
          path: '/liveAudioCopy',
          builder: (context, params) => LiveAudioCopyWidget(
            id: params.getParam(
              'id',
              ParamType.String,
            ),
            host: params.getParam(
              'host',
              ParamType.bool,
            ),
            url: params.getParam(
              'url',
              ParamType.String,
            ),
            appId: params.getParam(
              'appId',
              ParamType.int,
            ),
            appSign: params.getParam(
              'appSign',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'Test',
          path: '/test',
          builder: (context, params) => const TestWidget(),
        ),
        FFRoute(
          name: 'User_Profile-Update',
          path: '/userProfileUpdate',
          builder: (context, params) => UserProfileUpdateWidget(
            userID: params.getParam(
              'userID',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'HomePage',
          path: '/homePage',
          requireAuth: true,
          builder: (context, params) => const HomePageWidget(),
        ),
        FFRoute(
          name: 'Email_Change',
          path: '/emailChange',
          builder: (context, params) => const EmailChangeWidget(),
        ),
        FFRoute(
          name: 'Login_Email',
          path: '/loginEmail',
          builder: (context, params) => const LoginEmailWidget(),
        ),
        FFRoute(
          name: 'Create_Account',
          path: '/createAccount',
          builder: (context, params) => const CreateAccountWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/test';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.white,
                  child: Center(
                    child: Image.asset(
                      'assets/images/IMG_6766.jpg',
                      width: 300.0,
                      height: 300.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
