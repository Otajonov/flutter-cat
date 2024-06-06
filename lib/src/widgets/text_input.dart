import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextPut extends StatelessWidget {

  final dynamic controller;
  final String hint;
  final TextInputType? type;
  final String? prefixText;
  final List<TextInputFormatter>? formatters;
  final ValueChanged? onChanged;
  const TextPut({Key? key,
    this.controller,
    this.hint = "Type here ...",
    this.type,
    this.formatters,
    this.onChanged,
    this.prefixText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Container(
        padding: const EdgeInsets.symmetric(
            horizontal: 3, vertical: 3),
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(.05),
          borderRadius: const BorderRadius.vertical(
              top: Radius.circular(12), bottom: Radius
              .circular(12)),
        ),
        child: TextField(
          inputFormatters: formatters,
          obscureText: type == TextInputType.visiblePassword,
          controller: controller,
          //autofocus: true,
          minLines: 1,
          maxLines: 1,
          keyboardType: type,
          style: const TextStyle(fontSize: 20),
          decoration: InputDecoration(
            prefixText: prefixText,
            filled: true,
            fillColor: Colors.transparent,
            hintText: hint,
            hintStyle: const TextStyle(fontSize: 18),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.only(
                left: 12.0),
          ),

          onChanged: onChanged,
        ),
      );
  }
}
