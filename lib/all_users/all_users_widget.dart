import '/auth/firebase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'all_users_model.dart';
export 'all_users_model.dart';

class AllUsersWidget extends StatefulWidget {
  const AllUsersWidget({super.key});

  @override
  State<AllUsersWidget> createState() => _AllUsersWidgetState();
}

class _AllUsersWidgetState extends State<AllUsersWidget> {
  late AllUsersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllUsersModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<UserRow>>(
      future: UserTable().querySingleRow(
        queryFn: (q) => q.eq(
          'id',
          currentUserUid,
        ),
      ),
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
        List<UserRow> allUsersUserRowList = snapshot.data!;

        final allUsersUserRow =
            allUsersUserRowList.isNotEmpty ? allUsersUserRowList.first : null;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
              title: Text(
                'Page Title',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Inter Tight',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 22.0,
                      letterSpacing: 0.0,
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
                  future: UserTable().queryRows(
                    queryFn: (q) => q
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
                        .eq(
                          'No Profile',
                          false,
                        )
                        .order('Online'),
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
                    List<UserRow> gridViewNoUserRowList = snapshot.data!;

                    return RefreshIndicator(
                      onRefresh: () async {},
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
                              await UserTable().update(
                                data: {
                                  'No Profile': true,
                                },
                                matchingRows: (rows) => rows.eq(
                                  'id',
                                  gridViewNoUserRow.id,
                                ),
                              );
                              await UserNoProfileTable().insert({
                                'UserID': gridViewNoUserRow.id,
                                'Profile': gridViewNoUserRow.profilePic,
                                'Username': gridViewNoUserRow.username,
                                'Country': gridViewNoUserRow.country,
                                'Gender': gridViewNoUserRow.gender,
                              });
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
                                            : (gridViewNoUserRow.gender ==
                                                    'Lab (Rag)'
                                                ? 'https://i.postimg.cc/xCRJyTsk/974c9c2446eb62327642dbea0f5f1502-1.jpg'
                                                : 'https://i.postimg.cc/63Nb4zSW/95261256b08293c3b2d897a1f5cd9d13-1.jpg'),
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
                                                : (gridViewNoUserRow.gender ==
                                                        'Lab (Rag)'
                                                    ? 'https://i.postimg.cc/xCRJyTsk/974c9c2446eb62327642dbea0f5f1502-1.jpg'
                                                    : 'https://i.postimg.cc/63Nb4zSW/95261256b08293c3b2d897a1f5cd9d13-1.jpg'),
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
