import 'package:example/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:platty/theme.dart';
import 'package:platty/widgets/alert.dart';
import 'package:platty/widgets/button.dart';
import 'package:platty/widgets/scaffold.dart';

class AlertPage extends StatelessWidget {
  _buildPAlertDialog(BuildContext context) {
    return PAlertDialog(
      title: Text("Sample Alert"),
      content:
          Text("I can adapt based on target platform defaults, PTheme wrapper, "
              "or individual render platform overrides."),
      actions: <Widget>[
        PFlatButton(
          child: Text("Ok"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PScaffold(
      appBar: navBarFor(title: "Alerts"),
      child: Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                PTheme.ios(
                  PButton(
                    child: Text("iOS Alert"),
                    onPressed: () {
                      showPlatformDialog(
                        context: context,
                        builder: (context) =>
                            PTheme.ios(_buildPAlertDialog(context)),
                      );
                    },
                  ),
                ),
                PTheme.android(
                  PButton(
                      child: Text("Android Alert"),
                      onPressed: () {
                        showPlatformDialog(
                            context: context,
                            builder: (context) =>
                                PTheme.android(_buildPAlertDialog(context)));
                      }),
                ),
                PButton(
                  child: Text("Platform Alert"),
                  onPressed: () {
                    showPlatformDialog(
                        context: context,
                        builder: (context) => _buildPAlertDialog(context));
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
