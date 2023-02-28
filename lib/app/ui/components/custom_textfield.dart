import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final IconData iconPref;
  final bool isSecret;

  const CustomTextField({
    super.key,
    required this.labelText,
    required this.iconPref,
    this.isSecret = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = false;

  @override
  void initState() {
    obscureText = widget.isSecret;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 15.0,
      ),
      child: TextFormField(
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.iconPref),
          isDense: true,
          labelText: widget.labelText,
          suffixIcon: widget.isSecret
              ? IconButton(
                  onPressed: () {
                    setState(
                      () {
                        obscureText = !obscureText;
                      },
                    );
                  },
                  icon: Icon(
                    obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              18,
            ),
          ),
        ),
      ),
    );
  }
}
