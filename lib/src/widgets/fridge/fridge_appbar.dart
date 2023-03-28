import 'package:client/src/pages/wasted_recipe_page.dart';
import 'package:flutter/material.dart';

import '../../../flutter_flow/flutter_flow_icon_button.dart';
import '../../../flutter_flow/flutter_flow_theme.dart';

class FridgeAppBar extends StatefulWidget {
  FridgeAppBar();

  @override
  _FridgeAppBarState createState() => _FridgeAppBarState();
}

class _FridgeAppBarState extends State<FridgeAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: SafeArea(
          child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 5.0, 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 10,
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        const Icon(
                          Icons.keyboard_arrow_down_outlined,
                          size: 36,
                        ),
                        Container(
                          child: Text('My Fridge',
                              style: FlutterFlowTheme.of(context)
                                  .title2
                                  .override(
                                    fontFamily: 'Outfit',
                                    color:
                                        FlutterFlowTheme.of(context).black600,
                                    fontSize: 40.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                              textAlign: TextAlign.left),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 4,
                  child: FlutterFlowIconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WastedPageWidget()));
                    },
                    borderColor: Colors.transparent,
                    borderRadius: 24.0,
                    borderWidth: 1.0,
                    buttonSize: 48.0,
                    icon: Icon(
                      Icons.compost_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 36.0,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      )),
    );
  }
}
