import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'messages_model.dart';
export 'messages_model.dart';

class MessagesWidget extends StatefulWidget {
  const MessagesWidget({
    super.key,
    this.user,
  });

  final UserRow? user;

  @override
  State<MessagesWidget> createState() => _MessagesWidgetState();
}

class _MessagesWidgetState extends State<MessagesWidget> {
  late MessagesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MessagesModel());

    _model.messageTextController ??= TextEditingController();
    _model.messageFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<UserRow>>(
      future: UserTable().querySingleRow(
        queryFn: (q) => q.eq(
          'id',
          widget.user?.id,
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
        List<UserRow> containerUserRowList = snapshot.data!;

        final containerUserRow =
            containerUserRowList.isNotEmpty ? containerUserRowList.first : null;

        return Container(
          width: 350.0,
          height: 450.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primary,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: FutureBuilder<List<AccessTokenRow>>(
            future:
                (_model.requestCompleter ??= Completer<List<AccessTokenRow>>()
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
              List<AccessTokenRow> stackTokenAccessTokenRowList =
                  snapshot.data!;

              final stackTokenAccessTokenRow =
                  stackTokenAccessTokenRowList.isNotEmpty
                      ? stackTokenAccessTokenRowList.first
                      : null;

              return Stack(
                children: [
                  FutureBuilder<List<UserRow>>(
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
                      List<UserRow> columnMeUserRowList = snapshot.data!;

                      final columnMeUserRow = columnMeUserRowList.isNotEmpty
                          ? columnMeUserRowList.first
                          : null;

                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'b7on9534' /* Chat */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .override(
                                        fontFamily: 'PT Sans',
                                        color: const Color(0xFFFF0000),
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 30.0, 65.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Container(
                                        width: 100.0,
                                        height: 100.0,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFFFF0000),
                                          shape: BoxShape.circle,
                                        ),
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Container(
                                            width: 98.0,
                                            height: 98.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              shape: BoxShape.circle,
                                            ),
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Container(
                                              width: 90.0,
                                              height: 90.0,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.network(
                                                columnMeUserRow!.profilePic!,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    65.0, 30.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Container(
                                        width: 100.0,
                                        height: 100.0,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFFFF0000),
                                          shape: BoxShape.circle,
                                        ),
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Container(
                                            width: 98.0,
                                            height: 98.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              shape: BoxShape.circle,
                                            ),
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Container(
                                              width: 90.0,
                                              height: 90.0,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.network(
                                                containerUserRow!.profilePic!,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                15.0, 50.0, 15.0, 24.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 10.0,
                                  sigmaY: 10.0,
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).info,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 0.0, 0.0),
                                            child: Stack(
                                              alignment: const AlignmentDirectional(
                                                  1.0, 1.0),
                                              children: [
                                                TextFormField(
                                                  controller: _model
                                                      .messageTextController,
                                                  focusNode:
                                                      _model.messageFocusNode,
                                                  onChanged: (_) =>
                                                      EasyDebounce.debounce(
                                                    '_model.messageTextController',
                                                    const Duration(milliseconds: 1),
                                                    () => safeSetState(() {}),
                                                  ),
                                                  autofocus: false,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    hintText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      '5axr0uws' /* Message... */,
                                                    ),
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Color(0x00DADADA),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                    ),
                                                    contentPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 8.0,
                                                                55.0, 8.0),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        lineHeight: 1.5,
                                                      ),
                                                  maxLines: 5,
                                                  minLines: 1,
                                                  validator: _model
                                                      .messageTextControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 5.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              _model
                                                  .addToUsers(widget.user!.id);
                                              _model.myChats = columnMeUserRow
                                                  .chatsIds
                                                  .toList()
                                                  .cast<String>();
                                              _model.hisChat = containerUserRow
                                                  .chatsIds
                                                  .toList()
                                                  .cast<String>();
                                              _model.myChatNum =
                                                  columnMeUserRow.chatsNum;
                                              _model.hisChatNum =
                                                  containerUserRow.chatsNum;
                                              safeSetState(() {});
                                              _model.addToUsers(currentUserUid);
                                              _model.addToMyChats(
                                                  '$currentUserUid${widget.user?.id}');
                                              _model.addToHisChat(
                                                  '$currentUserUid${widget.user?.id}');
                                              _model.myChatNum =
                                                  _model.myChatNum! + 1;
                                              _model.hisChatNum =
                                                  _model.hisChatNum! + 1;
                                              safeSetState(() {});
                                              Navigator.pop(context);
                                              context.safePop();
                                              _model.doneee =
                                                  await ChatTable().insert({
                                                'User': currentUserUid,
                                                'last_message': _model
                                                    .messageTextController.text,
                                                'last_message_sent_by':
                                                    currentUserUid,
                                                'last_message_seen_by': '',
                                                'user_a': currentUserUid,
                                                'user_b': widget.user?.id,
                                                'user_chated': widget.user?.id,
                                                'Mesage_seen': false,
                                                'Chat_ID':
                                                    '$currentUserUid${widget.user?.id}',
                                                'Message_Num': 1,
                                                'Users': _model.users,
                                                'Users_Done': true,
                                                'last_mesage_sent_time':
                                                    supaSerialize<DateTime>(
                                                        getCurrentTimestamp),
                                                'Profile2': containerUserRow
                                                                .profilePic !=
                                                            null &&
                                                        containerUserRow
                                                                .profilePic !=
                                                            ''
                                                    ? containerUserRow
                                                        .profilePic
                                                    : (columnMeUserRow
                                                                .gender ==
                                                            'Lab (Rag)'
                                                        ? 'https://i.postimg.cc/xCRJyTsk/974c9c2446eb62327642dbea0f5f1502-1.jpg'
                                                        : 'https://i.postimg.cc/63Nb4zSW/95261256b08293c3b2d897a1f5cd9d13-1.jpg'),
                                                'Username1':
                                                    columnMeUserRow.username,
                                                'Username2':
                                                    containerUserRow.username,
                                                'Profile1': columnMeUserRow
                                                                .profilePic !=
                                                            null &&
                                                        columnMeUserRow
                                                                .profilePic !=
                                                            ''
                                                    ? columnMeUserRow
                                                        .profilePic
                                                    : (columnMeUserRow
                                                                .gender ==
                                                            'Lab (Rag)'
                                                        ? 'https://i.postimg.cc/xCRJyTsk/974c9c2446eb62327642dbea0f5f1502-1.jpg'
                                                        : 'https://i.postimg.cc/63Nb4zSW/95261256b08293c3b2d897a1f5cd9d13-1.jpg'),
                                              });
                                              await MessageTable().insert({
                                                'User': currentUserUid,
                                                'Text': _model
                                                    .messageTextController.text,
                                                'Chat_ID':
                                                    _model.doneee?.chatID,
                                              });
                                              await UserTable().update(
                                                data: {
                                                  'Chats_Num': _model.myChatNum,
                                                  'Chats_ids': _model.myChats,
                                                },
                                                matchingRows: (rows) => rows.eq(
                                                  'id',
                                                  currentUserUid,
                                                ),
                                              );
                                              await UserTable().update(
                                                data: {
                                                  'Chats_Num':
                                                      _model.hisChatNum,
                                                  'Chats_ids': _model.hisChat,
                                                },
                                                matchingRows: (rows) => rows.eq(
                                                  'id',
                                                  widget.user?.id,
                                                ),
                                              );
                                              safeSetState(() => _model
                                                  .requestCompleter = null);
                                              await _model
                                                  .waitForRequestCompleted();
                                              await NotificationnssCall.call(
                                                token: stackTokenAccessTokenRow
                                                    ?.token,
                                                fcm: containerUserRow.fcmToken,
                                                title:
                                                    columnMeUserRow.username,
                                                body: _model
                                                    .messageTextController.text,
                                              );

                                              _model.accessToken = await actions
                                                  .getAccessToken();
                                              await AccessTokenTable().update(
                                                data: {
                                                  'Token': _model.accessToken,
                                                },
                                                matchingRows: (rows) => rows.eq(
                                                  'id',
                                                  1,
                                                ),
                                              );

                                              safeSetState(() {});
                                            },
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'f8s0ay9e' /* Send */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            const Color(0xFF6B0BF8),
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
