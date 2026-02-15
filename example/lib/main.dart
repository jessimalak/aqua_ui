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
    return const AquaApp(title: 'Aqua app example', home: HomeScreen(), debugShowCheckedModeBanner: false);
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
  final AquaTabController tabController = AquaTabController(length: 3);

  bool _checkbox1Value = true;
  bool _checkbox2Value = false;

  List<String> _radioOptions = ['One', 'Two', 'Tree'];
  String _radioOption = 'One';
  BackgroundType _backgroundType = BackgroundType.lines;
  TabStyle _tabStyle = TabStyle.segmented;

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
      backgroundType: _backgroundType,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          spacing: 8,
          children: [
            Row(
              children: [
                Text('Background type: '),
                AquaDropdownButton(
                  value: _backgroundType,
                  items:
                      BackgroundType.values
                          .map((type) => AquaDropdownMenuItem(value: type, child: Text(type.name)))
                          .toList(),
                  onChanged: (value) {
                    if (value == null) return;
                    setState(() => _backgroundType = value);
                  },
                ),
              ],
            ),
            SizedBox(width: double.infinity, child: ProgressBar()),
            Text('Progress: ${_progress.toStringAsFixed(1)}%'),
            SizedBox(width: double.infinity, child: ProgressBar(value: _progress)),
            Row(
              children: [
                Text("Tab style: "),
                AquaDropdownButton(
                  value: _tabStyle,
                  items:
                      TabStyle.values
                          .map((style) => AquaDropdownMenuItem(value: style, child: Text(style.name)))
                          .toList(),
                  onChanged: (value) {
                    if (value == null) return;
                    setState(() => _tabStyle = value);
                  },
                ),
              ],
            ),
            AquaTabView(
              tabStyle: _tabStyle,
              controller: tabController,
              tabs: [AquaTab(label: 'Controls'), AquaTab(label: 'Tab 2'), AquaTab(label: 'Tab 3')],
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("Radio Buttons", style: TextStyle(fontWeight: FontWeight.bold)),
                    Wrap(
                      spacing: 8,
                      children: [
                        ..._radioOptions.map(
                          (option) => Row(
                            spacing: 4,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AquaRadioButton(
                                value: option,
                                onChanged: (value) {
                                  setState(() => _radioOption = value);
                                },
                                groupValue: _radioOption,
                              ),
                              Text(option),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text("Buttons", style: TextStyle(fontWeight: FontWeight.bold)),
                    Wrap(
                      spacing: 8,
                      children: [
                        AquaButton(child: Text('Primary Button'), onTap: () {}),
                        AquaButton(secondary: true, child: Text('Secondary Button'), onTap: () {}),
                        AquaButton(onTap: null, child: Text('Disabled button')),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text("Checkbox", style: TextStyle(fontWeight: FontWeight.bold)),
                    Wrap(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AquaCheckbox(
                              value: _checkbox1Value,
                              onChanged: (value) {
                                setState(() {
                                  _checkbox1Value = value;
                                });
                              },
                            ),
                            Text('Checkbox 1'),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AquaCheckbox(
                              value: _checkbox2Value,
                              onChanged: (value) {
                                setState(() {
                                  _checkbox2Value = value;
                                });
                              },
                            ),
                            Text('Checkbox 2'),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [AquaCheckbox(value: false, onChanged: null), Text('Disabled checkbox')],
                        ),
                      ],
                    ),
                  ],
                ),
                const Text("Tab 2 content"),
                const Text("Tab 3 content"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
