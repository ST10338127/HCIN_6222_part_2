import '/components/nav_menu/nav_menu_widget.dart';
import '/components/new_notes/new_notes_widget.dart';
import '/components/notes_card/notes_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'notes_widget.dart' show NotesWidget;
import 'package:styled_divider/styled_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NotesModel extends FlutterFlowModel<NotesWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NavMenu component.
  late NavMenuModel navMenuModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for NotesCard component.
  late NotesCardModel notesCardModel1;
  // Model for NotesCard component.
  late NotesCardModel notesCardModel2;
  // Model for NewNotes component.
  late NewNotesModel newNotesModel;

  @override
  void initState(BuildContext context) {
    navMenuModel = createModel(context, () => NavMenuModel());
    notesCardModel1 = createModel(context, () => NotesCardModel());
    notesCardModel2 = createModel(context, () => NotesCardModel());
    newNotesModel = createModel(context, () => NewNotesModel());
  }

  @override
  void dispose() {
    navMenuModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    notesCardModel1.dispose();
    notesCardModel2.dispose();
    newNotesModel.dispose();
  }
}
