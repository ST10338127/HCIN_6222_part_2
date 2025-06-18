import 'package:funda/index.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/classes/classes_widget.dart';
import '/pages/notes/notes_widget.dart';
import '/pages/schedule/schedule_widget.dart';
import '/pages/settings/settings_widget.dart';
import '/pages/help/help_widget.dart';
import '/pages/chats/chats_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    HomeWidget(),
    ClassesWidget(),
    NotesWidget(),
    ScheduleWidget(),
    ChatsWidget(),
    HelpWidget(),
    SettingsWidget(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      FFAppState().activePage = _navLabels[index];
    });
  }

  static const List<IconData> _navIcons = [
    Icons.home,
    Icons.class_,
    Icons.note,
    Icons.schedule,
    Icons.group,
    Icons.help,
    Icons.settings,
  ];

  static const List<String> _navLabels = [
    'Home',
    'Classes',
    'Notes',
    'Schedule',
    'Community',
    'Help',
    'Settings',
  ];

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    bool isDesktop = MediaQuery.of(context).size.width >= 640;

    return Scaffold(
      appBar: AppBar(
      toolbarHeight: 100, // Adjust height as needed
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      flexibleSpace: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Funda 👋',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.notoSans(
                        fontWeight: FlutterFlowTheme.of(context)
                            .bodyMedium
                            .fontWeight,
                        fontStyle: FlutterFlowTheme.of(context)
                            .bodyMedium
                            .fontStyle,
                      ),
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    'Welcome to your learning journey',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.notoSans(
                        fontWeight: FlutterFlowTheme.of(context)
                            .bodyMedium
                            .fontWeight,
                        fontStyle: FlutterFlowTheme.of(context)
                            .bodyMedium
                            .fontStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 320,
              height: 48,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Stack(
                alignment: AlignmentDirectional(1.0, 0.0),
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 3.0),
                    child: FlutterFlowIconButton(
                      borderRadius: 20.0,
                      borderWidth: 1.0,
                      buttonSize: 40.0,
                      fillColor: FlutterFlowTheme.of(context).primary,
                      icon: Icon(
                        FFIcons.ksearch,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 18.0,
                      ),
                      onPressed: () {
                        print('IconButton pressed search...');
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                  10.0, 0.0, 10.0, 0.0),
              child: FlutterFlowIconButton(
                borderColor:
                FlutterFlowTheme.of(context)
                    .lineColor,
                borderRadius: 20.0,
                borderWidth: 1.0,
                buttonSize: 40.0,
                fillColor: FlutterFlowTheme.of(context)
                    .secondaryBackground,
                icon: Icon( // Settings button along the search bar
                  FFIcons.ksettings,
                  color: FlutterFlowTheme.of(context)
                      .primaryText,
                  size: 18.0,
                ),
                onPressed: () {
                  print('IconButton pressed Settings...');
                },
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                  0.0, 0.0, 3.0, 0.0),
              child: FlutterFlowIconButton(
                borderColor:
                FlutterFlowTheme.of(context)
                    .lineColor,
                borderRadius: 20.0,
                borderWidth: 1.0,
                buttonSize: 40.0,
                fillColor: FlutterFlowTheme.of(context)
                    .secondaryBackground,
                icon: Icon( // notifications button along the search bar
                  FFIcons.kbell, //
                  color: FlutterFlowTheme.of(context)
                      .primaryText,
                  size: 18.0,
                ),
                onPressed: () {
                  print('IconButton pressed notifications ...');
                },
              ),
            ),
          ],
        ),
      ),
    ),
      bottomNavigationBar: !isDesktop
          ? BottomNavigationBar(
        currentIndex: _selectedIndex,
        unselectedItemColor: FlutterFlowTheme.of(context).tertiaryText,
        selectedItemColor: FlutterFlowTheme.of(context).primary,
        onTap: _onItemTapped,
        items: List.generate(_navIcons.length, (idx) {
          return BottomNavigationBarItem(
            icon: Icon(_navIcons[idx]),
            label: _navLabels[idx],
          );
        }),
      )
          : null,
      body: Row(
        children: [
          if (isDesktop)
            Container(
              color: FlutterFlowTheme.of(context).primaryBackground,
              width: 90, // Similar width to NavigationRail
              child: Column(
                children: [
                  // Scrollable destinations
                  Expanded(
                    child: ListView.builder(
                      itemCount: _navIcons.length,
                      itemBuilder: (context, idx) {
                        final isSelected = _selectedIndex == idx;
                        return InkWell(
                          onTap: () => _onItemTapped(idx),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  _navIcons[idx],
                                  color: isSelected
                                      ? FlutterFlowTheme.of(context).primary
                                      : FlutterFlowTheme.of(context).tertiaryText,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  _navLabels[idx],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: isSelected
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context).tertiaryText,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  // Trailing (avatar + name)
                  const Padding(
                    padding: EdgeInsets.only(top: 18, bottom: 8),
                    child: CircleAvatar(
                      radius: 20,
                      child: Icon(Icons.person),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Text(
                      'Patrick',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.notoSans(
                          fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                          fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        letterSpacing: 0.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),

          // The main screen
          Expanded(
            child: _screens[_selectedIndex],
          ),
        ],
      ),

    );
  }
}
