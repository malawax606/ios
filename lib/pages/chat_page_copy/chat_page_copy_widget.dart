import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/permissions_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'chat_page_copy_model.dart';
export 'chat_page_copy_model.dart';

class ChatPageCopyWidget extends StatefulWidget {
  const ChatPageCopyWidget({super.key});

  @override
  State<ChatPageCopyWidget> createState() => _ChatPageCopyWidgetState();
}

class _ChatPageCopyWidgetState extends State<ChatPageCopyWidget> {
  late ChatPageCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatPageCopyModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.version = await actions.appVersion();
      _model.versionApi = await SupabaseAppVesrionCall.call(
        searchString: '1',
      );

      _model.user = await SupabaseUserCall.call(
        searchString: currentUserUid,
      );

      _model.url = await ImageUploadCall.call(
        image: SupabaseUserCall.profile(
                      (_model.user?.jsonBody ?? ''),
                    ) !=
                    null &&
                SupabaseUserCall.profile(
                      (_model.user?.jsonBody ?? ''),
                    ) !=
                    ''
            ? SupabaseUserCall.profile(
                (_model.user?.jsonBody ?? ''),
              )
            : 'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
        key: '70de3bbf96ca7056ee937df625795bd8',
      );

      await actions.desconectar(
        'chat',
      );
      await actions.desconectar(
        'User',
      );
      await actions.supaRealtime(
        'chat',
        () async {},
      );
      await actions.supaRealtime(
        'User',
        () async {
          safeSetState(() => _model.requestCompleter3 = null);
          await _model.waitForRequestCompleted3();
        },
      );
      _model.country = await CountryCall.call();

      await UserTable().update(
        data: {
          'Country': CountryCall.country(
            (_model.country?.jsonBody ?? ''),
          ),
          'City': CountryCall.city(
            (_model.country?.jsonBody ?? ''),
          ),
        },
        matchingRows: (rows) => rows.eq(
          'id',
          currentUserUid,
        ),
      );
      _model.flg = await CountryFalgCall.call(
        code: CountryCall.code(
          (_model.country?.jsonBody ?? ''),
        ),
      );

      await requestPermission(microphonePermission);
      if (!(valueOrDefault(currentUserDocument?.gender, '') != '')) {
        context.goNamed(
          'Form',
          extra: <String, dynamic>{
            kTransitionInfoKey: const TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.fade,
              duration: Duration(milliseconds: 0),
            ),
          },
        );
      }
      _model.fcm = await actions.getFCM();
      await UserTable().update(
        data: {
          'FCM_TOKEN': _model.fcm,
        },
        matchingRows: (rows) => rows.eq(
          'id',
          currentUserUid,
        ),
      );
    });

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        safeSetState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<UserRow>>(
      future: (_model.requestCompleter3 ??= Completer<List<UserRow>>()
            ..complete(UserTable().querySingleRow(
              queryFn: (q) => q.eq(
                'id',
                currentUserUid,
              ),
            )))
          .future,
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<UserRow> chatPageCopyUserRowList = snapshot.data!;

        final chatPageCopyUserRow = chatPageCopyUserRowList.isNotEmpty
            ? chatPageCopyUserRowList.first
            : null;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primary,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              title: Visibility(
                visible: _model.version ==
                    SupabaseAppVesrionCall.version(
                      (_model.versionApi?.jsonBody ?? ''),
                    ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        FlutterFlowIconButton(
                          borderColor: FlutterFlowTheme.of(context).primary,
                          borderRadius: 20.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          fillColor: FlutterFlowTheme.of(context).info,
                          icon: const Icon(
                            FFIcons.kphoneCallingSvgrepoCom,
                            color: Color(0x41000000),
                            size: 22.0,
                          ),
                          onPressed: () async {
                            context.pushNamed(
                              'Call_Join',
                              queryParameters: {
                                'url': serializeParam(
                                  ImageUploadCall.url(
                                    (_model.url?.jsonBody ?? ''),
                                  ),
                                  ParamType.String,
                                ),
                                'id': serializeParam(
                                  chatPageCopyUserRow?.username != null &&
                                          chatPageCopyUserRow?.username != ''
                                      ? '${chatPageCopyUserRow?.username} ${chatPageCopyUserRow?.age}'
                                      : 'User',
                                  ParamType.String,
                                ),
                                'admin': serializeParam(
                                  chatPageCopyUserRow?.admin,
                                  ParamType.bool,
                                ),
                                'url2': serializeParam(
                                  ImageUploadCall.url(
                                    (_model.url?.jsonBody ?? ''),
                                  ),
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          },
                        ),
                      ],
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        if (chatPageCopyUserRow?.admin == true) {
                          context.pushNamed(
                            'Users-NoProfile',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: const TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        }
                      },
                      child: Text(
                        'Chats',
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              fontFamily: 'Inter Tight',
                              color: const Color(0xFF95A1AC),
                              fontSize: 24.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FlutterFlowIconButton(
                          borderColor: FlutterFlowTheme.of(context).primary,
                          borderRadius: 20.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          fillColor: FlutterFlowTheme.of(context).info,
                          icon: const Icon(
                            FFIcons.kmagniferSvgrepoCom2,
                            color: Color(0x41000000),
                            size: 22.0,
                          ),
                          onPressed: () async {
                            if (chatPageCopyUserRow?.admin == true) {
                              context.pushNamed(
                                'All_Users',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: const TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );
                            }

                            context.pushNamed('Search');
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              actions: const [],
              centerTitle: true,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                        ),
                        child: Stack(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          children: [
                            if (_model.version ==
                                SupabaseAppVesrionCall.version(
                                  (_model.versionApi?.jsonBody ?? ''),
                                ))
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  FutureBuilder<List<ChatRow>>(
                                    future: FFAppState()
                                        .allChat(
                                      requestFn: () => ChatTable().queryRows(
                                        queryFn: (q) => q
                                            .contains(
                                              'Users',
                                              '{$currentUserUid}',
                                            )
                                            .order('last_mesage_sent_time'),
                                      ),
                                    )
                                        .then((result) {
                                      _model.requestCompleted1 = true;
                                      return result;
                                    }),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<ChatRow> listViewChatRowList =
                                          snapshot.data!;

                                      return ListView.separated(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: listViewChatRowList.length,
                                        separatorBuilder: (_, __) =>
                                            const SizedBox(height: 5.0),
                                        itemBuilder: (context, listViewIndex) {
                                          final listViewChatRow =
                                              listViewChatRowList[
                                                  listViewIndex];
                                          return Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 15.0, 10.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                FutureBuilder<List<UserRow>>(
                                                  future: (_model
                                                              .requestCompleter2 ??=
                                                          Completer<
                                                              List<UserRow>>()
                                                            ..complete(UserTable()
                                                                .querySingleRow(
                                                              queryFn: (q) =>
                                                                  q.eq(
                                                                'id',
                                                                listViewChatRow
                                                                            .userA ==
                                                                        currentUserUid
                                                                    ? listViewChatRow
                                                                        .userB
                                                                    : listViewChatRow
                                                                        .userA,
                                                              ),
                                                            )))
                                                      .future,
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<UserRow>
                                                        rowUserUserRowList =
                                                        snapshot.data!;

                                                    final rowUserUserRow =
                                                        rowUserUserRowList
                                                                .isNotEmpty
                                                            ? rowUserUserRowList
                                                                .first
                                                            : null;

                                                    return Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Stack(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      1.0,
                                                                      -1.0),
                                                              children: [
                                                                InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    await Navigator
                                                                        .push(
                                                                      context,
                                                                      PageTransition(
                                                                        type: PageTransitionType
                                                                            .fade,
                                                                        child:
                                                                            FlutterFlowExpandedImageView(
                                                                          image:
                                                                              CachedNetworkImage(
                                                                            fadeInDuration:
                                                                                const Duration(milliseconds: 500),
                                                                            fadeOutDuration:
                                                                                const Duration(milliseconds: 500),
                                                                            imageUrl:
                                                                                valueOrDefault<String>(
                                                                              rowUserUserRow?.profilePic != null && rowUserUserRow?.profilePic != '' ? rowUserUserRow?.profilePic : 'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
                                                                              'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
                                                                            ),
                                                                            fit:
                                                                                BoxFit.contain,
                                                                          ),
                                                                          allowRotation:
                                                                              true,
                                                                          tag: valueOrDefault<
                                                                              String>(
                                                                            rowUserUserRow?.profilePic != null && rowUserUserRow?.profilePic != ''
                                                                                ? rowUserUserRow?.profilePic
                                                                                : 'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
                                                                            'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg' '$listViewIndex',
                                                                          ),
                                                                          useHeroAnimation:
                                                                              true,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                  child: Hero(
                                                                    tag: valueOrDefault<
                                                                        String>(
                                                                      rowUserUserRow?.profilePic != null &&
                                                                              rowUserUserRow?.profilePic !=
                                                                                  ''
                                                                          ? rowUserUserRow
                                                                              ?.profilePic
                                                                          : 'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
                                                                      'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg' '$listViewIndex',
                                                                    ),
                                                                    transitionOnUserGestures:
                                                                        true,
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          55.0,
                                                                      height:
                                                                          55.0,
                                                                      clipBehavior:
                                                                          Clip.antiAlias,
                                                                      decoration:
                                                                          const BoxDecoration(
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                      child:
                                                                          CachedNetworkImage(
                                                                        fadeInDuration:
                                                                            const Duration(milliseconds: 500),
                                                                        fadeOutDuration:
                                                                            const Duration(milliseconds: 500),
                                                                        imageUrl:
                                                                            valueOrDefault<String>(
                                                                          rowUserUserRow?.profilePic != null && rowUserUserRow?.profilePic != ''
                                                                              ? rowUserUserRow?.profilePic
                                                                              : 'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
                                                                          'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
                                                                        ),
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                if ((listViewChatRow
                                                                            .lastMessageSentBy !=
                                                                        currentUserUid) &&
                                                                    (listViewChatRow
                                                                            .mesageSeen ==
                                                                        false))
                                                                  Align(
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            12.0,
                                                                        height:
                                                                            12.0,
                                                                        decoration:
                                                                            const BoxDecoration(
                                                                          color:
                                                                              Color(0xFFF80606),
                                                                          shape:
                                                                              BoxShape.circle,
                                                                        ),
                                                                        alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                      ),
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                context
                                                                    .pushNamed(
                                                                  'Message',
                                                                  queryParameters:
                                                                      {
                                                                    'chatID':
                                                                        serializeParam(
                                                                      listViewChatRow
                                                                          .chatID,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'userId':
                                                                        serializeParam(
                                                                      rowUserUserRow
                                                                          ?.id,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'image':
                                                                        serializeParam(
                                                                      rowUserUserRow
                                                                          ?.profilePic,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'gender':
                                                                        serializeParam(
                                                                      rowUserUserRow
                                                                          ?.gender,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'sender':
                                                                        serializeParam(
                                                                      listViewChatRow
                                                                          .lastMessageSentBy,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'messageNum':
                                                                        serializeParam(
                                                                      listViewChatRow
                                                                          .messageNum,
                                                                      ParamType
                                                                          .int,
                                                                    ),
                                                                    'username':
                                                                        serializeParam(
                                                                      rowUserUserRow
                                                                          ?.username,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'fullName':
                                                                        serializeParam(
                                                                      rowUserUserRow
                                                                          ?.fullName,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'uSERID':
                                                                        serializeParam(
                                                                      rowUserUserRow
                                                                          ?.userId
                                                                          ?.toString(),
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );

                                                                _model.token4 =
                                                                    await actions
                                                                        .getAccessToken();
                                                                if ((listViewChatRow.profile1 !=
                                                                            null &&
                                                                        listViewChatRow.profile1 !=
                                                                            '') ||
                                                                    (listViewChatRow.profile2 !=
                                                                            null &&
                                                                        listViewChatRow.profile2 !=
                                                                            '')) {
                                                                  await ChatTable()
                                                                      .update(
                                                                    data: {
                                                                      'Profile1': chatPageCopyUserRow?.profilePic != null &&
                                                                              chatPageCopyUserRow?.profilePic !=
                                                                                  ''
                                                                          ? chatPageCopyUserRow
                                                                              ?.profilePic
                                                                          : 'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
                                                                      'Profile2': rowUserUserRow?.profilePic != null &&
                                                                              rowUserUserRow?.profilePic !=
                                                                                  ''
                                                                          ? rowUserUserRow
                                                                              ?.profilePic
                                                                          : 'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
                                                                      'Username1':
                                                                          chatPageCopyUserRow
                                                                              ?.username,
                                                                      'Username2':
                                                                          rowUserUserRow
                                                                              ?.username,
                                                                    },
                                                                    matchingRows:
                                                                        (rows) => rows
                                                                            .eq(
                                                                              'Chat_ID',
                                                                              listViewChatRow.chatID,
                                                                            )
                                                                            .contains(
                                                                              'Users',
                                                                              '{$currentUserUid}',
                                                                            ),
                                                                  );
                                                                }
                                                                await AccessTokenTable()
                                                                    .update(
                                                                  data: {
                                                                    'Token': _model
                                                                        .token4,
                                                                  },
                                                                  matchingRows:
                                                                      (rows) =>
                                                                          rows.eq(
                                                                    'id',
                                                                    1,
                                                                  ),
                                                                );

                                                                safeSetState(
                                                                    () {});
                                                              },
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            7.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            rowUserUserRow?.username,
                                                                            'User',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      if (rowUserUserRow
                                                                              ?.vipProfilee ??
                                                                          true)
                                                                        const Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              3.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Icon(
                                                                            Icons.verified_sharp,
                                                                            color:
                                                                                Color(0xFF0992F9),
                                                                            size:
                                                                                15.0,
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      if ((listViewChatRow.mesageSeen ==
                                                                              true) &&
                                                                          (listViewChatRow.lastMessageSentBy ==
                                                                              currentUserUid))
                                                                        const Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              7.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Icon(
                                                                            Icons.done_all_rounded,
                                                                            color:
                                                                                Color(0xFF1975FB),
                                                                            size:
                                                                                18.0,
                                                                          ),
                                                                        ),
                                                                      if ((listViewChatRow.mesageSeen ==
                                                                              false) &&
                                                                          (listViewChatRow.lastMessageSentBy ==
                                                                              currentUserUid))
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              7.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Icon(
                                                                            Icons.done_all_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            size:
                                                                                18.0,
                                                                          ),
                                                                        ),
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            7.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            listViewChatRow.lastMessage,
                                                                            '.',
                                                                          ).maybeHandleOverflow(
                                                                            maxChars:
                                                                                26,
                                                                            replacement:
                                                                                '…',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          7.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    dateTimeFormat(
                                                                        "relative",
                                                                        listViewChatRow
                                                                            .lastMesageSentTime),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ),
                                              ].divide(const SizedBox(height: 15.0)),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            if (_model.version !=
                                SupabaseAppVesrionCall.version(
                                  (_model.versionApi?.jsonBody ?? ''),
                                ))
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'New Version Available',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            fontFamily: 'Inter Tight',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Text(
                                      'We\'ve added exciting new features and fixed some bugs. Please update to continue using the app.',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    FFButtonWidget(
                                      onPressed: () async {
                                        await launchURL(
                                            SupabaseAppVesrionCall.url(
                                          (_model.versionApi?.jsonBody ?? ''),
                                        )!);
                                      },
                                      text: 'Update Now',
                                      options: FFButtonOptions(
                                        width: 200.0,
                                        height: 50.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: const Color(0xFF6F61EF),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Inter Tight',
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ].divide(const SizedBox(height: 24.0)),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (!(isWeb
                      ? MediaQuery.viewInsetsOf(context).bottom > 0
                      : _isKeyboardVisible))
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 0.5,
                          decoration: const BoxDecoration(
                            color: Color(0xFFDADADA),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          HapticFeedback.lightImpact();

                                          context.goNamed(
                                            'HomePageCopy',
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  const TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 0),
                                              ),
                                            },
                                          );
                                        },
                                        child: Container(
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: const Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                FFIcons.khomeSmileSvgrepoCom,
                                                color: Color(0xFFB4BBB8),
                                                size: 28.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          HapticFeedback.lightImpact();
                                          safeSetState(() {
                                            FFAppState().clearAllChatCache();
                                            _model.requestCompleted1 = false;
                                          });
                                          await _model
                                              .waitForRequestCompleted1();
                                          safeSetState(() =>
                                              _model.requestCompleter3 = null);
                                          await _model
                                              .waitForRequestCompleted3();
                                          safeSetState(() =>
                                              _model.requestCompleter2 = null);
                                          await _model
                                              .waitForRequestCompleted2();
                                        },
                                        child: Container(
                                          width: 55.0,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: const Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 1.0),
                                                child: Icon(
                                                  FFIcons.kchatUnreadSvgrepoCom,
                                                  color: Color(0xFF0DBC8C),
                                                  size: 26.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          HapticFeedback.lightImpact();

                                          context.goNamed(
                                            'ProfileCopy',
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  const TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 0),
                                              ),
                                            },
                                          );
                                        },
                                        child: Container(
                                          width: 55.0,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Stack(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                children: [
                                                  Container(
                                                    width: 36.0,
                                                    height: 36.0,
                                                    decoration: const BoxDecoration(
                                                      color: Colors.transparent,
                                                      shape: BoxShape.circle,
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Container(
                                                      width: 33.0,
                                                      height: 33.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: Image.network(
                                                            valueOrDefault<
                                                                String>(
                                                              chatPageCopyUserRow
                                                                              ?.profilePic !=
                                                                          null &&
                                                                      chatPageCopyUserRow
                                                                              ?.profilePic !=
                                                                          ''
                                                                  ? chatPageCopyUserRow
                                                                      ?.profilePic
                                                                  : 'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
                                                              'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
                                                            ),
                                                          ).image,
                                                        ),
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          width: 2.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
