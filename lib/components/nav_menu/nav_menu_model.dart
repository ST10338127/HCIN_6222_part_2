import '/components/menu_option/menu_option_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/index.dart';
import 'nav_menu_widget.dart' show NavMenuWidget;
import 'package:styled_divider/styled_divider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NavMenuModel extends FlutterFlowModel<NavMenuWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for MenuOption component.
  late MenuOptionModel menuOptionModel1;
  // Model for MenuOption component.
  late MenuOptionModel menuOptionModel2;
  // Model for MenuOption component.
  late MenuOptionModel menuOptionModel3;
  // Model for MenuOption component.
  late MenuOptionModel menuOptionModel4;
  // Model for MenuOption component.
  late MenuOptionModel menuOptionModel5;
  // Model for MenuOption component.
  late MenuOptionModel menuOptionModel6;
  // Model for MenuOption component.
  late MenuOptionModel menuOptionModel7;
  // Model for MenuOption component.
  late MenuOptionModel menuOptionModel8;

  @override
  void initState(BuildContext context) {
    menuOptionModel1 = createModel(context, () => MenuOptionModel());
    menuOptionModel2 = createModel(context, () => MenuOptionModel());
    menuOptionModel3 = createModel(context, () => MenuOptionModel());
    menuOptionModel4 = createModel(context, () => MenuOptionModel());
    menuOptionModel5 = createModel(context, () => MenuOptionModel());
    menuOptionModel6 = createModel(context, () => MenuOptionModel());
    menuOptionModel7 = createModel(context, () => MenuOptionModel());
    menuOptionModel8 = createModel(context, () => MenuOptionModel());
  }

  @override
  void dispose() {
    menuOptionModel1.dispose();
    menuOptionModel2.dispose();
    menuOptionModel3.dispose();
    menuOptionModel4.dispose();
    menuOptionModel5.dispose();
    menuOptionModel6.dispose();
    menuOptionModel7.dispose();
    menuOptionModel8.dispose();
  }
}
