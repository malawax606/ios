import '/auth/firebase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'chat_test_model.dart';
export 'chat_test_model.dart';

class ChatTestWidget extends StatefulWidget {
  /// Create Security page for dating app add eveything that dating app needs
  /// and social media app need for security user to change
  const ChatTestWidget({super.key});

  @override
  State<ChatTestWidget> createState() => _ChatTestWidgetState();
}

class _ChatTestWidgetState extends State<ChatTestWidget> {
  late ChatTestModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatTestModel());

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
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              _model.getToken = await actions.getAccessToken();
              await Clipboard.setData(ClipboardData(text: _model.getToken!));

              safeSetState(() {});
            },
            child: Text(
              'Chat',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Inter Tight',
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontSize: 22.0,
                    letterSpacing: 0.0,
                  ),
            ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: FutureBuilder<List<ChatRow>>(
            future: FFAppState().hh(
              requestFn: () => ChatTable().queryRows(
                queryFn: (q) => q
                    .contains(
                      'Users',
                      '{$currentUserUid}',
                    )
                    .order('last_mesage_sent_time'),
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
              List<ChatRow> listViewChatRowList = snapshot.data!;

              return ListView.separated(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: listViewChatRowList.length,
                separatorBuilder: (_, __) => const SizedBox(height: 5.0),
                itemBuilder: (context, listViewIndex) {
                  final listViewChatRow = listViewChatRowList[listViewIndex];
                  return Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(10.0, 15.0, 10.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FutureBuilder<List<UserRow>>(
                          future: UserTable().querySingleRow(
                            queryFn: (q) => q.eq(
                              'id',
                              listViewChatRow.userA == currentUserUid
                                  ? listViewChatRow.userB
                                  : listViewChatRow.userA,
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
                            List<UserRow> rowUserUserRowList = snapshot.data!;

                            final rowUserUserRow = rowUserUserRowList.isNotEmpty
                                ? rowUserUserRowList.first
                                : null;

                            return Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Stack(
                                      alignment:
                                          const AlignmentDirectional(1.0, -1.0),
                                      children: [
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
                                                child:
                                                    FlutterFlowExpandedImageView(
                                                  image: CachedNetworkImage(
                                                    fadeInDuration: const Duration(
                                                        milliseconds: 500),
                                                    fadeOutDuration: const Duration(
                                                        milliseconds: 500),
                                                    imageUrl:
                                                        valueOrDefault<String>(
                                                      rowUserUserRow?.profilePic !=
                                                                  null &&
                                                              rowUserUserRow
                                                                      ?.profilePic !=
                                                                  ''
                                                          ? rowUserUserRow
                                                              ?.profilePic
                                                          : 'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
                                                      'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
                                                    ),
                                                    fit: BoxFit.contain,
                                                  ),
                                                  allowRotation: true,
                                                  tag: valueOrDefault<String>(
                                                    rowUserUserRow?.profilePic !=
                                                                null &&
                                                            rowUserUserRow
                                                                    ?.profilePic !=
                                                                ''
                                                        ? rowUserUserRow
                                                            ?.profilePic
                                                        : 'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
                                                    'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg' '$listViewIndex',
                                                  ),
                                                  useHeroAnimation: true,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Hero(
                                            tag: valueOrDefault<String>(
                                              rowUserUserRow?.profilePic !=
                                                          null &&
                                                      rowUserUserRow
                                                              ?.profilePic !=
                                                          ''
                                                  ? rowUserUserRow?.profilePic
                                                  : 'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
                                              'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg' '$listViewIndex',
                                            ),
                                            transitionOnUserGestures: true,
                                            child: Container(
                                              width: 55.0,
                                              height: 55.0,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: CachedNetworkImage(
                                                fadeInDuration:
                                                    const Duration(milliseconds: 500),
                                                fadeOutDuration:
                                                    const Duration(milliseconds: 500),
                                                imageUrl:
                                                    valueOrDefault<String>(
                                                  rowUserUserRow?.profilePic !=
                                                              null &&
                                                          rowUserUserRow
                                                                  ?.profilePic !=
                                                              ''
                                                      ? rowUserUserRow
                                                          ?.profilePic
                                                      : 'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
                                                  'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        if ((listViewChatRow
                                                    .lastMessageSentBy !=
                                                currentUserUid) &&
                                            (listViewChatRow.mesageSeen ==
                                                false))
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 0.0),
                                              child: Container(
                                                width: 12.0,
                                                height: 12.0,
                                                decoration: const BoxDecoration(
                                                  color: Color(0xFFF80606),
                                                  shape: BoxShape.circle,
                                                ),
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'Message',
                                          queryParameters: {
                                            'chatID': serializeParam(
                                              listViewChatRow.chatID,
                                              ParamType.String,
                                            ),
                                            'userId': serializeParam(
                                              rowUserUserRow?.id,
                                              ParamType.String,
                                            ),
                                            'image': serializeParam(
                                              rowUserUserRow?.profilePic,
                                              ParamType.String,
                                            ),
                                            'gender': serializeParam(
                                              rowUserUserRow?.gender,
                                              ParamType.String,
                                            ),
                                            'sender': serializeParam(
                                              listViewChatRow.lastMessageSentBy,
                                              ParamType.String,
                                            ),
                                            'messageNum': serializeParam(
                                              listViewChatRow.messageNum,
                                              ParamType.int,
                                            ),
                                            'username': serializeParam(
                                              rowUserUserRow?.username,
                                              ParamType.String,
                                            ),
                                            'fullName': serializeParam(
                                              rowUserUserRow?.fullName,
                                              ParamType.String,
                                            ),
                                            'uSERID': serializeParam(
                                              rowUserUserRow?.userId
                                                  ?.toString(),
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );

                                        _model.token4 =
                                            await actions.getAccessToken();
                                        await AccessTokenTable().update(
                                          data: {
                                            'Token': _model.token4,
                                          },
                                          matchingRows: (rows) => rows.eq(
                                            'id',
                                            1,
                                          ),
                                        );

                                        safeSetState(() {});
                                      },
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        7.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    rowUserUserRow?.username,
                                                    'User',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              if (rowUserUserRow?.vipProfilee ??
                                                  true)
                                                const Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          3.0, 0.0, 0.0, 0.0),
                                                  child: Icon(
                                                    Icons.verified_sharp,
                                                    color: Color(0xFF0992F9),
                                                    size: 15.0,
                                                  ),
                                                ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              if ((listViewChatRow.mesageSeen ==
                                                      true) &&
                                                  (listViewChatRow
                                                          .lastMessageSentBy ==
                                                      currentUserUid))
                                                const Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          7.0, 0.0, 0.0, 0.0),
                                                  child: Icon(
                                                    Icons.done_all_rounded,
                                                    color: Color(0xFF1975FB),
                                                    size: 18.0,
                                                  ),
                                                ),
                                              if ((listViewChatRow.mesageSeen ==
                                                      false) &&
                                                  (listViewChatRow
                                                          .lastMessageSentBy ==
                                                      currentUserUid))
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          7.0, 0.0, 0.0, 0.0),
                                                  child: Icon(
                                                    Icons.done_all_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 18.0,
                                                  ),
                                                ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        7.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    listViewChatRow.lastMessage,
                                                    '.',
                                                  ).maybeHandleOverflow(
                                                    maxChars: 26,
                                                    replacement: '…',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  7.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            dateTimeFormat(
                                                "relative",
                                                listViewChatRow
                                                    .lastMesageSentTime),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
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
        ),
      ),
    );
  }
}
