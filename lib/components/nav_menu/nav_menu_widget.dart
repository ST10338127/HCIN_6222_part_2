import '/components/menu_option/menu_option_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/index.dart';
import 'package:styled_divider/styled_divider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nav_menu_model.dart';
export 'nav_menu_model.dart';

class NavMenuWidget extends StatefulWidget {
  const NavMenuWidget({super.key});

  @override
  State<NavMenuWidget> createState() => _NavMenuWidgetState();
}

class _NavMenuWidgetState extends State<NavMenuWidget> {
  late NavMenuModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavMenuModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 260.0,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Opacity(
                  opacity: 0.0,
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 0.0, 0.0),
                    child: Container(
                      height: 48.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.asset(
                            'assets/images/cloudy-logo.png',
                          ).image,
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    wrapWithModel(
                      model: _model.menuOptionModel1,
                      updateCallback: () => safeSetState(() {}),
                      child: MenuOptionWidget(
                        title: 'Home',
                        active: FFAppState().activePage == 'Dashboard',
                        activeIcon: Icon(
                          FFIcons.klayoutGrid,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 20.0,
                        ),
                        inactiveIcon: Icon(
                          FFIcons.klayoutGrid,
                          color: FlutterFlowTheme.of(context).tertiaryText,
                          size: 20.0,
                        ),
                        navigateAction: () async {},
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(NotesWidget.routeName);
                      },
                      child: wrapWithModel(
                        model: _model.menuOptionModel2,
                        updateCallback: () => safeSetState(() {}),
                        child: MenuOptionWidget(
                          title: 'Notes',
                          active: FFAppState().activePage == 'Internal Files',
                          activeIcon: Icon(
                            FFIcons.kfileText,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 20.0,
                          ),
                          inactiveIcon: Icon(
                            FFIcons.kfileText,
                            color: FlutterFlowTheme.of(context).tertiaryText,
                            size: 20.0,
                          ),
                          navigateAction: () async {},
                        ),
                      ),
                    ),
                    wrapWithModel(
                      model: _model.menuOptionModel3,
                      updateCallback: () => safeSetState(() {}),
                      child: MenuOptionWidget(
                        title: 'Schedule',
                        active: FFAppState().activePage == 'State',
                        activeIcon: Icon(
                          Icons.analytics_outlined,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 20.0,
                        ),
                        inactiveIcon: Icon(
                          Icons.analytics_outlined,
                          color: FlutterFlowTheme.of(context).tertiaryText,
                          size: 20.0,
                        ),
                        navigateAction: () async {},
                      ),
                    ),
                    wrapWithModel(
                      model: _model.menuOptionModel4,
                      updateCallback: () => safeSetState(() {}),
                      child: MenuOptionWidget(
                        title: 'Classes',
                        active: FFAppState().activePage == 'Starred',
                        activeIcon: Icon(
                          FFIcons.kstar,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 20.0,
                        ),
                        inactiveIcon: Icon(
                          FFIcons.kstar,
                          color: FlutterFlowTheme.of(context).tertiaryText,
                          size: 20.0,
                        ),
                        navigateAction: () async {},
                      ),
                    ),
                  ].divide(SizedBox(height: 6.0)),
                ),
                Divider(
                  thickness: 1.0,
                  indent: 24.0,
                  endIndent: 24.0,
                  color: FlutterFlowTheme.of(context).lineColor,
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    wrapWithModel(
                      model: _model.menuOptionModel5,
                      updateCallback: () => safeSetState(() {}),
                      child: MenuOptionWidget(
                        title: 'Help',
                        active: FFAppState().activePage == 'Help',
                        activeIcon: Icon(
                          FFIcons.kheadset,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 20.0,
                        ),
                        inactiveIcon: Icon(
                          FFIcons.kheadset,
                          color: FlutterFlowTheme.of(context).tertiaryText,
                          size: 20.0,
                        ),
                        navigateAction: () async {},
                      ),
                    ),
                    wrapWithModel(
                      model: _model.menuOptionModel6,
                      updateCallback: () => safeSetState(() {}),
                      child: MenuOptionWidget(
                        title: 'Community',
                        active: FFAppState().activePage == 'Community',
                        activeIcon: Icon(
                          FFIcons.ksend2,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 20.0,
                        ),
                        inactiveIcon: Icon(
                          FFIcons.ksend2,
                          color: FlutterFlowTheme.of(context).tertiaryText,
                          size: 20.0,
                        ),
                        navigateAction: () async {

                        },
                      ),
                    ),
                    wrapWithModel(
                      model: _model.menuOptionModel7,
                      updateCallback: () => safeSetState(() {}),
                      child: MenuOptionWidget(
                        title: 'Settings',
                        active: FFAppState().activePage == 'Settings',
                        activeIcon: Icon(
                          FFIcons.ksettings,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 20.0,
                        ),
                        inactiveIcon: Icon(
                          FFIcons.ksettings,
                          color: FlutterFlowTheme.of(context).tertiaryText,
                          size: 20.0,
                        ),
                        navigateAction: () async {},
                      ),
                    ),
                    wrapWithModel(
                      model: _model.menuOptionModel8,
                      updateCallback: () => safeSetState(() {}),
                      child: MenuOptionWidget(
                        title: 'Logout',
                        active: FFAppState().activePage == 'Logout',
                        activeIcon: Icon(
                          FFIcons.klogout,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 20.0,
                        ),
                        inactiveIcon: Icon(
                          FFIcons.klogout,
                          color: FlutterFlowTheme.of(context).tertiaryText,
                          size: 20.0,
                        ),
                        navigateAction: () async {
                          FFAppState().activePage = 'Logout';
                          safeSetState(() {});
                        },
                      ),
                    ),
                  ].divide(SizedBox(height: 6.0)),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    'Patrick Chikwekwete',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.notoSans(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ),
                              Icon(
                                FFIcons.kchevronRight,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ]
                                .divide(SizedBox(width: 12.0))
                                .addToStart(SizedBox(width: 12.0))
                                .addToEnd(SizedBox(width: 12.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ].divide(SizedBox(height: 16.0)).addToEnd(SizedBox(height: 24.0)),
            ),
          ),
          StyledVerticalDivider(
            width: 1.0,
            thickness: 1.0,
            color: FlutterFlowTheme.of(context).lineColor,
            lineStyle: DividerLineStyle.dashed,
          ),
        ],
      ),
    );
  }
}
