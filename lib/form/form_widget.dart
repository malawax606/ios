import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/walkthroughs/from.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'form_model.dart';
export 'form_model.dart';

class FormWidget extends StatefulWidget {
  /// Create form for dating with profile, username,full name,age to select 17
  /// to 60,gender to select male or femel, and bio
  const FormWidget({super.key});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  late FormModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FormModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.country = await CountryCall.call();

      _model.flg = await CountryFalgCall.call(
        code: CountryCall.code(
          (_model.country?.jsonBody ?? ''),
        ),
      );

      _model.countryy = CountryCall.country(
        (_model.country?.jsonBody ?? ''),
      );
      safeSetState(() {});
      safeSetState(
          () => _model.fromController = createPageWalkthrough(context));
      _model.fromController?.show(context: context);
    });

    _model.usernameTextController ??= TextEditingController();
    _model.usernameFocusNode ??= FocusNode();
    _model.usernameFocusNode!.addListener(() => safeSetState(() {}));
    _model.countryTextController ??= TextEditingController();
    _model.countryFocusNode ??= FocusNode();
    _model.countryFocusNode!.addListener(() => safeSetState(() {}));
    _model.fullNameTextController ??= TextEditingController();
    _model.fullNameFocusNode ??= FocusNode();

    _model.aboutmeTextController ??= TextEditingController();
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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primary,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            FFLocalizations.of(context).getText(
              'kh8o1k6d' /* Create Profile */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Inter Tight',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: ListView(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Form(
                            key: _model.formKey,
                            autovalidateMode: AutovalidateMode.always,
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 14.0, 0.0, 24.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 7.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'h1qd26l2' /* SELECT PICTURE */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
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
                                                AlignmentDirectional(0.0, 1.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                final selectedMedia =
                                                    await selectMedia(
                                                  storageFolderPath: 'Profile',
                                                  mediaSource:
                                                      MediaSource.photoGallery,
                                                  multiImage: false,
                                                );
                                                if (selectedMedia != null &&
                                                    selectedMedia.every((m) =>
                                                        validateFileFormat(
                                                            m.storagePath,
                                                            context))) {
                                                  safeSetState(() => _model
                                                      .isDataUploading = true);
                                                  var selectedUploadedFiles =
                                                      <FFUploadedFile>[];

                                                  var downloadUrls = <String>[];
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
                                                                      .split(
                                                                          '/')
                                                                      .last,
                                                                  bytes:
                                                                      m.bytes,
                                                                  height: m
                                                                      .dimensions
                                                                      ?.height,
                                                                  width: m
                                                                      .dimensions
                                                                      ?.width,
                                                                  blurHash: m
                                                                      .blurHash,
                                                                ))
                                                            .toList();

                                                    downloadUrls =
                                                        await uploadSupabaseStorageFiles(
                                                      bucketName: 'images',
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
                                                      downloadUrls.length ==
                                                          selectedMedia
                                                              .length) {
                                                    safeSetState(() {
                                                      _model.uploadedLocalFile =
                                                          selectedUploadedFiles
                                                              .first;
                                                      _model.uploadedFileUrl =
                                                          downloadUrls.first;
                                                    });
                                                    showUploadMessage(
                                                        context, 'Success!');
                                                  } else {
                                                    safeSetState(() {});
                                                    showUploadMessage(context,
                                                        'Failed to upload data');
                                                    return;
                                                  }
                                                }
                                              },
                                              child: Container(
                                                width: 120.0,
                                                height: 120.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .editProfile,
                                                  image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image:
                                                        CachedNetworkImageProvider(
                                                      _model.uploadedFileUrl,
                                                    ),
                                                  ),
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Visibility(
                                                  visible: _model
                                                              .uploadedFileUrl ==
                                                          null ||
                                                      _model.uploadedFileUrl ==
                                                          '',
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Icon(
                                                      Icons.upload_outlined,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 36.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ).addWalkthrough(
                                              containerT2laecnl,
                                              _model.fromController,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ].divide(SizedBox(width: 24.0)),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            width: 100.0,
                                            child: TextFormField(
                                              controller:
                                                  _model.usernameTextController,
                                              focusNode:
                                                  _model.usernameFocusNode,
                                              autofocus: false,
                                              autofillHints: [
                                                AutofillHints.givenName
                                              ],
                                              textCapitalization:
                                                  TextCapitalization.words,
                                              textInputAction:
                                                  TextInputAction.next,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                hintText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'mdxn4xmm' /* Username... */,
                                                ),
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .editProfile,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
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
                                                    color: FlutterFlowTheme.of(
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
                                                    FlutterFlowTheme.of(context)
                                                        .editProfile,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                              maxLength: 10,
                                              maxLengthEnforcement:
                                                  MaxLengthEnforcement.enforced,
                                              buildCounter: (context,
                                                      {required currentLength,
                                                      required isFocused,
                                                      maxLength}) =>
                                                  null,
                                              cursorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              validator: _model
                                                  .usernameTextControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ).addWalkthrough(
                                            textFieldCh5vnt2j,
                                            _model.fromController,
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            width: 100.0,
                                            child: TextFormField(
                                              controller:
                                                  _model.countryTextController,
                                              focusNode:
                                                  _model.countryFocusNode,
                                              autofocus: false,
                                              autofillHints: [
                                                AutofillHints.familyName
                                              ],
                                              textCapitalization:
                                                  TextCapitalization.words,
                                              textInputAction:
                                                  TextInputAction.done,
                                              readOnly: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText: CountryCall.country(
                                                  (_model.country?.jsonBody ??
                                                      ''),
                                                ),
                                                hintText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '719cjcyg' /* Country */,
                                                ),
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .editProfile,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
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
                                                    color: FlutterFlowTheme.of(
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
                                                    FlutterFlowTheme.of(context)
                                                        .editProfile,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                              cursorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              validator: _model
                                                  .countryTextControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 12.0)),
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        child: TextFormField(
                                          controller:
                                              _model.fullNameTextController,
                                          focusNode: _model.fullNameFocusNode,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.fullNameTextController',
                                            Duration(milliseconds: 400),
                                            () => safeSetState(() {}),
                                          ),
                                          autofocus: false,
                                          textCapitalization:
                                              TextCapitalization.none,
                                          textInputAction: TextInputAction.next,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              'ykmx6dau' /* Full Name */,
                                            ),
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .editProfile,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .editProfile,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            filled: true,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .editProfile,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                              ),
                                          maxLength: 25,
                                          maxLengthEnforcement:
                                              MaxLengthEnforcement.enforced,
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
                                      ).addWalkthrough(
                                        textFieldB8gqurx7,
                                        _model.fromController,
                                      ),
                                    ].divide(SizedBox(height: 12.0)),
                                  ),
                                  Material(
                                    color: Colors.transparent,
                                    elevation: 0.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: FlutterFlowDropDown<String>(
                                          controller: _model
                                                  .ageValueController ??=
                                              FormFieldController<String>(null),
                                          options: [
                                            FFLocalizations.of(context).getText(
                                              'c29m5axq' /* 16 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              '3fops4eh' /* 17 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'gm76kszg' /* 18 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              '0spm4ta3' /* 19 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'j3nji066' /* 20 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'edvlugsx' /* 21 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'wrnlxutr' /* 22 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'gbndv9gn' /* 23 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'quu7b06a' /* 24 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'x3d3h1vn' /* 25 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'gpehbk0z' /* 26 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              '1hvtyq4x' /* 27 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'xzrouqal' /* 28 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'sfax4h6s' /* 29 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'w0nv55gw' /* 30 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'zbpef5mx' /* 31 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'gd3w49l7' /* 32 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'fwtd2hyq' /* 33 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'ch2oslrb' /* 34 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'ahbb391j' /* 35 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'hs2q2gcx' /* 36 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              '5ufkzjr4' /* 37 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              '8i3xplf7' /* 38 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              '6zcxckzg' /* 39 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'ichjj16z' /* 40 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'jgr4x695' /* 41 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              '4i45g08j' /* 42 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'l4ryfcbe' /* 43 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              '0epz2sow' /* 44 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              '2yobqf02' /* 45 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'hmp7zs3a' /* 46 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'bagchqvf' /* 47 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'ln6p3gi2' /* 48 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'dgftn7m0' /* 49 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'dl8m3dnw' /* 50 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'vvdrulqb' /* 51 */,
                                            )
                                          ],
                                          onChanged: (val) => safeSetState(
                                              () => _model.ageValue = val),
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
                                          hintText: FFLocalizations.of(context)
                                              .getText(
                                            '3xg8vr8f' /* Age */,
                                          ),
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .editProfile,
                                          elevation: 2.0,
                                          borderColor: Colors.transparent,
                                          borderWidth: 0.0,
                                          borderRadius: 10.0,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 4.0, 12.0, 4.0),
                                          hidesUnderline: true,
                                          isSearchable: false,
                                          isMultiSelect: false,
                                        ).addWalkthrough(
                                          dropDown1460atnk,
                                          _model.fromController,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Material(
                                    color: Colors.transparent,
                                    elevation: 0.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: FlutterFlowDropDown<String>(
                                          controller: _model
                                                  .genderValueController ??=
                                              FormFieldController<String>(null),
                                          options: [
                                            FFLocalizations.of(context).getText(
                                              'c0w8oyaz' /* Lab (Rag) */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              '0tddrc2g' /* Dheddig (Dumar) */,
                                            )
                                          ],
                                          onChanged: (val) async {
                                            safeSetState(
                                                () => _model.genderValue = val);
                                            if (_model.genderValue ==
                                                'Lab (Rag)') {
                                              _model.looking =
                                                  'Dheddig (Dumar)';
                                              safeSetState(() {});
                                            } else {
                                              _model.looking = 'Lab (Rag)';
                                              safeSetState(() {});
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
                                          hintText: FFLocalizations.of(context)
                                              .getText(
                                            'x386kfen' /* Gender */,
                                          ),
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .editProfile,
                                          elevation: 2.0,
                                          borderColor: Colors.transparent,
                                          borderWidth: 0.0,
                                          borderRadius: 10.0,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 4.0, 12.0, 4.0),
                                          hidesUnderline: true,
                                          isSearchable: false,
                                          isMultiSelect: false,
                                        ).addWalkthrough(
                                          dropDownKuc265ug,
                                          _model.fromController,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Material(
                                    color: Colors.transparent,
                                    elevation: 0.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: FlutterFlowDropDown<String>(
                                          controller: _model
                                                  .jobValueController ??=
                                              FormFieldController<String>(null),
                                          options: [
                                            FFLocalizations.of(context).getText(
                                              'eaj7gdf1' /* Wan shaqeya */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'sfltjmcn' /* Mashaqeyi */,
                                            )
                                          ],
                                          onChanged: (val) => safeSetState(
                                              () => _model.jobValue = val),
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
                                          hintText: FFLocalizations.of(context)
                                              .getText(
                                            'sxj1gdxj' /* Job */,
                                          ),
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .editProfile,
                                          elevation: 2.0,
                                          borderColor: Colors.transparent,
                                          borderWidth: 0.0,
                                          borderRadius: 10.0,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 4.0, 12.0, 4.0),
                                          hidesUnderline: true,
                                          isSearchable: false,
                                          isMultiSelect: false,
                                        ).addWalkthrough(
                                          dropDownC6sufcw1,
                                          _model.fromController,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Material(
                                    color: Colors.transparent,
                                    elevation: 0.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: FlutterFlowDropDown<String>(
                                          controller: _model
                                                  .skincolorValueController ??=
                                              FormFieldController<String>(null),
                                          options: [
                                            FFLocalizations.of(context).getText(
                                              'vd8tj1le' /* Cadan */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              '285joo1h' /* Marin */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'r0m17ws8' /* Madow */,
                                            )
                                          ],
                                          onChanged: (val) => safeSetState(() =>
                                              _model.skincolorValue = val),
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
                                          hintText: FFLocalizations.of(context)
                                              .getText(
                                            'q4x1nnb5' /* Skin color */,
                                          ),
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .editProfile,
                                          elevation: 2.0,
                                          borderColor: Colors.transparent,
                                          borderWidth: 0.0,
                                          borderRadius: 10.0,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 4.0, 12.0, 4.0),
                                          hidesUnderline: true,
                                          isSearchable: false,
                                          isMultiSelect: false,
                                        ).addWalkthrough(
                                          dropDownPz6w56fv,
                                          _model.fromController,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Material(
                                    color: Colors.transparent,
                                    elevation: 0.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: FlutterFlowDropDown<String>(
                                          controller: _model
                                                  .marriedValueController ??=
                                              FormFieldController<String>(null),
                                          options: [
                                            FFLocalizations.of(context).getText(
                                              'zbvoc4x3' /* Single */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'fre7vpth' /* Divorced */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              '71z6i5jc' /* Widowed */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'z7yict2m' /* Separated */,
                                            )
                                          ],
                                          onChanged: (val) => safeSetState(
                                              () => _model.marriedValue = val),
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
                                          hintText: FFLocalizations.of(context)
                                              .getText(
                                            'vxys8391' /* Married Status */,
                                          ),
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .editProfile,
                                          elevation: 2.0,
                                          borderColor: Colors.transparent,
                                          borderWidth: 0.0,
                                          borderRadius: 10.0,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 4.0, 12.0, 4.0),
                                          hidesUnderline: true,
                                          isSearchable: false,
                                          isMultiSelect: false,
                                        ).addWalkthrough(
                                          dropDownTt1r4ye4,
                                          _model.fromController,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        child: TextFormField(
                                          controller:
                                              _model.aboutmeTextController,
                                          focusNode: _model.aboutmeFocusNode,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.aboutmeTextController',
                                            Duration(milliseconds: 400),
                                            () => safeSetState(() {}),
                                          ),
                                          autofocus: false,
                                          textCapitalization:
                                              TextCapitalization.none,
                                          textInputAction: TextInputAction.next,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              'rzwaiol1' /* About me */,
                                            ),
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .editProfile,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .editProfile,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            filled: true,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .editProfile,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                              ),
                                          maxLines: 4,
                                          maxLength: 25,
                                          maxLengthEnforcement:
                                              MaxLengthEnforcement.enforced,
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
                                      ).addWalkthrough(
                                        textFieldK0ygfipj,
                                        _model.fromController,
                                      ),
                                    ].divide(SizedBox(height: 12.0)),
                                  ),
                                ].divide(SizedBox(height: 20.0)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            if ((_model.usernameTextController.text != null &&
                                    _model.usernameTextController.text != '') &&
                                (_model.fullNameTextController.text != null &&
                                    _model.fullNameTextController.text != '') &&
                                (_model.ageValue != null &&
                                    _model.ageValue != '') &&
                                (_model.genderValue != null &&
                                    _model.genderValue != '') &&
                                (_model.jobValue != null &&
                                    _model.jobValue != '') &&
                                (_model.skincolorValue != null &&
                                    _model.skincolorValue != '') &&
                                (_model.marriedValue != null &&
                                    _model.marriedValue != '') &&
                                (_model.countryy != null &&
                                    _model.countryy != '')) {
                              await UserTable().insert({
                                'id': currentUserUid,
                                'created_at': supaSerialize<DateTime>(
                                    getCurrentTimestamp),
                                'Profile_Pic': _model.uploadedFileUrl,
                                'Full_Name': _model.fullNameTextController.text,
                                'Username': _model.usernameTextController.text,
                                'Gender': _model.genderValue,
                                'Age': _model.ageValue,
                                'LookingFor': _model.looking,
                                'Country': CountryCall.country(
                                  (_model.country?.jsonBody ?? ''),
                                ),
                                'City': CountryCall.city(
                                  (_model.country?.jsonBody ?? ''),
                                ),
                                'Job': _model.jobValue,
                                'Married status': _model.marriedValue,
                                'Skin color': _model.skincolorValue,
                                'Email': currentUserEmail,
                                'Vip_Profilee': false,
                                'verify': false,
                                'Deactivate': false,
                                'Deleted': false,
                                'Online': supaSerialize<DateTime>(
                                    getCurrentTimestamp),
                                'Chekced': true,
                                'Account Ban': false,
                                'Online Check': false,
                                'Following Check': false,
                                'Message Check': false,
                                'Tick': false,
                                'USER ID': random_data.randomInteger(
                                    20000000, 29999999),
                                'FCM_TOKEN': '',
                                'About Me': _model.aboutmeTextController.text,
                              });
                              await UserTable().update(
                                data: {
                                  'Profile_Pic': _model.uploadedFileUrl,
                                  'Full_Name':
                                      _model.fullNameTextController.text,
                                  'Username':
                                      _model.usernameTextController.text,
                                  'Gender': _model.genderValue,
                                  'Age': _model.ageValue,
                                  'LookingFor': _model.looking,
                                  'Country': CountryCall.country(
                                    (_model.country?.jsonBody ?? ''),
                                  ),
                                  'City': CountryCall.city(
                                    (_model.country?.jsonBody ?? ''),
                                  ),
                                  'Job': _model.jobValue,
                                  'Married status': _model.marriedValue,
                                  'Skin color': _model.skincolorValue,
                                  'Email': currentUserEmail,
                                  'Vip_Profilee': false,
                                  'verify': false,
                                  'Deactivate': false,
                                  'Deleted': false,
                                  'Online': supaSerialize<DateTime>(
                                      getCurrentTimestamp),
                                  'Chekced': true,
                                  'Account Ban': false,
                                  'Online Check': false,
                                  'Following Check': false,
                                  'Message Check': false,
                                  'Tick': false,
                                  'USER ID': random_data.randomInteger(
                                      20000000, 29999999),
                                  'FCM_TOKEN': '',
                                  'About Me': _model.aboutmeTextController.text,
                                },
                                matchingRows: (rows) => rows.eq(
                                  'id',
                                  currentUserUid,
                                ),
                              );

                              await currentUserReference!
                                  .update(createUsersRecordData(
                                gender: _model.genderValue,
                                country: CountryCall.country(
                                  (_model.country?.jsonBody ?? ''),
                                ),
                              ));

                              context.goNamed(
                                'HomePage',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );

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
                              _model.token = await actions.getAccessToken();
                              await AccessTokenTable().update(
                                data: {
                                  'Token': _model.token,
                                },
                                matchingRows: (rows) => rows.eq(
                                  'id',
                                  1,
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Fadlan buuxi melaha banan',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                              );
                            }

                            safeSetState(() {});
                          },
                          text: FFLocalizations.of(context).getText(
                            '2grizmef' /* Done */,
                          ),
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 55.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Color(0xFF6F61EF),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Inter Tight',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                    ]
                        .divide(SizedBox(height: 12.0))
                        .addToStart(SizedBox(height: 24.0))
                        .addToEnd(SizedBox(height: 32.0)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TutorialCoachMark createPageWalkthrough(BuildContext context) =>
      TutorialCoachMark(
        targets: createWalkthroughTargets(context),
        onFinish: () async {
          safeSetState(() => _model.fromController = null);
        },
        onSkip: () {
          return true;
        },
      );
}
