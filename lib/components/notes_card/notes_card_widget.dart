import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'notes_card_model.dart';
export 'notes_card_model.dart';

class NotesCardWidget extends StatefulWidget {
  const NotesCardWidget({
    super.key,
    required this.folderName,
    required this.folderSize,
    required this.folderFiles,
  });

  final String? folderName;
  final double? folderSize;
  final int? folderFiles;

  @override
  State<NotesCardWidget> createState() => _NotesCardWidgetState();
}

class _NotesCardWidgetState extends State<NotesCardWidget> {
  late NotesCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotesCardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).lineColor,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/folder-icon.png',
                  width: 244.52,
                  height: 129.7,
                  fit: BoxFit.contain,
                ),
                Text(
                  valueOrDefault<String>(
                    widget!.folderName,
                    'Folder',
                  ),
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.notoSans(
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        fontSize: 18.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(1.0, -1.0),
                  child: Icon(
                    Icons.align_horizontal_left,
                    color: FlutterFlowTheme.of(context).alternate,
                    size: 30.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
