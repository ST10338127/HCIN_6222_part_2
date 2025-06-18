import '/components/file_card/file_card_widget.dart';
import '/components/folder_card/folder_card_widget.dart';
import '/components/nav_menu/nav_menu_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:styled_divider/styled_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'help_model.dart';
export 'help_model.dart';

class HelpWidget extends StatefulWidget {
  const HelpWidget({super.key});

  static String routeName = 'Help';
  static String routePath = '/help';

  @override
  State<HelpWidget> createState() => _HelpWidgetState();
}

class _HelpWidgetState extends State<HelpWidget> {
  late HelpModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HelpModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().activePage = 'Community';
      safeSetState(() {});
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [

              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [

                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Help & Support',
                                style: FlutterFlowTheme.of(context).titleLarge.override(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 24),

                              // FAQ Section
                              Card(
                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                child: ExpansionTile(
                                  leading: Icon(Icons.question_answer, color: FlutterFlowTheme.of(context).primary),
                                  title: Text('Frequently Asked Questions'),
                                  children: [
                                    ListTile(
                                      title: Text('How do I create a new note?'),
                                      subtitle: Text('Go to Notes and tap on the + button.'),
                                    ),
                                    ListTile(
                                      title: Text('How do I reset my password?'),
                                      subtitle: Text('Go to Settings > Privacy & Security > Reset Password.'),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 16),

                              // Contact support
                              Card(
                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                child: ListTile(
                                  leading: Icon(Icons.support_agent, color: FlutterFlowTheme.of(context).primary),
                                  title: Text('Contact Support'),
                                  subtitle: Text('Email or chat with us'),
                                  trailing: Icon(Icons.chevron_right),
                                  onTap: () {
                                    // TODO: Open contact options / email launcher
                                  },
                                ),
                              ),
                              SizedBox(height: 16),

                              // App tutorial
                              Card(
                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                child: ListTile(
                                  leading: Icon(Icons.play_circle_fill, color: FlutterFlowTheme.of(context).primary),
                                  title: Text('View App Tutorial'),
                                  onTap: () {
                                    // TODO: Navigate to tutorial page / play video
                                  },
                                ),
                              ),
                              SizedBox(height: 16),

                              // Feedback
                              Card(
                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                child: ListTile(
                                  leading: Icon(Icons.feedback_outlined, color: FlutterFlowTheme.of(context).primary),
                                  title: Text('Send Feedback'),
                                  onTap: () {
                                    // TODO: Open feedback form or email launcher
                                  },
                                ),
                              ),
                              SizedBox(height: 16),

                              // About
                              Card(
                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                child: ListTile(
                                  leading: Icon(Icons.info_outline, color: FlutterFlowTheme.of(context).primary),
                                  title: Text('About This App'),
                                  subtitle: Text('Version 1.0.0 • Developed by YourName'),
                                  onTap: () {
                                    // TODO: Show about details / license
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )


                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
