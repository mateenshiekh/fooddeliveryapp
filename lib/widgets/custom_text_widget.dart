import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OwnTextFieldWidget extends StatelessWidget {
  OwnTextFieldWidget({
    Key key,
    this.controller,
    this.validator,
    this.readOnly = false,
    this.enabled = true,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,
    this.hintValue,
    this.onChanged,
    this.type,
    this.textCapitalization = TextCapitalization.none,
    this.maxLength,
    this.onSubmit,
    this.initialValue = null,
    this.focusNode = null,
    this.upperLabel = null,
    this.onEditingComplete,
    this.textInputAction,
    this.inputFormatters,
  }) : super(key: key);
  final String initialValue;
  final String hintValue;
  final TextEditingController controller;
  final validator;
  final bool obscureText;
  final Widget suffixIcon;
  final TextInputType type;
  final upperLabel;
  TextInputAction textInputAction;
  dynamic onChanged;
  dynamic onEditingComplete;
  var maxLength = 0;
  dynamic onSubmit;
  TextStyle labelTextStyle;
  FocusNode focusNode;
  bool readOnly;
  bool enabled;
  final List<TextInputFormatter> inputFormatters;
  TextCapitalization textCapitalization;
  Widget prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: TextFormField(
        initialValue: initialValue,
        inputFormatters: inputFormatters,
        readOnly: readOnly,
        enabled: enabled,
        style: new TextStyle(
            color: Colors.black),
        focusNode: focusNode,
        keyboardType: type,
        autocorrect: false,
        obscureText: obscureText,
        onEditingComplete: onEditingComplete,
        textCapitalization: textCapitalization,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(
              color: Colors.white,
              width: 0.5,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(
              color: Colors.red,
              width: 0.5,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(
              color: Colors.white,
              width: 0.5,
            ),
          ),
          border: new OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 0.5,
            ),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          filled: true,
          fillColor: Colors.white,
          prefixIcon: prefixIcon,
          labelText: upperLabel,
          labelStyle: TextStyle(
              color: Colors.black),
          hintText: hintValue,
          hintStyle: TextStyle(
              color: Colors.grey),
        ),
        validator: validator,
        controller: controller,
        onChanged: onChanged,
        maxLength: maxLength,
        onFieldSubmitted: onSubmit,
      ),
    );
  }
}
