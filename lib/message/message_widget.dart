import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/more_widget.dart';
import '/components/report_done_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'message_model.dart';
export 'message_model.dart';

class MessageWidget extends StatefulWidget {
  const MessageWidget({
    super.key,
    this.chatID,
    this.userId,
    this.messageNum,
    required this.image,
    required this.gender,
    required this.sender,
    required this.username,
    required this.fullName,
    required this.uSERID,
  });

  final String? chatID;
  final String? userId;
  final int? messageNum;
  final String? image;
  final String? gender;
  final String? sender;
  final String? username;
  final String? fullName;
  final String? uSERID;

  @override
  State<MessageWidget> createState() => _MessageWidgetState();
}

class _MessageWidgetState extends State<MessageWidget>
    with TickerProviderStateMixin {
  late MessageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MessageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.addToUsers(currentUserUid);
      safeSetState(() {});
      _model.addToUsers(currentUserUid);
      safeSetState(() {});
      if (widget.sender != currentUserUid) {
        await ChatTable().update(
          data: {
            'Mesage_seen': true,
          },
          matchingRows: (rows) => rows.eq(
            'Chat_ID',
            widget.chatID,
          ),
        );
      }
    });

    _model.messageTextController ??= TextEditingController();
    _model.messageFocusNode ??= FocusNode();
    _model.messageFocusNode!.addListener(
      () async {
        _model.message = _model.messageTextController.text;
        safeSetState(() {});
        _model.more = false;
        _model.id = null;
        _model.love = null;
        _model.loveID = null;
        safeSetState(() {});
      },
    );
    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: const Offset(300.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 300.0.ms,
            duration: 200.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 400.0.ms,
            duration: 200.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 400.0.ms,
            duration: 200.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 500.0.ms,
            duration: 200.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 700.0.ms,
            duration: 200.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation6': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 700.0.ms,
            duration: 200.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation7': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 700.0.ms,
            duration: 200.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation8': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 700.0.ms,
            duration: 200.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation9': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 300.0.ms,
            duration: 200.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: const Offset(300.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation10': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 300.0.ms,
            duration: 200.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primary,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: FutureBuilder<List<UserRow>>(
            future: UserTable().querySingleRow(
              queryFn: (q) => q.eq(
                'id',
                widget.userId,
              ),
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                );
              }
              List<UserRow> rowUserRowList = snapshot.data!;

              final rowUserRow =
                  rowUserRowList.isNotEmpty ? rowUserRowList.first : null;

              return Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.safePop();
                        },
                        child: const Icon(
                          FFIcons.kaltArrowLeftSvgrepoCom,
                          color: Color(0xFFB4BBB8),
                          size: 24.0,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.fade,
                                child: FlutterFlowExpandedImageView(
                                  image: CachedNetworkImage(
                                    fadeInDuration: const Duration(milliseconds: 500),
                                    fadeOutDuration:
                                        const Duration(milliseconds: 500),
                                    imageUrl: valueOrDefault<String>(
                                      rowUserRow?.profilePic != null &&
                                              rowUserRow?.profilePic != ''
                                          ? rowUserRow?.profilePic
                                          : 'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
                                      'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                  allowRotation: false,
                                  tag: valueOrDefault<String>(
                                    rowUserRow?.profilePic != null &&
                                            rowUserRow?.profilePic != ''
                                        ? rowUserRow?.profilePic
                                        : 'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
                                    'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
                                  ),
                                  useHeroAnimation: true,
                                ),
                              ),
                            );
                          },
                          child: Hero(
                            tag: valueOrDefault<String>(
                              rowUserRow?.profilePic != null &&
                                      rowUserRow?.profilePic != ''
                                  ? rowUserRow?.profilePic
                                  : 'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
                              'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
                            ),
                            transitionOnUserGestures: true,
                            child: Container(
                              width: 35.0,
                              height: 35.0,
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: CachedNetworkImage(
                                fadeInDuration: const Duration(milliseconds: 500),
                                fadeOutDuration: const Duration(milliseconds: 500),
                                imageUrl: valueOrDefault<String>(
                                  rowUserRow?.profilePic != null &&
                                          rowUserRow?.profilePic != ''
                                      ? rowUserRow?.profilePic
                                      : 'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
                                  'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(
                            'User_Profile',
                            queryParameters: {
                              'userID': serializeParam(
                                widget.userId,
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      6.0, 0.0, 0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await Clipboard.setData(
                                          ClipboardData(text: widget.chatID!));
                                    },
                                    child: Text(
                                      valueOrDefault<String>(
                                        rowUserRow?.username,
                                        'User',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                                if (rowUserRow?.vipProfilee ?? true)
                                  const Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        3.0, 0.0, 0.0, 0.0),
                                    child: Icon(
                                      Icons.verified,
                                      color: Color(0xFF189EFF),
                                      size: 16.0,
                                    ),
                                  ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  6.0, 0.0, 0.0, 0.0),
                              child: Text(
                                dateTimeFormat(
                                  "relative",
                                  rowUserRow!.online!,
                                  locale:
                                      FFLocalizations.of(context).languageCode,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Inter',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 13.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w200,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    useSafeArea: true,
                    context: context,
                    builder: (context) {
                      return GestureDetector(
                        onTap: () => FocusScope.of(context).unfocus(),
                        child: Padding(
                          padding: MediaQuery.viewInsetsOf(context),
                          child: SizedBox(
                            height: 200.0,
                            child: MoreWidget(
                              id: '',
                              image: widget.image!,
                              username: widget.username!,
                              fullName: widget.fullName!,
                              userID: widget.uSERID!,
                            ),
                          ),
                        ),
                      );
                    },
                  ).then((value) => safeSetState(() {}));
                },
                child: const Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.more_vert,
                      color: Color(0xFFB4BBB8),
                      size: 26.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: FutureBuilder<List<UserRow>>(
            future: UserTable().querySingleRow(
              queryFn: (q) => q.eq(
                'id',
                currentUserUid,
              ),
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                );
              }
              List<UserRow> pageMeUserRowList = snapshot.data!;

              final pageMeUserRow =
                  pageMeUserRowList.isNotEmpty ? pageMeUserRowList.first : null;

              return Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color(0x43BABABA),
                    ),
                  ),
                  Expanded(
                    child: FutureBuilder<List<UserRow>>(
                      future: UserTable().querySingleRow(
                        queryFn: (q) => q.eq(
                          'id',
                          widget.userId,
                        ),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<UserRow> bodyUserRowList = snapshot.data!;

                        final bodyUserRow = bodyUserRowList.isNotEmpty
                            ? bodyUserRowList.first
                            : null;

                        return Container(
                          width: double.infinity,
                          height: 100.0,
                          decoration: const BoxDecoration(),
                          child: FutureBuilder<List<AccessTokenRow>>(
                            future: (_model.requestCompleter2 ??= Completer<
                                    List<AccessTokenRow>>()
                                  ..complete(AccessTokenTable().querySingleRow(
                                    queryFn: (q) => q.eq(
                                      'id',
                                      1,
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
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<AccessTokenRow>
                                  stackTokenAccessTokenRowList = snapshot.data!;

                              final stackTokenAccessTokenRow =
                                  stackTokenAccessTokenRowList.isNotEmpty
                                      ? stackTokenAccessTokenRowList.first
                                      : null;

                              return Stack(
                                alignment: const AlignmentDirectional(1.0, 0.5),
                                children: [
                                  Stack(
                                    alignment: const AlignmentDirectional(0.0, 1.0),
                                    children: [
                                      Stack(
                                        children: [
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 1.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 5.0, 10.0, 95.0),
                                              child: FutureBuilder<
                                                  List<MessageRow>>(
                                                future: (_model
                                                            .requestCompleter1 ??=
                                                        Completer<
                                                            List<MessageRow>>()
                                                          ..complete(
                                                              MessageTable()
                                                                  .queryRows(
                                                            queryFn: (q) => q
                                                                .eq(
                                                                  'Chat_ID',
                                                                  widget
                                                                      .chatID,
                                                                )
                                                                .order(
                                                                    'created_at'),
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
                                                  List<MessageRow>
                                                      messagesMessageRowList =
                                                      snapshot.data!;

                                                  return InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      _model.more = false;
                                                      _model.id = null;
                                                      _model.love = null;
                                                      _model.loveID = null;
                                                      safeSetState(() {});
                                                    },
                                                    child: ListView.separated(
                                                      padding: EdgeInsets.zero,
                                                      reverse: true,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          messagesMessageRowList
                                                              .length,
                                                      separatorBuilder:
                                                          (_, __) => const SizedBox(
                                                              height: 13.0),
                                                      itemBuilder: (context,
                                                          messagesIndex) {
                                                        final messagesMessageRow =
                                                            messagesMessageRowList[
                                                                messagesIndex];
                                                        return Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            if (messagesMessageRow
                                                                    .user !=
                                                                currentUserUid)
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          45.0,
                                                                          0.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children: [
                                                                          Flexible(
                                                                            child:
                                                                                Stack(
                                                                              children: [
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    if ((_model.loveID == messagesMessageRow.id) && (_model.love == true))
                                                                                      Align(
                                                                                        alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                        child: Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 50.0, 0.0),
                                                                                          child: ClipRRect(
                                                                                            child: Container(
                                                                                              width: MediaQuery.sizeOf(context).width * 0.72,
                                                                                              decoration: const BoxDecoration(),
                                                                                              child: Align(
                                                                                                alignment: const AlignmentDirectional(1.0, 0.0),
                                                                                                child: Padding(
                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                                                                                                  child: Container(
                                                                                                    width: MediaQuery.sizeOf(context).width * 0.73,
                                                                                                    height: 50.0,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: FlutterFlowTheme.of(context).editProfile,
                                                                                                      borderRadius: BorderRadius.circular(50.0),
                                                                                                    ),
                                                                                                    child: Padding(
                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(12.0, 6.0, 12.0, 6.0),
                                                                                                      child: SingleChildScrollView(
                                                                                                        scrollDirection: Axis.horizontal,
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                          children: [
                                                                                                            Padding(
                                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                              child: InkWell(
                                                                                                                splashColor: Colors.transparent,
                                                                                                                focusColor: Colors.transparent,
                                                                                                                hoverColor: Colors.transparent,
                                                                                                                highlightColor: Colors.transparent,
                                                                                                                onTap: () async {
                                                                                                                  await MessageTable().update(
                                                                                                                    data: {
                                                                                                                      'Love': '❤️',
                                                                                                                    },
                                                                                                                    matchingRows: (rows) => rows.eq(
                                                                                                                      'id',
                                                                                                                      _model.loveID,
                                                                                                                    ),
                                                                                                                  );
                                                                                                                  safeSetState(() => _model.requestCompleter1 = null);
                                                                                                                  _model.love = false;
                                                                                                                  _model.loveID = null;
                                                                                                                  safeSetState(() {});
                                                                                                                },
                                                                                                                child: Text(
                                                                                                                  FFLocalizations.of(context).getText(
                                                                                                                    '851jdurs' /* ❤️ */,
                                                                                                                  ),
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'Inter',
                                                                                                                        fontSize: 26.0,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation1']!),
                                                                                                            ),
                                                                                                            Padding(
                                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                              child: InkWell(
                                                                                                                splashColor: Colors.transparent,
                                                                                                                focusColor: Colors.transparent,
                                                                                                                hoverColor: Colors.transparent,
                                                                                                                highlightColor: Colors.transparent,
                                                                                                                onTap: () async {
                                                                                                                  await MessageTable().update(
                                                                                                                    data: {
                                                                                                                      'Love': '😂',
                                                                                                                    },
                                                                                                                    matchingRows: (rows) => rows.eq(
                                                                                                                      'id',
                                                                                                                      _model.loveID,
                                                                                                                    ),
                                                                                                                  );
                                                                                                                  safeSetState(() => _model.requestCompleter1 = null);
                                                                                                                  _model.love = false;
                                                                                                                  _model.loveID = null;
                                                                                                                  safeSetState(() {});
                                                                                                                },
                                                                                                                child: Text(
                                                                                                                  FFLocalizations.of(context).getText(
                                                                                                                    'gmv8wcf6' /* 😂 */,
                                                                                                                  ),
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'Inter',
                                                                                                                        fontSize: 26.0,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation2']!),
                                                                                                            ),
                                                                                                            Padding(
                                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                              child: InkWell(
                                                                                                                splashColor: Colors.transparent,
                                                                                                                focusColor: Colors.transparent,
                                                                                                                hoverColor: Colors.transparent,
                                                                                                                highlightColor: Colors.transparent,
                                                                                                                onTap: () async {
                                                                                                                  await MessageTable().update(
                                                                                                                    data: {
                                                                                                                      'Love': '😡',
                                                                                                                    },
                                                                                                                    matchingRows: (rows) => rows.eq(
                                                                                                                      'id',
                                                                                                                      _model.loveID,
                                                                                                                    ),
                                                                                                                  );
                                                                                                                  safeSetState(() => _model.requestCompleter1 = null);
                                                                                                                  _model.love = false;
                                                                                                                  _model.loveID = null;
                                                                                                                  safeSetState(() {});
                                                                                                                },
                                                                                                                child: Text(
                                                                                                                  FFLocalizations.of(context).getText(
                                                                                                                    '6z39kbze' /* 😡 */,
                                                                                                                  ),
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'Inter',
                                                                                                                        fontSize: 26.0,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation3']!),
                                                                                                            ),
                                                                                                            Padding(
                                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                              child: InkWell(
                                                                                                                splashColor: Colors.transparent,
                                                                                                                focusColor: Colors.transparent,
                                                                                                                hoverColor: Colors.transparent,
                                                                                                                highlightColor: Colors.transparent,
                                                                                                                onTap: () async {
                                                                                                                  await MessageTable().update(
                                                                                                                    data: {
                                                                                                                      'Love': '👍',
                                                                                                                    },
                                                                                                                    matchingRows: (rows) => rows.eq(
                                                                                                                      'id',
                                                                                                                      _model.loveID,
                                                                                                                    ),
                                                                                                                  );
                                                                                                                  safeSetState(() => _model.requestCompleter1 = null);
                                                                                                                  _model.love = false;
                                                                                                                  _model.loveID = null;
                                                                                                                  safeSetState(() {});
                                                                                                                },
                                                                                                                child: Text(
                                                                                                                  FFLocalizations.of(context).getText(
                                                                                                                    'vz5it9g7' /* 👍 */,
                                                                                                                  ),
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'Inter',
                                                                                                                        fontSize: 26.0,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation4']!),
                                                                                                            ),
                                                                                                            Padding(
                                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                              child: InkWell(
                                                                                                                splashColor: Colors.transparent,
                                                                                                                focusColor: Colors.transparent,
                                                                                                                hoverColor: Colors.transparent,
                                                                                                                highlightColor: Colors.transparent,
                                                                                                                onTap: () async {
                                                                                                                  await MessageTable().update(
                                                                                                                    data: {
                                                                                                                      'Love': '😒',
                                                                                                                    },
                                                                                                                    matchingRows: (rows) => rows.eq(
                                                                                                                      'id',
                                                                                                                      _model.loveID,
                                                                                                                    ),
                                                                                                                  );
                                                                                                                  safeSetState(() => _model.requestCompleter1 = null);
                                                                                                                  _model.love = false;
                                                                                                                  _model.loveID = null;
                                                                                                                  safeSetState(() {});
                                                                                                                },
                                                                                                                child: Text(
                                                                                                                  FFLocalizations.of(context).getText(
                                                                                                                    'gx1qiaq4' /* 😒 */,
                                                                                                                  ),
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'Inter',
                                                                                                                        fontSize: 26.0,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation5']!),
                                                                                                            ),
                                                                                                            Padding(
                                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                              child: InkWell(
                                                                                                                splashColor: Colors.transparent,
                                                                                                                focusColor: Colors.transparent,
                                                                                                                hoverColor: Colors.transparent,
                                                                                                                highlightColor: Colors.transparent,
                                                                                                                onTap: () async {
                                                                                                                  await MessageTable().update(
                                                                                                                    data: {
                                                                                                                      'Love': '🤭',
                                                                                                                    },
                                                                                                                    matchingRows: (rows) => rows.eq(
                                                                                                                      'id',
                                                                                                                      _model.loveID,
                                                                                                                    ),
                                                                                                                  );
                                                                                                                  safeSetState(() => _model.requestCompleter1 = null);
                                                                                                                  _model.love = false;
                                                                                                                  _model.loveID = null;
                                                                                                                  safeSetState(() {});
                                                                                                                },
                                                                                                                child: Text(
                                                                                                                  FFLocalizations.of(context).getText(
                                                                                                                    'm87fyq7s' /* 🤭 */,
                                                                                                                  ),
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'Inter',
                                                                                                                        fontSize: 26.0,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation6']!),
                                                                                                            ),
                                                                                                            Padding(
                                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                              child: InkWell(
                                                                                                                splashColor: Colors.transparent,
                                                                                                                focusColor: Colors.transparent,
                                                                                                                hoverColor: Colors.transparent,
                                                                                                                highlightColor: Colors.transparent,
                                                                                                                onTap: () async {
                                                                                                                  await MessageTable().update(
                                                                                                                    data: {
                                                                                                                      'Love': '😳',
                                                                                                                    },
                                                                                                                    matchingRows: (rows) => rows.eq(
                                                                                                                      'id',
                                                                                                                      _model.loveID,
                                                                                                                    ),
                                                                                                                  );
                                                                                                                  safeSetState(() => _model.requestCompleter1 = null);
                                                                                                                  _model.love = false;
                                                                                                                  _model.loveID = null;
                                                                                                                  safeSetState(() {});
                                                                                                                },
                                                                                                                child: Text(
                                                                                                                  FFLocalizations.of(context).getText(
                                                                                                                    'yw6behyx' /* 😳 */,
                                                                                                                  ),
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'Inter',
                                                                                                                        fontSize: 26.0,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation7']!),
                                                                                                            ),
                                                                                                            InkWell(
                                                                                                              splashColor: Colors.transparent,
                                                                                                              focusColor: Colors.transparent,
                                                                                                              hoverColor: Colors.transparent,
                                                                                                              highlightColor: Colors.transparent,
                                                                                                              onTap: () async {
                                                                                                                await MessageTable().update(
                                                                                                                  data: {
                                                                                                                    'Love': '👊',
                                                                                                                  },
                                                                                                                  matchingRows: (rows) => rows.eq(
                                                                                                                    'id',
                                                                                                                    _model.loveID,
                                                                                                                  ),
                                                                                                                );
                                                                                                                safeSetState(() => _model.requestCompleter1 = null);
                                                                                                                _model.love = false;
                                                                                                                _model.loveID = null;
                                                                                                                safeSetState(() {});
                                                                                                              },
                                                                                                              child: Text(
                                                                                                                FFLocalizations.of(context).getText(
                                                                                                                  '8thnfpmn' /* 👊 */,
                                                                                                                ),
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'Inter',
                                                                                                                      fontSize: 26.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation8']!),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation1']!),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 7.0, 0.0),
                                                                                          child: InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              await Navigator.push(
                                                                                                context,
                                                                                                PageTransition(
                                                                                                  type: PageTransitionType.fade,
                                                                                                  child: FlutterFlowExpandedImageView(
                                                                                                    image: CachedNetworkImage(
                                                                                                      fadeInDuration: const Duration(milliseconds: 500),
                                                                                                      fadeOutDuration: const Duration(milliseconds: 500),
                                                                                                      imageUrl: valueOrDefault<String>(
                                                                                                        widget.image != null && widget.image != '' ? widget.image : 'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
                                                                                                        'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
                                                                                                      ),
                                                                                                      fit: BoxFit.contain,
                                                                                                    ),
                                                                                                    allowRotation: true,
                                                                                                    tag: valueOrDefault<String>(
                                                                                                      widget.image != null && widget.image != '' ? widget.image : 'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
                                                                                                      'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg' '$messagesIndex',
                                                                                                    ),
                                                                                                    useHeroAnimation: true,
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                            child: Hero(
                                                                                              tag: valueOrDefault<String>(
                                                                                                widget.image != null && widget.image != '' ? widget.image : 'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
                                                                                                'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg' '$messagesIndex',
                                                                                              ),
                                                                                              transitionOnUserGestures: true,
                                                                                              child: Container(
                                                                                                width: 35.0,
                                                                                                height: 35.0,
                                                                                                clipBehavior: Clip.antiAlias,
                                                                                                decoration: const BoxDecoration(
                                                                                                  shape: BoxShape.circle,
                                                                                                ),
                                                                                                child: CachedNetworkImage(
                                                                                                  fadeInDuration: const Duration(milliseconds: 500),
                                                                                                  fadeOutDuration: const Duration(milliseconds: 500),
                                                                                                  imageUrl: valueOrDefault<String>(
                                                                                                    widget.image != null && widget.image != '' ? widget.image : 'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
                                                                                                    'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
                                                                                                  ),
                                                                                                  fit: BoxFit.cover,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Flexible(
                                                                                          child: Stack(
                                                                                            alignment: const AlignmentDirectional(-1.0, 1.0),
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                                                                                                child: InkWell(
                                                                                                  splashColor: Colors.transparent,
                                                                                                  focusColor: Colors.transparent,
                                                                                                  hoverColor: Colors.transparent,
                                                                                                  highlightColor: Colors.transparent,
                                                                                                  onLongPress: () async {
                                                                                                    _model.more = !(_model.more ?? true);
                                                                                                    _model.id = null;
                                                                                                    _model.love = true;
                                                                                                    _model.loveID = messagesMessageRow.id;
                                                                                                    _model.reportMessage = true;
                                                                                                    safeSetState(() {});
                                                                                                  },
                                                                                                  child: Container(
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: FlutterFlowTheme.of(context).editProfile,
                                                                                                      borderRadius: BorderRadius.circular(10.0),
                                                                                                    ),
                                                                                                    child: Padding(
                                                                                                      padding: const EdgeInsets.all(8.0),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.end,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: const EdgeInsets.all(5.0),
                                                                                                            child: Text(
                                                                                                              valueOrDefault<String>(
                                                                                                                messagesMessageRow.text,
                                                                                                                '.',
                                                                                                              ),
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: 'Inter',
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    fontSize: 15.5,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FontWeight.w500,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              if (messagesMessageRow.love != null && messagesMessageRow.love != '')
                                                                                                Padding(
                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(7.0, 0.0, 0.0, 0.0),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                    children: [
                                                                                                      Align(
                                                                                                        alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                        child: Container(
                                                                                                          width: 26.0,
                                                                                                          height: 26.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                                            shape: BoxShape.circle,
                                                                                                          ),
                                                                                                          alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                          child: Text(
                                                                                                            valueOrDefault<String>(
                                                                                                              messagesMessageRow.love,
                                                                                                              '👍',
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Inter',
                                                                                                                  fontSize: 18.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                ),
                                                                                                          ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation9']!),
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
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                      children: [
                                                                                        if ((_model.loveID == messagesMessageRow.id) && (_model.love == true))
                                                                                          Align(
                                                                                            alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                            child: Padding(
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(30.0, 10.0, 50.0, 0.0),
                                                                                              child: ClipRRect(
                                                                                                child: Container(
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                  ),
                                                                                                  child: Align(
                                                                                                    alignment: const AlignmentDirectional(1.0, 0.0),
                                                                                                    child: Padding(
                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                                                                                                      child: Material(
                                                                                                        color: Colors.transparent,
                                                                                                        elevation: 0.0,
                                                                                                        shape: RoundedRectangleBorder(
                                                                                                          borderRadius: BorderRadius.circular(50.0),
                                                                                                        ),
                                                                                                        child: Container(
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                                            borderRadius: BorderRadius.circular(50.0),
                                                                                                          ),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Builder(
                                                                                                                builder: (context) => InkWell(
                                                                                                                  splashColor: Colors.transparent,
                                                                                                                  focusColor: Colors.transparent,
                                                                                                                  hoverColor: Colors.transparent,
                                                                                                                  highlightColor: Colors.transparent,
                                                                                                                  onTap: () async {
                                                                                                                    await ReportMessageTable().insert({
                                                                                                                      'created_at': supaSerialize<DateTime>(getCurrentTimestamp),
                                                                                                                      'Reporter User': currentUserUid,
                                                                                                                      'Reported User': widget.userId,
                                                                                                                      'Message': messagesMessageRow.text,
                                                                                                                      'Checked': false,
                                                                                                                    });
                                                                                                                    _model.love = false;
                                                                                                                    _model.loveID = null;
                                                                                                                    safeSetState(() {});
                                                                                                                    await showDialog(
                                                                                                                      context: context,
                                                                                                                      builder: (dialogContext) {
                                                                                                                        return Dialog(
                                                                                                                          elevation: 0,
                                                                                                                          insetPadding: EdgeInsets.zero,
                                                                                                                          backgroundColor: Colors.transparent,
                                                                                                                          alignment: const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                                          child: GestureDetector(
                                                                                                                            onTap: () => FocusScope.of(dialogContext).unfocus(),
                                                                                                                            child: const SizedBox(
                                                                                                                              height: 300.0,
                                                                                                                              width: 300.0,
                                                                                                                              child: ReportDoneWidget(),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        );
                                                                                                                      },
                                                                                                                    );
                                                                                                                  },
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.min,
                                                                                                                    children: [
                                                                                                                      FlutterFlowIconButton(
                                                                                                                        borderRadius: 20.0,
                                                                                                                        buttonSize: 40.0,
                                                                                                                        fillColor: FlutterFlowTheme.of(context).editProfile,
                                                                                                                        icon: FaIcon(
                                                                                                                          FontAwesomeIcons.flag,
                                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                          size: 20.0,
                                                                                                                        ),
                                                                                                                        onPressed: () {
                                                                                                                          print('IconButton pressed ...');
                                                                                                                        },
                                                                                                                      ),
                                                                                                                      Padding(
                                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                                        child: Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'yhu5z6eq' /* Report */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                fontFamily: 'Inter',
                                                                                                                                letterSpacing: 0.0,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              Padding(
                                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 0.0, 0.0),
                                                                                                                child: InkWell(
                                                                                                                  splashColor: Colors.transparent,
                                                                                                                  focusColor: Colors.transparent,
                                                                                                                  hoverColor: Colors.transparent,
                                                                                                                  highlightColor: Colors.transparent,
                                                                                                                  onTap: () async {
                                                                                                                    await Clipboard.setData(ClipboardData(text: messagesMessageRow.text!));
                                                                                                                    _model.love = false;
                                                                                                                    _model.loveID = null;
                                                                                                                    safeSetState(() {});
                                                                                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                                                                                      SnackBar(
                                                                                                                        content: Text(
                                                                                                                          'Message Copied',
                                                                                                                          style: TextStyle(
                                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        duration: const Duration(milliseconds: 1000),
                                                                                                                        backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                                                      ),
                                                                                                                    );
                                                                                                                  },
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.min,
                                                                                                                    children: [
                                                                                                                      FlutterFlowIconButton(
                                                                                                                        borderColor: Colors.transparent,
                                                                                                                        borderRadius: 20.0,
                                                                                                                        buttonSize: 40.0,
                                                                                                                        fillColor: FlutterFlowTheme.of(context).editProfile,
                                                                                                                        icon: Icon(
                                                                                                                          Icons.content_copy_outlined,
                                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                          size: 20.0,
                                                                                                                        ),
                                                                                                                        onPressed: () {
                                                                                                                          print('IconButton pressed ...');
                                                                                                                        },
                                                                                                                      ),
                                                                                                                      Padding(
                                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                                        child: Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'giauzmew' /* Copy */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                fontFamily: 'Inter',
                                                                                                                                letterSpacing: 0.0,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation2']!),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                      ],
                                                                                    ),
                                                                                  ],
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
                                                            if (messagesMessageRow
                                                                    .user ==
                                                                currentUserUid)
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          45.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            45.0,
                                                                            10.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              100.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).editProfile,
                                                                            borderRadius:
                                                                                BorderRadius.circular(10.0),
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.min,
                                                                            children: [
                                                                              Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                                                                child: InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    await Clipboard.setData(ClipboardData(text: messagesMessageRow.text!));
                                                                                    _model.more = false;
                                                                                    _model.id = null;
                                                                                    safeSetState(() {});
                                                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                                                      SnackBar(
                                                                                        content: Text(
                                                                                          'Message Copied',
                                                                                          style: TextStyle(
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                          ),
                                                                                        ),
                                                                                        duration: const Duration(milliseconds: 4000),
                                                                                        backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 7.0, 0.0),
                                                                                        child: Icon(
                                                                                          Icons.content_copy,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                      ),
                                                                                      Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          '68qsmidz' /* Copy */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Inter',
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                                                                child: InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    await MessageTable().update(
                                                                                      data: {
                                                                                        'Delete': true,
                                                                                      },
                                                                                      matchingRows: (rows) => rows.eq(
                                                                                        'id',
                                                                                        _model.id,
                                                                                      ),
                                                                                    );
                                                                                    _model.more = false;
                                                                                    _model.id = null;
                                                                                    safeSetState(() {});
                                                                                  },
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 7.0, 0.0),
                                                                                        child: Icon(
                                                                                          Icons.delete_outline,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                      ),
                                                                                      Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'kbylux12' /* Delete */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Inter',
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.end,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Flexible(
                                                                            child:
                                                                                Stack(
                                                                              alignment: const AlignmentDirectional(1.0, 1.0),
                                                                              children: [
                                                                                if ((messagesMessageRow.id == _model.id) && (_model.more == true))
                                                                                  Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                                                                                    child: InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onLongPress: () async {
                                                                                        _model.more = true;
                                                                                        _model.id = messagesMessageRow.id;
                                                                                        _model.love = null;
                                                                                        _model.loveID = null;
                                                                                        safeSetState(() {});
                                                                                      },
                                                                                      child: Container(
                                                                                        decoration: BoxDecoration(
                                                                                          color: const Color(0xFFB2F5EF),
                                                                                          borderRadius: BorderRadius.circular(10.0),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: const EdgeInsets.all(8.0),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            crossAxisAlignment: CrossAxisAlignment.end,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: const EdgeInsets.all(5.0),
                                                                                                child: Text(
                                                                                                  valueOrDefault<String>(
                                                                                                    messagesMessageRow.text,
                                                                                                    '.',
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Inter',
                                                                                                        color: Colors.black,
                                                                                                        fontSize: 15.5,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                if (messagesMessageRow.love != null && messagesMessageRow.love != '')
                                                                                  Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 0.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                      children: [
                                                                                        Align(
                                                                                          alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                          child: Container(
                                                                                            width: 24.0,
                                                                                            height: 24.0,
                                                                                            decoration: const BoxDecoration(
                                                                                              color: Colors.white,
                                                                                              shape: BoxShape.circle,
                                                                                            ),
                                                                                            alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                            child: Text(
                                                                                              valueOrDefault<String>(
                                                                                                messagesMessageRow.love,
                                                                                                '👍',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Inter',
                                                                                                    fontSize: 16.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                  ),
                                                                                            ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation10']!),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                7.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                await Navigator.push(
                                                                                  context,
                                                                                  PageTransition(
                                                                                    type: PageTransitionType.fade,
                                                                                    child: FlutterFlowExpandedImageView(
                                                                                      image: CachedNetworkImage(
                                                                                        fadeInDuration: const Duration(milliseconds: 500),
                                                                                        fadeOutDuration: const Duration(milliseconds: 500),
                                                                                        imageUrl: valueOrDefault<String>(
                                                                                          pageMeUserRow?.profilePic != null && pageMeUserRow?.profilePic != '' ? pageMeUserRow?.profilePic : 'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
                                                                                          'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
                                                                                        ),
                                                                                        fit: BoxFit.contain,
                                                                                      ),
                                                                                      allowRotation: true,
                                                                                      tag: valueOrDefault<String>(
                                                                                        pageMeUserRow?.profilePic != null && pageMeUserRow?.profilePic != '' ? pageMeUserRow?.profilePic : 'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
                                                                                        'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg' '$messagesIndex',
                                                                                      ),
                                                                                      useHeroAnimation: true,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                              child: Hero(
                                                                                tag: valueOrDefault<String>(
                                                                                  pageMeUserRow?.profilePic != null && pageMeUserRow?.profilePic != '' ? pageMeUserRow?.profilePic : 'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
                                                                                  'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg' '$messagesIndex',
                                                                                ),
                                                                                transitionOnUserGestures: true,
                                                                                child: Container(
                                                                                  width: 35.0,
                                                                                  height: 35.0,
                                                                                  clipBehavior: Clip.antiAlias,
                                                                                  decoration: const BoxDecoration(
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: CachedNetworkImage(
                                                                                    fadeInDuration: const Duration(milliseconds: 500),
                                                                                    fadeOutDuration: const Duration(milliseconds: 500),
                                                                                    imageUrl: valueOrDefault<String>(
                                                                                      pageMeUserRow?.profilePic != null && pageMeUserRow?.profilePic != '' ? pageMeUserRow?.profilePic : 'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
                                                                                      'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
                                                                                    ),
                                                                                    fit: BoxFit.cover,
                                                                                  ),
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
                                                          ],
                                                        );
                                                      },
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Stack(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 0.0, 15.0, 24.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              child: BackdropFilter(
                                                filter: ImageFilter.blur(
                                                  sigmaX: 10.0,
                                                  sigmaY: 10.0,
                                                ),
                                                child: Visibility(
                                                  visible: !bodyUserRow!.blocked
                                                      .contains(currentUserUid),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .editProfile,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(6.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Stack(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        1.0,
                                                                        1.0),
                                                                children: [
                                                                  TextFormField(
                                                                    controller:
                                                                        _model
                                                                            .messageTextController,
                                                                    focusNode:
                                                                        _model
                                                                            .messageFocusNode,
                                                                    onChanged: (_) =>
                                                                        EasyDebounce
                                                                            .debounce(
                                                                      '_model.messageTextController',
                                                                      const Duration(
                                                                          milliseconds:
                                                                              1),
                                                                      () => safeSetState(
                                                                          () {}),
                                                                    ),
                                                                    onFieldSubmitted:
                                                                        (_) async {
                                                                      _model.message = _model
                                                                          .messageTextController
                                                                          .text;
                                                                      safeSetState(
                                                                          () {});
                                                                      _model.more =
                                                                          false;
                                                                      _model.id =
                                                                          null;
                                                                      _model.love =
                                                                          null;
                                                                      _model.loveID =
                                                                          null;
                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    autofocus:
                                                                        false,
                                                                    obscureText:
                                                                        false,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      labelStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      hintText:
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                        'jxtmnjad' /* Message... */,
                                                                      ),
                                                                      hintStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                15.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            const BorderSide(
                                                                          color:
                                                                              Color(0x00DADADA),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(0.0),
                                                                      ),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            const BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(0.0),
                                                                      ),
                                                                      errorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            const BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(0.0),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            const BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(0.0),
                                                                      ),
                                                                      contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          55.0,
                                                                          8.0),
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              15.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          lineHeight:
                                                                              1.5,
                                                                        ),
                                                                    maxLines: 5,
                                                                    minLines: 1,
                                                                    validator: _model
                                                                        .messageTextControllerValidator
                                                                        .asValidator(
                                                                            context),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        7.0,
                                                                        0.0),
                                                            child: FutureBuilder<
                                                                List<ChatRow>>(
                                                              future: ChatTable()
                                                                  .querySingleRow(
                                                                queryFn: (q) => q
                                                                    .eq(
                                                                      'Chat_ID',
                                                                      widget
                                                                          .chatID,
                                                                    )
                                                                    .contains(
                                                                      'Users',
                                                                      '{$currentUserUid}',
                                                                    ),
                                                              ),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          50.0,
                                                                      height:
                                                                          50.0,
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        valueColor:
                                                                            AlwaysStoppedAnimation<Color>(
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<ChatRow>
                                                                    yesChatRowList =
                                                                    snapshot
                                                                        .data!;

                                                                final yesChatRow =
                                                                    yesChatRowList
                                                                            .isNotEmpty
                                                                        ? yesChatRowList
                                                                            .first
                                                                        : null;

                                                                return InkWell(
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
                                                                    await MessageTable()
                                                                        .insert({
                                                                      'User':
                                                                          currentUserUid,
                                                                      'Text': _model
                                                                          .messageTextController
                                                                          .text,
                                                                      'Chat_ID':
                                                                          widget
                                                                              .chatID,
                                                                    });
                                                                    await ChatTable()
                                                                        .update(
                                                                      data: {
                                                                        'last_mesage_sent_time':
                                                                            supaSerialize<DateTime>(getCurrentTimestamp),
                                                                        'User':
                                                                            currentUserUid,
                                                                        'last_message': _model
                                                                            .messageTextController
                                                                            .text,
                                                                        'last_message_sent_by':
                                                                            currentUserUid,
                                                                        'user_a':
                                                                            currentUserUid,
                                                                        'user_b':
                                                                            widget.userId,
                                                                        'Mesage_seen':
                                                                            false,
                                                                        'Message Un':
                                                                            '',
                                                                      },
                                                                      matchingRows:
                                                                          (rows) =>
                                                                              rows.eq(
                                                                        'Chat_ID',
                                                                        widget
                                                                            .chatID,
                                                                      ),
                                                                    );
                                                                    _model.message =
                                                                        _model
                                                                            .messageTextController
                                                                            .text;
                                                                    safeSetState(
                                                                        () {});
                                                                    safeSetState(
                                                                        () {
                                                                      _model
                                                                          .messageTextController
                                                                          ?.clear();
                                                                    });
                                                                    if ((yesChatRow?.profile1 !=
                                                                                null &&
                                                                            yesChatRow?.profile1 !=
                                                                                '') ||
                                                                        (yesChatRow?.profile2 !=
                                                                                null &&
                                                                            yesChatRow?.profile2 !=
                                                                                '')) {
                                                                      await ChatTable()
                                                                          .update(
                                                                        data: {
                                                                          'Profile1': pageMeUserRow?.profilePic != null && pageMeUserRow?.profilePic != ''
                                                                              ? pageMeUserRow?.profilePic
                                                                              : 'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
                                                                          'Profile2': bodyUserRow.profilePic != null && bodyUserRow.profilePic != ''
                                                                              ? bodyUserRow.profilePic
                                                                              : 'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
                                                                          'Username1':
                                                                              pageMeUserRow?.username,
                                                                          'Username2':
                                                                              '',
                                                                        },
                                                                        matchingRows: (rows) => rows
                                                                            .eq(
                                                                              'Chat_ID',
                                                                              widget.chatID,
                                                                            )
                                                                            .contains(
                                                                              'Users',
                                                                              '{$currentUserUid}',
                                                                            ),
                                                                      );
                                                                    }
                                                                    safeSetState(() =>
                                                                        _model.requestCompleter2 =
                                                                            null);
                                                                    await _model
                                                                        .waitForRequestCompleted2();
                                                                    await NotificationnssCall
                                                                        .call(
                                                                      token: stackTokenAccessTokenRow
                                                                          ?.token,
                                                                      fcm: bodyUserRow
                                                                          .fcmToken,
                                                                      title: pageMeUserRow
                                                                          ?.username,
                                                                      body: _model
                                                                          .message,
                                                                    );
                                                                  },
                                                                  child: Icon(
                                                                    FFIcons
                                                                        .kplainSvgrepoCom2,
                                                                    color: valueOrDefault<
                                                                        Color>(
                                                                      _model.messageTextController.text !=
                                                                                  ''
                                                                          ? const Color(
                                                                              0xFFFF0000)
                                                                          : FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                    ),
                                                                    size: 24.0,
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
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
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
