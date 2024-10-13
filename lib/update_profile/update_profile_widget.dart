import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'update_profile_model.dart';
export 'update_profile_model.dart';

class UpdateProfileWidget extends StatefulWidget {
  /// Create form for dating with profile, username,full name,age to select 17
  /// to 60,gender to select male or femel, and bio
  const UpdateProfileWidget({super.key});

  @override
  State<UpdateProfileWidget> createState() => _UpdateProfileWidgetState();
}

class _UpdateProfileWidgetState extends State<UpdateProfileWidget> {
  late UpdateProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UpdateProfileModel());

    _model.usernameFocusNode ??= FocusNode();
    _model.usernameFocusNode!.addListener(() => safeSetState(() {}));

    _model.countryFocusNode ??= FocusNode();
    _model.countryFocusNode!.addListener(() => safeSetState(() {}));

    _model.fullNameFocusNode ??= FocusNode();

    _model.aboutmeFocusNode ??= FocusNode();

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
        List<UserRow> updateProfileUserRowList = snapshot.data!;

        final updateProfileUserRow = updateProfileUserRowList.isNotEmpty
            ? updateProfileUserRowList.first
            : null;

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
                icon: const Icon(
                  FFIcons.kaltArrowLeftSvgrepoCom,
                  color: Color(0xFFB4BBB8),
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: Text(
                FFLocalizations.of(context).getText(
                  'xgycr8ym' /* Update Profile */,
                ),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Inter Tight',
                      color: const Color(0xFFB4BBB8),
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
              child: ListView(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, -1.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Form(
                                  key: _model.formKey,
                                  autovalidateMode: AutovalidateMode.disabled,
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 14.0, 0.0, 24.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 7.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'sulsr8n0' /* SELECT PICTURE */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelSmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 10.0,
                                                          letterSpacing: 1.0,
                                                        ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 1.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      _model.url =
                                                          updateProfileUserRow
                                                              .profilePic;
                                                      safeSetState(() {});
                                                      final selectedMedia =
                                                          await selectMedia(
                                                        storageFolderPath:
                                                            'Profile',
                                                        mediaSource: MediaSource
                                                            .photoGallery,
                                                        multiImage: false,
                                                      );
                                                      if (selectedMedia !=
                                                              null &&
                                                          selectedMedia.every((m) =>
                                                              validateFileFormat(
                                                                  m.storagePath,
                                                                  context))) {
                                                        safeSetState(() => _model
                                                                .isDataUploading =
                                                            true);
                                                        var selectedUploadedFiles =
                                                            <FFUploadedFile>[];

                                                        var downloadUrls =
                                                            <String>[];
                                                        try {
                                                          showUploadMessage(
                                                            context,
                                                            'Uploading file...',
                                                            showLoading: true,
                                                          );
                                                          selectedUploadedFiles =
                                                              selectedMedia
                                                                  .map((m) =>
                                                                      FFUploadedFile(
                                                                        name: m
                                                                            .storagePath
                                                                            .split('/')
                                                                            .last,
                                                                        bytes: m
                                                                            .bytes,
                                                                        height: m
                                                                            .dimensions
                                                                            ?.height,
                                                                        width: m
                                                                            .dimensions
                                                                            ?.width,
                                                                        blurHash:
                                                                            m.blurHash,
                                                                      ))
                                                                  .toList();

                                                          downloadUrls =
                                                              await uploadSupabaseStorageFiles(
                                                            bucketName:
                                                                'images',
                                                            selectedFiles:
                                                                selectedMedia,
                                                          );
                                                        } finally {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .hideCurrentSnackBar();
                                                          _model.isDataUploading =
                                                              false;
                                                        }
                                                        if (selectedUploadedFiles
                                                                    .length ==
                                                                selectedMedia
                                                                    .length &&
                                                            downloadUrls
                                                                    .length ==
                                                                selectedMedia
                                                                    .length) {
                                                          safeSetState(() {
                                                            _model.uploadedLocalFile =
                                                                selectedUploadedFiles
                                                                    .first;
                                                            _model.uploadedFileUrl =
                                                                downloadUrls
                                                                    .first;
                                                          });
                                                          showUploadMessage(
                                                              context,
                                                              'Success!');
                                                        } else {
                                                          safeSetState(() {});
                                                          showUploadMessage(
                                                              context,
                                                              'Failed to upload data');
                                                          return;
                                                        }
                                                      }

                                                      await ChatTable().update(
                                                        data: {
                                                          'Profile1': _model
                                                              .uploadedFileUrl,
                                                        },
                                                        matchingRows: (rows) =>
                                                            rows.eq(
                                                          'Profile1',
                                                          updateProfileUserRow
                                                              .profilePic,
                                                        ),
                                                      );
                                                      await ChatTable().update(
                                                        data: {
                                                          'Profile2': _model
                                                              .uploadedFileUrl,
                                                        },
                                                        matchingRows: (rows) =>
                                                            rows.eq(
                                                          'Profile2',
                                                          updateProfileUserRow
                                                              .profilePic,
                                                        ),
                                                      );
                                                      await UserTable().update(
                                                        data: {
                                                          'Profile_Pic': _model
                                                              .uploadedFileUrl,
                                                        },
                                                        matchingRows: (rows) =>
                                                            rows.eq(
                                                          'id',
                                                          currentUserUid,
                                                        ),
                                                      );
                                                      await deleteSupabaseFileFromPublicUrl(
                                                          _model.url!);
                                                      FFAppState().Profile =
                                                          _model
                                                              .uploadedFileUrl;
                                                      safeSetState(() {});
                                                    },
                                                    child: Container(
                                                      width: 120.0,
                                                      height: 120.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .editProfile,
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image:
                                                              CachedNetworkImageProvider(
                                                            updateProfileUserRow!
                                                                .profilePic!,
                                                          ),
                                                        ),
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Visibility(
                                                        visible: !((updateProfileUserRow
                                                                        .profilePic ==
                                                                    null ||
                                                                updateProfileUserRow
                                                                        .profilePic ==
                                                                    '') ||
                                                            (_model.uploadedFileUrl ==
                                                                    '')),
                                                        child: Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Icon(
                                                            Icons
                                                                .upload_outlined,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 36.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ].divide(const SizedBox(width: 24.0)),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 12.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: SizedBox(
                                                  width: 100.0,
                                                  child: TextFormField(
                                                    controller: _model
                                                            .usernameTextController ??=
                                                        TextEditingController(
                                                      text: updateProfileUserRow
                                                          .username,
                                                    ),
                                                    focusNode: _model
                                                        .usernameFocusNode,
                                                    autofocus: false,
                                                    autofillHints: const [
                                                      AutofillHints.givenName
                                                    ],
                                                    textCapitalization:
                                                        TextCapitalization
                                                            .words,
                                                    textInputAction:
                                                        TextInputAction.next,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      hintText:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        'wavxj8wu' /* Username... */,
                                                      ),
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .editProfile,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .editProfile,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      filled: true,
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .editProfile,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    maxLength: 10,
                                                    maxLengthEnforcement:
                                                        MaxLengthEnforcement
                                                            .enforced,
                                                    buildCounter: (context,
                                                            {required currentLength,
                                                            required isFocused,
                                                            maxLength}) =>
                                                        null,
                                                    cursorColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    validator: _model
                                                        .usernameTextControllerValidator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: SizedBox(
                                                  width: 100.0,
                                                  child: TextFormField(
                                                    controller: _model
                                                            .countryTextController ??=
                                                        TextEditingController(
                                                      text: updateProfileUserRow
                                                          .country,
                                                    ),
                                                    focusNode:
                                                        _model.countryFocusNode,
                                                    autofocus: false,
                                                    autofillHints: const [
                                                      AutofillHints.familyName
                                                    ],
                                                    textCapitalization:
                                                        TextCapitalization
                                                            .words,
                                                    textInputAction:
                                                        TextInputAction.done,
                                                    readOnly: true,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      hintText:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        '1suc30wh' /* Country */,
                                                      ),
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .editProfile,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .editProfile,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      filled: true,
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .editProfile,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    cursorColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    validator: _model
                                                        .countryTextControllerValidator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                              ),
                                            ].divide(const SizedBox(width: 12.0)),
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: double.infinity,
                                              child: TextFormField(
                                                controller: _model
                                                        .fullNameTextController ??=
                                                    TextEditingController(
                                                  text: updateProfileUserRow
                                                      .fullName,
                                                ),
                                                focusNode:
                                                    _model.fullNameFocusNode,
                                                onChanged: (_) =>
                                                    EasyDebounce.debounce(
                                                  '_model.fullNameTextController',
                                                  const Duration(milliseconds: 400),
                                                  () => safeSetState(() {}),
                                                ),
                                                autofocus: false,
                                                textCapitalization:
                                                    TextCapitalization.none,
                                                textInputAction:
                                                    TextInputAction.next,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  hintText: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'inzjodpa' /* Full Name */,
                                                  ),
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .editProfile,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .editProfile,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  filled: true,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .editProfile,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                                maxLength: 25,
                                                maxLengthEnforcement:
                                                    MaxLengthEnforcement
                                                        .enforced,
                                                buildCounter: (context,
                                                        {required currentLength,
                                                        required isFocused,
                                                        maxLength}) =>
                                                    null,
                                                cursorColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                validator: _model
                                                    .fullNameTextControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ].divide(const SizedBox(height: 12.0)),
                                        ),
                                        Material(
                                          color: Colors.transparent,
                                          elevation: 0.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child:
                                                  FlutterFlowDropDown<String>(
                                                controller: _model
                                                        .ageValueController ??=
                                                    FormFieldController<String>(
                                                  _model.ageValue ??=
                                                      updateProfileUserRow.age,
                                                ),
                                                options: [
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '2ahu2wai' /* 16 */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'o51nibld' /* 17 */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'j61eplvr' /* 18 */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '7bi4mzaa' /* 19 */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'fc6co4hq' /* 20 */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '6coz2j2e' /* 21 */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '7f04cw9i' /* 22 */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'rei9t5qk' /* 23 */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'nl4f2e6h' /* 24 */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'ru1xbo6j' /* 25 */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'y2f1uzs2' /* 26 */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '1d2hzhpe' /* 27 */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '5357cmkx' /* 28 */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '04w3xffh' /* 29 */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '5iba19y6' /* 30 */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '7krue2d9' /* 31 */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'liozick2' /* 32 */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '4kvu5337' /* 33 */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'mg4hcocd' /* 34 */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'ji7qsa4u' /* 35 */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    's493iz2h' /* 36 */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'njsv8ow3' /* 37 */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'odb2yu2k' /* 38 */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'shdeftag' /* 39 */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'jrold8t1' /* 40 */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'in4fa0rw' /* 41 */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'prmpthpc' /* 42 */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'y9fk0bbm' /* 43 */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'qroca1bv' /* 44 */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'gudr79bd' /* 45 */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '4vzuxtus' /* 46 */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'e65ig8yd' /* 47 */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'hd0hrcdb' /* 48 */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'sxhfiplw' /* 49 */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'nbjqee8f' /* 50 */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'qkqbn9xk' /* 51 */,
                                                  )
                                                ],
                                                onChanged: (val) =>
                                                    safeSetState(() =>
                                                        _model.ageValue = val),
                                                width: double.infinity,
                                                height: 50.0,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                hintText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '1wvw1fej' /* Age */,
                                                ),
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .editProfile,
                                                elevation: 2.0,
                                                borderColor: Colors.transparent,
                                                borderWidth: 0.0,
                                                borderRadius: 10.0,
                                                margin: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 4.0, 12.0, 4.0),
                                                hidesUnderline: true,
                                                isSearchable: false,
                                                isMultiSelect: false,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Material(
                                          color: Colors.transparent,
                                          elevation: 0.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child:
                                                  FlutterFlowDropDown<String>(
                                                controller: _model
                                                        .genderValueController ??=
                                                    FormFieldController<String>(
                                                  _model.genderValue ??=
                                                      updateProfileUserRow
                                                          .gender,
                                                ),
                                                options: [
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'uqw5ayq8' /* Lab (Rag) */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    't9j8lzqe' /* Dheddig (Dumar) */,
                                                  )
                                                ],
                                                onChanged: (val) async {
                                                  safeSetState(() =>
                                                      _model.genderValue = val);
                                                  if (_model.genderValue ==
                                                      'Lab (Rag)') {
                                                    await UserTable().update(
                                                      data: {
                                                        'Gender':
                                                            _model.genderValue,
                                                        'LookingFor':
                                                            'Dheddig (Dumar)',
                                                      },
                                                      matchingRows: (rows) =>
                                                          rows.eq(
                                                        'id',
                                                        currentUserUid,
                                                      ),
                                                    );
                                                  } else {
                                                    await UserTable().update(
                                                      data: {
                                                        'Gender':
                                                            _model.genderValue,
                                                        'LookingFor':
                                                            'Lab (Rag)',
                                                      },
                                                      matchingRows: (rows) =>
                                                          rows.eq(
                                                        'id',
                                                        currentUserUid,
                                                      ),
                                                    );
                                                  }
                                                },
                                                width: double.infinity,
                                                height: 50.0,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                hintText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  's4slxrjd' /* Gender */,
                                                ),
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .editProfile,
                                                elevation: 2.0,
                                                borderColor: Colors.transparent,
                                                borderWidth: 0.0,
                                                borderRadius: 10.0,
                                                margin: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 4.0, 12.0, 4.0),
                                                hidesUnderline: true,
                                                isSearchable: false,
                                                isMultiSelect: false,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Material(
                                          color: Colors.transparent,
                                          elevation: 0.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child:
                                                  FlutterFlowDropDown<String>(
                                                controller: _model
                                                        .jobValueController ??=
                                                    FormFieldController<String>(
                                                  _model.jobValue ??=
                                                      updateProfileUserRow.job,
                                                ),
                                                options: [
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'ew0seqv5' /* Wan shaqeya */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '335xmxzb' /* Mashaqeyi */,
                                                  )
                                                ],
                                                onChanged: (val) =>
                                                    safeSetState(() =>
                                                        _model.jobValue = val),
                                                width: double.infinity,
                                                height: 50.0,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                hintText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'bcwbknbp' /* Job */,
                                                ),
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .editProfile,
                                                elevation: 2.0,
                                                borderColor: Colors.transparent,
                                                borderWidth: 0.0,
                                                borderRadius: 10.0,
                                                margin: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 4.0, 12.0, 4.0),
                                                hidesUnderline: true,
                                                isSearchable: false,
                                                isMultiSelect: false,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Material(
                                          color: Colors.transparent,
                                          elevation: 0.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child:
                                                  FlutterFlowDropDown<String>(
                                                controller: _model
                                                        .skincolorValueController ??=
                                                    FormFieldController<String>(
                                                  _model.skincolorValue ??=
                                                      updateProfileUserRow
                                                          .skinColor,
                                                ),
                                                options: [
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '99i5m1d0' /* Cadan */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'yrpc8dgt' /* Marin */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'szqc54jr' /* Madow */,
                                                  )
                                                ],
                                                onChanged: (val) =>
                                                    safeSetState(() => _model
                                                        .skincolorValue = val),
                                                width: double.infinity,
                                                height: 50.0,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                hintText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '849t86wo' /* Skin color */,
                                                ),
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .editProfile,
                                                elevation: 2.0,
                                                borderColor: Colors.transparent,
                                                borderWidth: 0.0,
                                                borderRadius: 10.0,
                                                margin: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 4.0, 12.0, 4.0),
                                                hidesUnderline: true,
                                                isSearchable: false,
                                                isMultiSelect: false,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Material(
                                          color: Colors.transparent,
                                          elevation: 0.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child:
                                                  FlutterFlowDropDown<String>(
                                                controller: _model
                                                        .marriedValueController ??=
                                                    FormFieldController<String>(
                                                  _model.marriedValue ??=
                                                      updateProfileUserRow
                                                          .marriedStatus,
                                                ),
                                                options: [
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'xvvp0tub' /* Single */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'ckr0owj7' /* Divorced */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'g8oygnvl' /* Widowed */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'mjymnosh' /* Separated */,
                                                  )
                                                ],
                                                onChanged: (val) =>
                                                    safeSetState(() => _model
                                                        .marriedValue = val),
                                                width: double.infinity,
                                                height: 50.0,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                hintText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '2bbe3ygr' /* Married Status */,
                                                ),
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .editProfile,
                                                elevation: 2.0,
                                                borderColor: Colors.transparent,
                                                borderWidth: 0.0,
                                                borderRadius: 10.0,
                                                margin: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 4.0, 12.0, 4.0),
                                                hidesUnderline: true,
                                                isSearchable: false,
                                                isMultiSelect: false,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: double.infinity,
                                              child: TextFormField(
                                                controller: _model
                                                        .aboutmeTextController ??=
                                                    TextEditingController(
                                                  text: updateProfileUserRow
                                                      .aboutMe,
                                                ),
                                                focusNode:
                                                    _model.aboutmeFocusNode,
                                                onChanged: (_) =>
                                                    EasyDebounce.debounce(
                                                  '_model.aboutmeTextController',
                                                  const Duration(milliseconds: 400),
                                                  () => safeSetState(() {}),
                                                ),
                                                autofocus: false,
                                                textCapitalization:
                                                    TextCapitalization.none,
                                                textInputAction:
                                                    TextInputAction.next,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  hintText: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'kejgiv4y' /* About me */,
                                                  ),
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .editProfile,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .editProfile,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  filled: true,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .editProfile,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                                maxLines: 4,
                                                maxLength: 25,
                                                maxLengthEnforcement:
                                                    MaxLengthEnforcement
                                                        .enforced,
                                                buildCounter: (context,
                                                        {required currentLength,
                                                        required isFocused,
                                                        maxLength}) =>
                                                    null,
                                                cursorColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                validator: _model
                                                    .aboutmeTextControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ].divide(const SizedBox(height: 12.0)),
                                        ),
                                      ].divide(const SizedBox(height: 20.0)),
                                    ),
                                  ),
                                ),
                              ),
                              Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        _model.country =
                                            await CountryCall.call();

                                        await ChatTable().update(
                                          data: {
                                            'Username1': _model
                                                .usernameTextController.text,
                                          },
                                          matchingRows: (rows) => rows.eq(
                                            'Username1',
                                            updateProfileUserRow.username,
                                          ),
                                        );
                                        await ChatTable().update(
                                          data: {
                                            'Username2': _model
                                                .usernameTextController.text,
                                          },
                                          matchingRows: (rows) => rows.eq(
                                            'Username2',
                                            updateProfileUserRow.username,
                                          ),
                                        );
                                        await UserTable().update(
                                          data: {
                                            'Full_Name': _model
                                                .fullNameTextController.text,
                                            'Username': _model
                                                .usernameTextController.text,
                                            'Age': _model.ageValue,
                                            'Country': CountryCall.country(
                                              (_model.country?.jsonBody ?? ''),
                                            ),
                                            'City': CountryCall.city(
                                              (_model.country?.jsonBody ?? ''),
                                            ),
                                            'Job': _model.jobValue,
                                            'Married status':
                                                _model.marriedValue,
                                            'Skin color': _model.skincolorValue,
                                            'Email': currentUserEmail,
                                            'Online': supaSerialize<DateTime>(
                                                getCurrentTimestamp),
                                            'About Me': _model
                                                .aboutmeTextController.text,
                                          },
                                          matchingRows: (rows) => rows.eq(
                                            'id',
                                            currentUserUid,
                                          ),
                                        );
                                        context.safePop();

                                        safeSetState(() {});
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        '1sa3acm1' /* Update */,
                                      ),
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 55.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
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
                                              fontWeight: FontWeight.w600,
                                            ),
                                        elevation: 0.0,
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ]
                                .divide(const SizedBox(height: 12.0))
                                .addToStart(const SizedBox(height: 24.0))
                                .addToEnd(const SizedBox(height: 32.0)),
                          ),
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
