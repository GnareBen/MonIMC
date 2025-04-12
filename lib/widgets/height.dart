import 'package:flutter/material.dart';

class HeightSlider extends StatefulWidget {
  final int initialHeight;
  final ValueChanged<int> onChanged;

  const HeightSlider({
    super.key,
    required this.initialHeight,
    required this.onChanged,
  });

  @override
  State<HeightSlider> createState() => _HeightSliderState();
}

class _HeightSliderState extends State<HeightSlider> {
  late int _currentHeight;

  @override
  void initState() {
    super.initState();
    _currentHeight = widget.initialHeight;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 220,
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const Text(
              "TAILLE",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            RichText(
              text: TextSpan(
                style: const TextStyle(fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: _currentHeight.toString(),
                    style: const TextStyle(fontSize: 60, color: Colors.green),
                  ),
                  const TextSpan(
                    text: "cm",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Slider(
              value: _currentHeight.toDouble(),
              min: 0,
              max: 250,
              activeColor: Colors.green,
              divisions: 250,
              label: _currentHeight.toString(),
              onChanged: (value) {
                setState(() => _currentHeight = value.toInt());
                widget.onChanged(_currentHeight);
              },
            ),
          ],
        ),
      ),
    );
  }
}
