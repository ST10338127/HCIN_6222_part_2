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
import 'schedule_model.dart';
export 'schedule_model.dart';

class ScheduleWidget extends StatefulWidget {
  const ScheduleWidget({super.key});

  static String routeName = 'Schedule';
  static String routePath = '/schedule';

  @override
  State<ScheduleWidget> createState() => _ScheduleWidgetState();
}

class _ScheduleWidgetState extends State<ScheduleWidget> {
  late ScheduleModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  // Mock schedule list (put this in your state or top of build)
  final List<Map<String, String>> _scheduleList = [
    {
      'title': 'Software Engineering',
      'time': 'Mon 09:00 - 11:00',
      'venue': 'Room 101',
    },
    {
      'title': 'Business Analysis',
      'time': 'Tue 13:00 - 15:00',
      'venue': 'Room 202',
    },
    {
      'title': 'Risk Management',
      'time': 'Wed 08:00 - 10:00',
      'venue': 'Auditorium',
    },
    {
      'title': 'Human-Computer Interaction',
      'time': 'Thu 10:00 - 12:00',
      'venue': 'Lab 3',
    },
    {
      'title': 'Web Development',
      'time': 'Fri 14:00 - 16:00',
      'venue': 'Room 303',
    },
  ];

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScheduleModel());

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
                          Row(
                            children: [
                              Text(
                                'Class Schedule',
                                style: FlutterFlowTheme.of(context).titleLarge.override(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              ElevatedButton.icon(
                                onPressed: () {
                                  // Optional: Expand all or refresh action
                                },
                                icon: Icon(Icons.expand_more),
                                label: Text('Expand All'),
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          ..._scheduleList.map((event) => _buildScheduleCard(context, event)).toList(),
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

  // Helper widget builder
  Widget _buildScheduleCard(BuildContext context, Map<String, String> event) {
    return Card(
      color: FlutterFlowTheme.of(context).secondaryBackground,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      child: ListTile(
        leading: Icon(Icons.schedule, color: FlutterFlowTheme.of(context).primary, size: 32),
        title: Text(
          event['title'] ?? '',
          style: FlutterFlowTheme.of(context).bodyLarge.override(
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          '${event['time']} • ${event['venue']}',
          style: FlutterFlowTheme.of(context).bodyMedium,
        ),
        trailing: Icon(Icons.chevron_right, color: FlutterFlowTheme.of(context).secondaryText),
        onTap: () {
          // TODO: Handle tap - maybe show detail popup or navigate
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: Text(event['title'] ?? ''),
              content: Text('Time: ${event['time']}\nVenue: ${event['venue']}'),
              actions: [
                TextButton(onPressed: () => Navigator.pop(context), child: Text('Close')),
              ],
            ),
          );
        },
      ),
    );
  }

}
