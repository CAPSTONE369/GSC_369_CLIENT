import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'kakako_button_model.dart';
export 'kakako_button_model.dart';

class KakakoButtonWidget extends StatefulWidget {
  const KakakoButtonWidget({Key? key}) : super(key: key);

  @override
  _KakakoButtonWidgetState createState() => _KakakoButtonWidgetState();
}

class _KakakoButtonWidgetState extends State<KakakoButtonWidget> {
  late KakakoButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => KakakoButtonModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
        child: Container(
          width: 300.0,
          height: 44.0,
          decoration: BoxDecoration(
            color: Color(0x00FFFFFF),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.asset(
              'assets/image/kakao_login_medium_wide.png',
              width: 300.0,
              height: 44.0,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
