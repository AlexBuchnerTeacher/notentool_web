import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Dummy RBSColors

class RBSColors {
  static const Color primary = Colors.blue;
  static const Color secondary = Colors.green;
  static const Color textOnRed = Colors.white;
  static const Color dynamicRed = Colors.red;
  static const Color offwhite = Color(0xFFF8F8F8);
  static const Color courtGreen = Colors.greenAccent;
  static const Color growingElder = Colors.deepPurple;
  static const Color error = Colors.redAccent;
  static const Color success = Colors.green;
  static const Color white = Colors.white;
}

class RBSTypography {
  static const TextStyle h2 = TextStyle(fontSize: 28, fontWeight: FontWeight.bold);
  static const TextStyle h3 = TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
  static const TextStyle h4 = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  static const TextStyle headline = TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  static const TextStyle body = TextStyle(fontSize: 16);
  static const TextStyle bodyMedium = TextStyle(fontSize: 16);
  static const TextStyle bodySmall = TextStyle(fontSize: 12);
}

class RBSSpacing {
  static const double small = 8.0;
  static const double sm = 8.0;
  static const double medium = 16.0;
  static const double md = 16.0;
  static const double large = 32.0;
  static const double lg = 32.0;
  static const double xl = 48.0;
  static const double xxl = 64.0;
}

class RBSBorderRadius {
  static const BorderRadius small = BorderRadius.all(Radius.circular(4));
  static const BorderRadius medium = BorderRadius.all(Radius.circular(8));
  static const BorderRadius large = BorderRadius.all(Radius.circular(16));
}

class RBSDialog {
  final String? title;
  final Widget? content;
  final List<Widget>? actions;
  const RBSDialog({this.title, this.content, this.actions});

  Widget build(BuildContext context) {
    return AlertDialog(
      title: title != null ? Text(title!) : null,
      content: content,
      actions: actions,
    );
  }
}

class RBSInput extends StatelessWidget {
  final String? hint;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final bool obscureText;
  final String? Function(String?)? validator;
  final void Function(String)? onSubmitted;
  final TextEditingController? controller;
  const RBSInput({Key? key, this.hint, this.keyboardType, this.prefixIcon, this.obscureText = false, this.validator, this.onSubmitted, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: prefixIcon,
      ),
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      onFieldSubmitted: onSubmitted,
    );
  }
}

class RBSButton extends StatelessWidget {
  final bool isLoading;
  final Widget? icon;
  final Color? color;
  final VoidCallback? onPressed;
  final String label;
  const RBSButton({Key? key, this.isLoading = false, this.icon, this.color, this.onPressed, this.label = 'Button'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: isLoading ? null : onPressed,
      icon: icon ?? const SizedBox.shrink(),
      label: isLoading ? const CircularProgressIndicator() : Text(label),
      style: color != null ? ButtonStyle(backgroundColor: MaterialStateProperty.all(color)) : null,
    );
  }
}

class RBSTag extends StatelessWidget {
  final String label;
  const RBSTag({required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Chip(label: Text(label));
  }
}

class RBSFilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback? onSelected;
  final Color? color;
  const RBSFilterChip({required this.label, this.selected = false, this.onSelected, this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(label),
      selected: selected,
      onSelected: (_) => onSelected?.call(),
      backgroundColor: color,
    );
  }
}
