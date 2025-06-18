import '/components/nav_menu/nav_menu_widget.dart';
import '/components/new_notes/new_notes_widget.dart';
import '/components/notes_card/notes_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:styled_divider/styled_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'notes_model.dart';
export 'notes_model.dart';

class NotesWidget extends StatefulWidget {
  const NotesWidget({super.key});

  static String routeName = 'Notes';
  static String routePath = '/notes';

  @override
  State<NotesWidget> createState() => _NotesWidgetState();
}

class _NotesWidgetState extends State<NotesWidget> {
  late NotesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotesModel());

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
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // HEADER WITH CREATE + SORT/FILTER
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Your Notes',
                                  style: FlutterFlowTheme.of(context).titleMedium,
                                ),
                                Row(
                                  children: [
                                    DropdownButton<String>(
                                      value: 'Date',
                                      underline: SizedBox(),
                                      onChanged: (value) {
                                        // Handle sort change
                                      },
                                      items: ['Date', 'Title', 'Last Updated'].map((e) {
                                        return DropdownMenuItem<String>(
                                          value: e,
                                          child: Text(e),
                                        );
                                      }).toList(),
                                    ),
                                    SizedBox(width: 8.0),
                                    ElevatedButton.icon(
                                      onPressed: () {
                                        // Handle create new note
                                        print('Create New Note tapped');
                                      },
                                      icon: Icon(Icons.add),
                                      label: Text('New Note'),
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                                        textStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            SizedBox(height: 16.0),

                            // RESPONSIVE GRID WITH POPUP ON TAP
                            LayoutBuilder(
                              builder: (context, constraints) {
                                int itemsPerRow = constraints.maxWidth > 900
                                    ? 4
                                    : constraints.maxWidth > 600
                                    ? 3
                                    : 2;

                                double itemWidth = (constraints.maxWidth - (itemsPerRow - 1) * 12) / itemsPerRow;

                                final notes = [
                                  {
                                    'title': 'Business Analysis: Key Concepts',
                                    'desc': 'Covers BABOK principles, stakeholder engagement, and requirements gathering techniques.',
                                    'updated': '2025-06-10',
                                  },
                                  {
                                    'title': 'IT Risk Management Overview',
                                    'desc': 'Details on risk identification, assessment matrices, and mitigation strategies.',
                                    'updated': '2025-06-11',
                                  },
                                  {
                                    'title': 'Intro to Research: Methods',
                                    'desc': 'Explains qualitative vs quantitative approaches, sampling, and ethics in research.',
                                    'updated': '2025-06-12',
                                  },
                                  {
                                    'title': 'HCI Principles & Design',
                                    'desc': 'Focus on usability heuristics, UI patterns, and accessibility guidelines.',
                                    'updated': '2025-06-13',
                                  },
                                  {
                                    'title': 'Business Analysis: Elicitation',
                                    'desc': 'Covers interviews, workshops, document analysis, and prototyping in elicitation.',
                                    'updated': '2025-06-14',
                                  },
                                  {
                                    'title': 'IT Risk Response Planning',
                                    'desc': 'Strategies for risk avoidance, transference, acceptance, and mitigation.',
                                    'updated': '2025-06-15',
                                  },
                                  {
                                    'title': 'Research Data Analysis',
                                    'desc': 'Introduction to coding qualitative data and using statistical software.',
                                    'updated': '2025-06-16',
                                  },
                                  {
                                    'title': 'HCI User Testing',
                                    'desc': 'Steps for conducting usability testing, A/B testing, and user feedback collection.',
                                    'updated': '2025-06-17',
                                  },
                                ];

                                return Wrap(
                                  spacing: 12.0,
                                  runSpacing: 12.0,
                                  children: notes.map((note) {
                                    return InkWell(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (_) => AlertDialog(
                                            title: Text(note['title']!),
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Last Updated: ${note['updated']}'),
                                                SizedBox(height: 8.0),
                                                Text(note['desc']!),
                                              ],
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.of(context).pop(),
                                                child: Text('Close'),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      child: Container(
                                        width: itemWidth,
                                        padding: EdgeInsets.all(12.0),
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                          borderRadius: BorderRadius.circular(10.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context).lineColor,
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.sticky_note_2_outlined,
                                              color: FlutterFlowTheme.of(context).primaryText,
                                              size: 24.0,
                                            ),
                                            SizedBox(height: 8.0),
                                            Text(
                                              note['title']!,
                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                fontWeight: FontWeight.bold,
                                              ),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            SizedBox(height: 4.0),
                                            Text(
                                              'Last Updated: ${note['updated']}',
                                              style: FlutterFlowTheme.of(context).labelSmall,
                                            ),
                                            SizedBox(height: 6.0),
                                            Text(
                                              note['desc']!,
                                              style: FlutterFlowTheme.of(context).labelSmall,
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                );
                              },
                            ),

                            SizedBox(height: 24.0),
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
}
