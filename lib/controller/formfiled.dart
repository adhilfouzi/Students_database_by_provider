import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldBlue extends StatelessWidget {
  final String textcontent;
  final String? Function(String?)? validator;
  final IconData? preicondata;
  final IconData? posticondata;
  final TextEditingController? controller;
  final TextInputType? keyType;
  final bool? obscureText;
  final bool? enabled;
  final void Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;

  const TextFieldBlue(
      {super.key,
      required this.textcontent,
      this.preicondata,
      this.posticondata,
      this.controller,
      this.validator,
      this.keyType,
      this.obscureText,
      this.enabled,
      this.onChanged,
      this.inputFormatters});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            textcontent,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            inputFormatters: inputFormatters,
            keyboardType: keyType,
            validator: validator,
            controller: controller,
            onChanged: onChanged,
            decoration: InputDecoration(
              filled: true,
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40.0),
                borderSide: const BorderSide(color: Colors.red, width: 2),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40.0),
                borderSide:
                    const BorderSide(color: Colors.greenAccent, width: 2),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              enabledBorder: const OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 102, 102, 102)),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
          ),
        ),
      ],
    );
  }
}
