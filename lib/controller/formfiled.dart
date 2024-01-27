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
            //enabled: enabled == null ? true : false,
            //obscureText: obscureText == null ? false : true,
            keyboardType: keyType,
            validator: validator,
            controller: controller,
            onChanged: onChanged,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.black12,
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40.0),
                borderSide: const BorderSide(color: Colors.red, width: 2),
              ),
              // enabledBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(40.0),
              //   borderSide: const BorderSide(color: Colors.black, width: 2),
              // ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40.0),
                borderSide:
                    const BorderSide(color: Colors.greenAccent, width: 2),
              ),
              iconColor: Colors.greenAccent,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              prefixIcon: preicondata != null
                  ? Icon(preicondata, size: 20, color: Colors.green)
                  : null,
              suffixIcon: posticondata != null
                  ? Icon(posticondata, size: 10, color: Colors.green)
                  : null,
              // hintText: textcontent,
              // hintStyle: const TextStyle(
              //     //color: Color.fromRGBO(0, 0, 0, 0.5),
              //     fontFamily: 'Raleway',
              //     fontSize: 10),
            ),
          ),
        ),
      ],
    );
  }
}
