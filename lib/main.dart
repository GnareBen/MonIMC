import 'package:flutter/material.dart';
import 'package:mon_imc/screens/result.dart';
import 'package:mon_imc/theme/app_theme.dart';
import 'package:mon_imc/widgets/age.dart';
import 'package:mon_imc/widgets/confirmation_button.dart';
import 'package:mon_imc/widgets/gender.dart';
import 'package:mon_imc/widgets/height.dart';
import 'package:mon_imc/widgets/weight.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mon IMC',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Gender? selectedGender;
  int age = 20;
  int height = 177;
  int weight = 70;

  double calculateBMI(int height, int weight) {
    final heightInMeters = height / 100.0;
    return weight / (heightInMeters * heightInMeters);
  }

  String getBMIStatus(double bmi) {
    if (bmi <= 0) return "Données invalides";
    if (bmi < 18.5) return "Insuffisance pondérale";
    if (bmi < 25) return "Poids normal";
    if (bmi < 30) return "Surpoids";
    if (bmi < 35) return "Obésité modérée";
    if (bmi < 40) return "Obésité sévère";
    return "Obésité morbide";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Mon IMC',
          style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GenderCard(
                  icon: Icons.male,
                  label: "Homme",
                  isSelected: selectedGender == Gender.male,
                  onTap: () => setState(() => selectedGender = Gender.male),
                ),
                GenderCard(
                  icon: Icons.female,
                  label: "Femme",
                  isSelected: selectedGender == Gender.female,
                  onTap: () => setState(() => selectedGender = Gender.female),
                ),
              ],
            ),
            const SizedBox(height: 20),
            HeightSlider(
              initialHeight: height,
              onChanged: (newHeight) => setState(() => height = newHeight),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AgeSelector(
                  initialAge: age,
                  onChanged: (newAge) => setState(() => age = newAge),
                ),
                WeightSelector(
                  initialWeight: weight,
                  onChanged: (newWeight) => setState(() => weight = newWeight),
                ),
              ],
            ),
            const SizedBox(height: 20),
            PrimaryButton(
              text: "Calculer mon IMC",
              onPressed: () {
                final bmi = calculateBMI(height, weight);
                final bmiStatus = getBMIStatus(bmi);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) =>
                            Result(imc: bmi, bmiStatus: bmiStatus),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

enum Gender { male, female }
