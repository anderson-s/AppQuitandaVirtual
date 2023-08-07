import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final Icon icon;
  final bool isSecret;
  final List<TextInputFormatter> inputFormatters;
  const CustomTextField({
    super.key,
    required this.icon,
    required this.labelText,
    this.isSecret = false,
    required this.inputFormatters,
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
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        inputFormatters: widget.inputFormatters,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: widget.labelText,
          suffixIcon: widget.isSecret
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  icon: Icon(
                    obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                )
              : null,
          prefixIcon: widget.icon,
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
    );
  }
}
