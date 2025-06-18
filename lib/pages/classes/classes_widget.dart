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
import 'classes_model.dart';
export 'classes_model.dart';

class ClassesWidget extends StatefulWidget {
  const ClassesWidget({super.key});

  static String routeName = 'Classes';
  static String routePath = '/classes';

  @override
  State<ClassesWidget> createState() => _ClassesWidgetState();
}

class _ClassesWidgetState extends State<ClassesWidget> {
  late ClassesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClassesModel());

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
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Semester Pacer',
                              style: FlutterFlowTheme.of(context).headlineSmall,
                            ),
                            SizedBox(height: 12.0),
                            LinearProgressIndicator(
                              value: 0.6, // 60% of semester completed
                              minHeight: 10,
                              backgroundColor: FlutterFlowTheme.of(context).accent4,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                            SizedBox(height: 24.0),
                            Text(
                              'Today\'s Timetable',
                              style: FlutterFlowTheme.of(context).headlineSmall,
                            ),
                            SizedBox(height: 12.0),
                            Column(
                              children: [
                                _buildClassTile(
                                  context,
                                  title: 'BUSA 7311 - Strategic Management',
                                  time: '08:00 - 09:30',
                                  location: 'Room B12',
                                ),
                                _buildClassTile(
                                  context,
                                  title: 'IRIT 7311 - Business Analysis',
                                  time: '10:00 - 11:30',
                                  location: 'Room A3',
                                ),
                                _buildClassTile(
                                  context,
                                  title: 'HCIN 6222 - Human-Computer Interaction',
                                  time: '13:00 - 14:30',
                                  location: 'Lab C1',
                                ),
                              ],
                            ),
                            SizedBox(height: 24.0),
                            Text(
                              'Upcoming Assignments',
                              style: FlutterFlowTheme.of(context).headlineSmall,
                            ),
                            SizedBox(height: 12.0),
                            _buildAssignmentCard(
                              context,
                              title: 'Risk Management Report',
                              dueDate: 'Due: 24 June 2025',
                            ),
                            _buildAssignmentCard(
                              context,
                              title: 'Web Dev Project',
                              dueDate: 'Due: 1 July 2025',
                            ),
                            SizedBox(height: 24.0),
                            Text(
                              'Attendance Summary',
                              style: FlutterFlowTheme.of(context).headlineSmall,
                            ),
                            SizedBox(height: 12.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                _buildAttendanceStat(context, 'BUSA', 90),
                                _buildAttendanceStat(context, 'IRIT', 85),
                                _buildAttendanceStat(context, 'HCIN', 95),
                              ],
                            ),
                            SizedBox(height: 24.0),
                            Text(
                              'Semester Overview',
                              style: FlutterFlowTheme.of(context).headlineSmall,
                            ),
                            SizedBox(height: 12.0),
                            Text(
                              'Current Week: 8 / 14',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                            SizedBox(height: 6.0),
                            Text(
                              'Next break: Mid-term holiday starts 15 July 2025',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ],
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

  Widget _buildClassTile(BuildContext context, {required String title, required String time, required String location}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      child: ListTile(
        leading: Icon(Icons.class_, color: FlutterFlowTheme.of(context).primary),
        title: Text(title, style: FlutterFlowTheme.of(context).bodyLarge),
        subtitle: Text('$time • $location'),
        trailing: Icon(Icons.arrow_forward_ios, size: 16.0),
        onTap: () {
          // Add navigation or details pop-up if desired
        },
      ),
    );
  }

  Widget _buildAssignmentCard(BuildContext context, {required String title, required String dueDate}) {
    return Card(
      color: FlutterFlowTheme.of(context).secondaryBackground,
      child: ListTile(
        leading: Icon(Icons.assignment, color: FlutterFlowTheme.of(context).secondary),
        title: Text(title, style: FlutterFlowTheme.of(context).bodyLarge),
        subtitle: Text(dueDate),
      ),
    );
  }

  Widget _buildAttendanceStat(BuildContext context, String subject, int percent) {
    return Column(
      children: [
        Text(
          '$percent%',
          style: FlutterFlowTheme.of(context).titleLarge.copyWith(
            color: FlutterFlowTheme.of(context).primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(subject, style: FlutterFlowTheme.of(context).bodySmall),
      ],
    );
  }


}
