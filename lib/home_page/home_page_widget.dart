import '/auth/firebase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<UserRow>>(
      future: (_model.requestCompleter2 ??= Completer<List<UserRow>>()
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
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
        List<UserRow> homePageUserRowList = snapshot.data!;

        final homePageUserRow =
            homePageUserRowList.isNotEmpty ? homePageUserRowList.first : null;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              title: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed(
                    'ChatPage',
                    extra: <String, dynamic>{
                      kTransitionInfoKey: const TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 0),
                      ),
                    },
                  );
                },
                child: Text(
                  'Home',
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
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: FutureBuilder<List<UserRow>>(
                  future:
                      (_model.requestCompleter1 ??= Completer<List<UserRow>>()
                            ..complete(UserTable().queryRows(
                              queryFn: (q) => q
                                  .eq(
                                    'Gender',
                                    homePageUserRow?.lookingFor,
                                  )
                                  .eq(
                                    'Deleted',
                                    false,
                                  )
                                  .neq(
                                    'id',
                                    currentUserUid,
                                  )
                                  .eq(
                                    'Deactivate',
                                    false,
                                  )
                                  .eq(
                                    'Account Ban',
                                    false,
                                  )
                                  .order('Online'),
                              limit: 600,
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
                    List<UserRow> gridViewNoUserRowList = snapshot.data!;

                    return RefreshIndicator(
                      onRefresh: () async {
                        safeSetState(() => _model.requestCompleter1 = null);
                        safeSetState(() => _model.requestCompleter2 = null);
                      },
                      child: GridView.builder(
                        padding: const EdgeInsets.fromLTRB(
                          0,
                          3.0,
                          0,
                          0,
                        ),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 25.0,
                          childAspectRatio: 1.0,
                        ),
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: gridViewNoUserRowList.length,
                        itemBuilder: (context, gridViewNoIndex) {
                          final gridViewNoUserRow =
                              gridViewNoUserRowList[gridViewNoIndex];
                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                'User_Profile',
                                queryParameters: {
                                  'userID': serializeParam(
                                    gridViewNoUserRow.id,
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: const TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Stack(
                                    alignment: const AlignmentDirectional(0.75, 0.9),
                                    children: [
                                      Hero(
                                        tag: gridViewNoUserRow.profilePic !=
                                                    null &&
                                                gridViewNoUserRow.profilePic !=
                                                    ''
                                            ? gridViewNoUserRow.profilePic!
                                            : 'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
                                        transitionOnUserGestures: true,
                                        child: Container(
                                          width: 70.0,
                                          height: 70.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: CachedNetworkImage(
                                            fadeInDuration:
                                                const Duration(milliseconds: 500),
                                            fadeOutDuration:
                                                const Duration(milliseconds: 500),
                                            imageUrl: gridViewNoUserRow
                                                            .profilePic !=
                                                        null &&
                                                    gridViewNoUserRow
                                                            .profilePic !=
                                                        ''
                                                ? gridViewNoUserRow.profilePic!
                                                : 'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      if (gridViewNoUserRow.online ==
                                          getCurrentTimestamp)
                                        Container(
                                          width: 10.0,
                                          height: 10.0,
                                          decoration: const BoxDecoration(
                                            color: Color(0xFF00FF5E),
                                            shape: BoxShape.circle,
                                          ),
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                        ),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              gridViewNoUserRow.username,
                                              'User',
                                            ).maybeHandleOverflow(maxChars: 11),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 11.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          if (!gridViewNoUserRow.vipProfilee! &&
                                              gridViewNoUserRow.verify! &&
                                              !gridViewNoUserRow.tick)
                                            const Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(3.0, 0.0, 0.0, 0.0),
                                              child: Icon(
                                                Icons.verified,
                                                color: Color(0xFFB305F9),
                                                size: 14.0,
                                              ),
                                            ),
                                          if (gridViewNoUserRow.vipProfilee! &&
                                              !gridViewNoUserRow.verify! &&
                                              !gridViewNoUserRow.tick)
                                            const Icon(
                                              Icons.verified,
                                              color: Color(0xFF189EFF),
                                              size: 14.0,
                                            ),
                                          if (!gridViewNoUserRow.vipProfilee! &&
                                              !gridViewNoUserRow.verify! &&
                                              gridViewNoUserRow.tick)
                                            const Icon(
                                              Icons.verified,
                                              color: Color(0xFF189EFF),
                                              size: 14.0,
                                            ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 1.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              gridViewNoUserRow.country,
                                              'Somalia',
                                            ).maybeHandleOverflow(maxChars: 12),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 10.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    3.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                gridViewNoUserRow.age,
                                                '18',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontSize: 11.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
