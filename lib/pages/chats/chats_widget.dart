import '/components/file_card/file_card_widget.dart';
import '/components/folder_card/folder_card_widget.dart';
import '/components/nav_menu/nav_menu_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:styled_divider/styled_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chats_model.dart';
export 'chats_model.dart';

class ChatsWidget extends StatefulWidget {
  const ChatsWidget({super.key});

  static String routeName = 'Chats';
  static String routePath = '/chats';

  @override
  State<ChatsWidget> createState() => _ChatsWidgetState();
}

class _ChatsWidgetState extends State<ChatsWidget> {
  late ChatsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatsModel());

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
              padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: FlutterFlowTheme.of(context).primary,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  ),
                  onPressed: () {
                    // TODO: Navigate to create/join group
                  },
                  icon: Icon(Icons.group_add, size: 18),
                  label: Text("Join / Create Group", style: TextStyle(fontSize: 12)),
                ),
              ),
              SizedBox(height: 12),
              Expanded(
                child: MasonryGridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return Card(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      elevation: 1,
                      child: InkWell(
                        onTap: () {
                          // TODO: Open group chat popup
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 16,
                                backgroundColor: FlutterFlowTheme.of(context).primary.withOpacity(0.1),
                                child: Icon(Icons.group, size: 16, color: FlutterFlowTheme.of(context).primary),
                              ),
                              SizedBox(height: 6),
                              Text(
                                "Group ${index + 1}",
                                style: FlutterFlowTheme.of(context).bodyMedium,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                "${10 + index * 5} members",
                                style: FlutterFlowTheme.of(context).labelSmall,
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Last: Hi 👋",
                                style: FlutterFlowTheme.of(context).bodySmall,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
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
