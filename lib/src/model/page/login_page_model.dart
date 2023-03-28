import '../../widgets/setting/kakako_button/kakako_button_model.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class LoginPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for kakakoButton component.
  late KakakoButtonModel kakakoButtonModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    kakakoButtonModel = createModel(context, () => KakakoButtonModel());
  }

  void dispose() {
    kakakoButtonModel.dispose();
  }

  /// Additional helper methods are added here.
}
