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
        Slider(
          value: _currentValue,
          min: 1.0,
          max: 3.0,
          divisions: 2,
          label: _getSliderLabel(_currentValue),
          onChanged: (double value) {
            setState(() {
              _currentValue = value;
            });
          },
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
