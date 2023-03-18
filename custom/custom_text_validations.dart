import 'package:flutter/material.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            TextField(
              controller: _passwordController,
            ),
            ValueListenableBuilder(
                valueListenable: _passwordController,
                builder: (context, textEditingValue, _) {
                  final password = textEditingValue.text;
                  final hasAtLeastEightChars = password.length >= 8;
                  final hasUpperAndLowerCaseChars =
                      password.contains(RegExp('[A-Z]'));
                  final hasNumber = password.contains(RegExp('[0-9]'));
                  final hasSpecialChar =
                      password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
                  return PasswordValidator(
                    hasAtLeastEightChars: hasAtLeastEightChars,
                    hasUpperAndLowerCaseChars: hasUpperAndLowerCaseChars,
                    hasNumber: hasNumber,
                    hasSpecialChar: hasSpecialChar,
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class PasswordValidator extends StatelessWidget {
  final bool hasAtLeastEightChars;
  final bool hasUpperAndLowerCaseChars;
  final bool hasNumber;
  final bool hasSpecialChar;

  const PasswordValidator(
      {super.key,
      required this.hasAtLeastEightChars,
      required this.hasUpperAndLowerCaseChars,
      required this.hasNumber,
      required this.hasSpecialChar});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        10.sbh,
        PasswordConditionIndicator(
          isValid: hasAtLeastEightChars,
          title: 'At least 8 characters',
        ),
        5.sbh,
        PasswordConditionIndicator(
          isValid: hasUpperAndLowerCaseChars,
          title: 'Upper and lower case characters',
        ),
        5.sbh,
        PasswordConditionIndicator(
          isValid: hasNumber,
          title: '1 or more numbers',
        ),
        5.sbh,
        PasswordConditionIndicator(
          isValid: hasSpecialChar,
          title: '1 or more special characters',
        ),
      ],
    );
  }
}

class PasswordConditionIndicator extends StatelessWidget {
  final bool isValid;
  final String title;

  const PasswordConditionIndicator({
    super.key,
    required this.isValid,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return isValid
        ? Row(children: [
            const Icon(
              Icons.check,
              size: 15,
              color: Colors.green,
            ),
            10.sbw,
            Text(
              title,
              style: const TextStyle(color: Colors.green),
            ),
          ])
        : Row(children: [
            const Icon(
              Icons.check,
              size: 15,
            ),
            10.sbw,
            Text(
              title,
            ),
          ]);
  }
}
