import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:platty/widgets/navigation_bar.dart';
import 'package:platty/widgets/switch.dart';

class SwitchesPage extends StatefulWidget {
  @override
  SwitchesPageState createState() {
    return new SwitchesPageState();
  }
}

class SwitchesPageState extends State<SwitchesPage> {
  var states = [false, false, false];

  _buildSwitch({String title, Widget Function() switchBuilder}) => Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(title),
            ),
            switchBuilder(),
          ],
        ),
      );

  _updateState(int index) {
    setState(() {
      states[index] = !states[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PNavigationBar(
        title: Text("Switches"),
      ),
      body: SafeArea(
          child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              _buildSwitch(
                title: "Platform Switch",
                switchBuilder: () => PSwitch(
                      value: states[0],
                      onChanged: (value) {
                        _updateState(0);
                      },
                    ),
              ),
              _buildSwitch(
                title: "IOS Switch",
                switchBuilder: () => PSwitch(
                      renderPlatform: TargetPlatform.iOS,
                      value: states[1],
                      onChanged: (value) {
                        _updateState(1);
                      },
                    ),
              ),
              _buildSwitch(
                title: "Android Switch",
                switchBuilder: () => PSwitch(
                      renderPlatform: TargetPlatform.android,
                      value: states[2],
                      onChanged: (value) {
                        _updateState(2);
                      },
                    ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}