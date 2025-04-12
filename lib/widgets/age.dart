import 'package:flutter/material.dart';

class AgeSelector extends StatefulWidget {
  final int initialAge;
  final ValueChanged<int> onChanged;

  const AgeSelector({
    super.key,
    required this.initialAge,
    required this.onChanged,
  });

  @override
  State<AgeSelector> createState() => _AgeSelectorState();
}

class _AgeSelectorState extends State<AgeSelector> {
  late int _currentAge;
  final int _minAge = 1;
  final int _maxAge = 120;

  @override
  void initState() {
    super.initState();
    _currentAge = widget.initialAge.clamp(_minAge, _maxAge);
  }

  void _updateAge(int newAge) {
    final clampedAge = newAge.clamp(_minAge, _maxAge);
    if (_currentAge != clampedAge) {
      setState(() => _currentAge = clampedAge);
      widget.onChanged(_currentAge);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 220,
        width: 180,
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const Text(
              "AGE",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            Text(
              _currentAge.toString(),
              style: const TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildIconButton(
                  Icons.remove,
                  () => _updateAge(_currentAge - 1),
                ),
                _buildIconButton(Icons.add, () => _updateAge(_currentAge + 1)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData icon, VoidCallback onPressed) {
    return IconButton(
      icon: Icon(icon),
      color: Colors.green,
      iconSize: 40,
      style: IconButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(45),
          side: const BorderSide(color: Colors.green),
        ),
      ),
      onPressed: onPressed,
    );
  }
}
