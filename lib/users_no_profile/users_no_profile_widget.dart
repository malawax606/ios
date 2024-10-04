import '/auth/firebase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'users_no_profile_model.dart';
export 'users_no_profile_model.dart';

class UsersNoProfileWidget extends StatefulWidget {
  const UsersNoProfileWidget({super.key});

  @override
  State<UsersNoProfileWidget> createState() => _UsersNoProfileWidgetState();
}

class _UsersNoProfileWidgetState extends State<UsersNoProfileWidget> {
  late UsersNoProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UsersNoProfileModel());

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
        List<UserRow> usersNoProfileUserRowList = snapshot.data!;

        final usersNoProfileUserRow = usersNoProfileUserRowList.isNotEmpty
            ? usersNoProfileUserRowList.first
            : null;

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
                'No Profiles',
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
                child: FutureBuilder<List<UserNoProfileRow>>(
                  future: UserNoProfileTable().queryRows(
                    queryFn: (q) => q,
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
                    List<UserNoProfileRow> gridViewNoUserNoProfileRowList =
                        snapshot.data!;

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
                        itemCount: gridViewNoUserNoProfileRowList.length,
                        itemBuilder: (context, gridViewNoIndex) {
                          final gridViewNoUserNoProfileRow =
                              gridViewNoUserNoProfileRowList[gridViewNoIndex];
                          return Column(
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
                                      tag: gridViewNoUserNoProfileRow.profile !=
                                                  null &&
                                              gridViewNoUserNoProfileRow
                                                      .profile !=
                                                  ''
                                          ? gridViewNoUserNoProfileRow.profile!
                                          : (gridViewNoUserNoProfileRow
                                                      .gender ==
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
                                          imageUrl: gridViewNoUserNoProfileRow
                                                          .profile !=
                                                      null &&
                                                  gridViewNoUserNoProfileRow
                                                          .profile !=
                                                      ''
                                              ? gridViewNoUserNoProfileRow
                                                  .profile!
                                              : (gridViewNoUserNoProfileRow
                                                          .gender ==
                                                      'Lab (Rag)'
                                                  ? 'https://i.postimg.cc/xCRJyTsk/974c9c2446eb62327642dbea0f5f1502-1.jpg'
                                                  : 'https://i.postimg.cc/63Nb4zSW/95261256b08293c3b2d897a1f5cd9d13-1.jpg'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
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
                                            gridViewNoUserNoProfileRow.username,
                                            'User',
                                          ).maybeHandleOverflow(maxChars: 11),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 11.0,
                                                letterSpacing: 0.0,
                                              ),
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
                                            gridViewNoUserNoProfileRow.country,
                                            'Somalia',
                                          ).maybeHandleOverflow(maxChars: 12),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 10.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w300,
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
