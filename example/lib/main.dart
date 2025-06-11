import 'dart:async';

import 'package:aqua_ui/aqua_ui.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const AquaApp(title: 'Aqua app example', home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _progress = 0;
  late final Timer _progressTimer;

  bool _checkboxValue = false;

  List<String> _radioOptions = ['One', 'Two', 'Tree'];
  String _radioOption = 'One';

  @override
  void initState() {
    super.initState();
    _progressTimer = Timer.periodic(const Duration(milliseconds: 150), (_) {
      setState(() {
        if (_progress == 100) {
          _progress = 0;
        } else {
          _progress += 0.25;
        }
        setState(() {});
      });
    });
  }

  @override
  void dispose() {
    _progressTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AquaScaffold(
      backgroundType: BackgroundType.lines,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          spacing: 8,
          children: [
            Wrap(
              spacing: 8,
              children: [
                Text('content'),
                AquaButton(child: Text('Primary Button'), onTap: () {}),
                AquaButton(
                  secondary: true,
                  child: Text('Secondary Button'),
                  onTap: () {},
                ),
              ],
            ),
            SizedBox(width: double.infinity, child: ProgressBar()),
            SizedBox(
              width: double.infinity,
              child: ProgressBar(value: _progress),
            ),
            AquaCheckbox(
              value: _checkboxValue,
              onChanged: (value) {
                setState(() {
                  _checkboxValue = value;
                });
              },
            ),
            ..._radioOptions.map(
              (option) => AquaRadioButton(
                value: option,
                onChanged: (value) {
                  setState(() => _radioOption = value);
                },
                groupValue: _radioOption,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
