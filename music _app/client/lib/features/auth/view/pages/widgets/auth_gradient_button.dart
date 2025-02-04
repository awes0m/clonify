import 'package:client/core/app_pallete.dart';
import 'package:flutter/material.dart';

class AuthGradientButton extends StatelessWidget {
  const AuthGradientButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          gradient: const LinearGradient(
              colors: [Pallete.gradient1, Pallete.gradient2],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight)),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(395, 55),
            shadowColor: Pallete.transparentColor,
            backgroundColor: Pallete.transparentColor),
        onPressed: () {},
        child: Text(
          'Sign Up',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
