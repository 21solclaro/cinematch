import 'package:flutter/material.dart';

class RuntimeScreen extends StatefulWidget {
  const RuntimeScreen({super.key});

  @override
  _RuntimeScreenState createState() => _RuntimeScreenState();
}

class _RuntimeScreenState extends State<RuntimeScreen> {
  double _selectedDuration = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('視聴時間を選択'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('0h'),
                Text('4h'),
              ],
            ),
          ),
          Slider(
            value: _selectedDuration,
            min: 0,
            max: 4,
            divisions: 8,
            label: '${_selectedDuration.toStringAsFixed(1)}h',
            onChanged: (double value) {
              setState(() {
                _selectedDuration = value;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('選択された時間: ${_selectedDuration.toStringAsFixed(1)}時間'),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(32.0),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
          ),
          child: const Text('次へ'),
        ),
      ),
    );
  }
}
