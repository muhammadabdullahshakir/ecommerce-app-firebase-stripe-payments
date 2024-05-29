import 'package:ecomapp/components/custom_button.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              "Hi there",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          CustomButton(text: "SIGN OUT", onPress: () {})
        ],
      ),
    );
  }
}
