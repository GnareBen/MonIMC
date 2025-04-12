import 'package:flutter/material.dart';

class WeightSelector extends StatefulWidget {
  final int initialWeight;
  final ValueChanged<int> onChanged;

  const WeightSelector({
    super.key,
    required this.initialWeight,
    required this.onChanged,
  });

  @override
  State<WeightSelector> createState() => _WeightSelectorState();
}

class _WeightSelectorState extends State<WeightSelector> {
  late int _currentWeight;
  final int _minWeight = 1;

  @override
  void initState() {
    super.initState();
    _currentWeight = widget.initialWeight;
  }

  void _updateWeight(int newWeight) {
    if (newWeight >= _minWeight) {
      setState(() => _currentWeight = newWeight);
      widget.onChanged(_currentWeight);
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
              "POIDS",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            Text(
              _currentWeight.toString(),
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
                  () => _updateWeight(_currentWeight - 1),
                ),
                _buildIconButton(
                  Icons.add,
                  () => _updateWeight(_currentWeight + 1),
                ),
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
