import 'package:flutter/material.dart';

class ComplicationSlider extends StatefulWidget {
  @override
  _ComplicationSliderState createState() => _ComplicationSliderState();
}

class _ComplicationSliderState extends State<ComplicationSlider> {
  double _currentValue = 1.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Set Your Overthinking Level',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: Colors.teal[50], // Semi-transparent background
            borderRadius: BorderRadius.circular(8),
          ),
          child: Slider(
            value: _currentValue,
            min: 1.0,
            max: 3.0,
            divisions: 2,
            label: _getSliderLabel(_currentValue),
            activeColor: Colors.teal,
            inactiveColor: Colors.teal[100],
            onChanged: (double value) {
              setState(() {
                _currentValue = value;
              });
            },
          ),
        ),
      ],
    );
  }

  String _getSliderLabel(double value) {
    switch (value.toInt()) {
      case 1:
        return 'Mildly Annoying';
      case 2:
        return 'Stressful';
      case 3:
        return 'Existential Crisis';
      default:
        return '';
    }
  }
}