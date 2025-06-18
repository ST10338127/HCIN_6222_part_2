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
import 'settings_model.dart';
export 'settings_model.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({super.key});

  static String routeName = 'Settings';
  static String routePath = '/settings';

  @override
  State<SettingsWidget> createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  late SettingsModel _model;

  bool _notificationsEnabled = true;

  String _themeModeLabel = 'System Default';

  String _languageLabel = 'English';



  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingsModel());

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
                                'Settings',
                                style: FlutterFlowTheme.of(context).titleLarge.override(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 24),

                              // Profile
                              Card(
                                color: FlutterFlowTheme.of(context).primary,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                    child: Icon(Icons.person, color: Colors.white),
                                  ),
                                  title: Text('Your Profile'),
                                  subtitle: Text('View and edit your details'),
                                  trailing: Icon(Icons.chevron_right),
                                  onTap: () {
                                    // TODO: Navigate to profile page
                                  },
                                ),
                              ),
                              SizedBox(height: 16),

                              // Notifications
                              Card(
                                color: FlutterFlowTheme.of(context).primary,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                child: SwitchListTile(
                                  title: Text('Enable Notifications'),
                                  value: _notificationsEnabled,
                                  onChanged: (val) {
                                    setState(() {
                                      _notificationsEnabled = val;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(height: 16),

                              // Theme mode
                              Card(
                                color: FlutterFlowTheme.of(context).primary,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                child: ListTile(
                                  leading: Icon(Icons.brightness_6, color: FlutterFlowTheme.of(context).secondaryBackground),
                                  title: Text('Theme Mode'),
                                  subtitle: Text(_themeModeLabel),
                                  trailing: Icon(Icons.chevron_right),
                                  onTap: () {
                                    _showThemeModeDialog(context);
                                  },
                                ),
                              ),
                              SizedBox(height: 16),

                              // Language selection
                              Card(
                                color: FlutterFlowTheme.of(context).primary,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                child: ListTile(
                                  leading: Icon(Icons.language, color: FlutterFlowTheme.of(context).secondaryBackground),
                                  title: Text('Language'),
                                  subtitle: Text(_languageLabel),
                                  trailing: Icon(Icons.chevron_right),
                                  onTap: () {
                                    _showLanguageDialog(context);
                                  },
                                ),
                              ),
                              SizedBox(height: 16),

                              // Privacy / Security
                              Card(
                                color: FlutterFlowTheme.of(context).primary,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                child: ListTile(
                                  leading: Icon(Icons.lock_outline, color: FlutterFlowTheme.of(context).secondaryBackground),
                                  title: Text('Privacy & Security'),
                                  onTap: () {
                                    // TODO: Navigate to privacy/security page
                                  },
                                ),
                              ),
                              SizedBox(height: 16),

                              // Data sync
                              Card(
                                color: FlutterFlowTheme.of(context).primary,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                child: ListTile(
                                  leading: Icon(Icons.sync, color: FlutterFlowTheme.of(context).secondaryBackground),
                                  title: Text('Data Sync'),
                                  subtitle: Text('Last synced: 10 min ago'),
                                  trailing: Icon(Icons.refresh),
                                  onTap: () {
                                    // TODO: Trigger sync
                                  },
                                ),
                              ),
                              SizedBox(height: 16),

                              // Logout
                              Card(
                                color: FlutterFlowTheme.of(context).primary,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                child: ListTile(
                                  leading: Icon(Icons.logout, color: Colors.redAccent),
                                  title: Text('Log out'),
                                  onTap: () {
                                    _confirmLogout(context);
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

  void _showThemeModeDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text('Light Mode'),
            onTap: () {
              setState(() {
                _themeModeLabel = 'Light Mode';
              });
              Navigator.pop(ctx);
            },
          ),
          ListTile(
            title: Text('Dark Mode'),
            onTap: () {
              setState(() {
                _themeModeLabel = 'Dark Mode';
              });
              Navigator.pop(ctx);
            },
          ),
          ListTile(
            title: Text('System Default'),
            onTap: () {
              setState(() {
                _themeModeLabel = 'System Default';
              });
              Navigator.pop(ctx);
            },
          ),
        ],
      ),
    );
  }

  void _showLanguageDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text('English'),
            onTap: () {
              setState(() {
                _languageLabel = 'English';
              });
              Navigator.pop(ctx);
            },
          ),
          ListTile(
            title: Text('Spanish'),
            onTap: () {
              setState(() {
                _languageLabel = 'Spanish';
              });
              Navigator.pop(ctx);
            },
          ),
          ListTile(
            title: Text('French'),
            onTap: () {
              setState(() {
                _languageLabel = 'French';
              });
              Navigator.pop(ctx);
            },
          ),
        ],
      ),
    );
  }

  void _confirmLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Confirm Logout'),
        content: Text('Are you sure you want to log out?'),
        actions: [
          TextButton(
            child: Text('Cancel'),
            onPressed: () => Navigator.pop(ctx),
          ),
          ElevatedButton(
            child: Text('Log out'),
            onPressed: () {
              Navigator.pop(ctx);
              // TODO: Implement actual logout logic (e.g. clear session, navigate to login)
            },
          ),
        ],
      ),
    );
  }

}
