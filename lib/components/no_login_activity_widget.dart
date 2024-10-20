import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'no_login_activity_model.dart';
export 'no_login_activity_model.dart';

class NoLoginActivityWidget extends StatefulWidget {
  const NoLoginActivityWidget({super.key});

  @override
  State<NoLoginActivityWidget> createState() => _NoLoginActivityWidgetState();
}

class _NoLoginActivityWidgetState extends State<NoLoginActivityWidget> {
  late NoLoginActivityModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoLoginActivityModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.history_rounded,
            color: FlutterFlowTheme.of(context).secondaryText,
            size: 100.0,
          ),
          Text(
            FFLocalizations.of(context).getText(
              'fk1cf2as' /* No Login Activity */,
            ),
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).headlineSmall.override(
                  fontFamily: 'Inter Tight',
                  letterSpacing: 0.0,
                ),
          ),
          Text(
            FFLocalizations.of(context).getText(
              '1zptldog' /* You don't have any login activ... */,
            ),
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  color: FlutterFlowTheme.of(context).secondaryText,
                  letterSpacing: 0.0,
                ),
          ),
        ].divide(const SizedBox(height: 24.0)),
      ),
    );
  }
}
