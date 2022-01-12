import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class InputBuilderText extends StatelessWidget {
  const InputBuilderText({
    Key? key,
    required this.name,
    this.label,
    this.hint = '',
    this.maskText = false,
    this.isEmail = false,
    this.isPhone = false,
    this.isNumber = false,
    this.isVerifPass = false,
    this.autoValidate = false,
    this.isRequired = true,
    this.readOnly = false,
    this.controller,
    this.onChanged,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.suffixIconConstraints,
    this.onEditingComplete,
    this.onTap,
    this.errorText,
    this.border,
    this.hintColor,
    this.textColor,
    this.prefixText,
    this.suffixText,
    this.prefixIcon,
    this.prefixIconConstraints,
    this.textInputAction = TextInputAction.next,
    this.onSubmitted,
    this.initialValue,
    this.focusNode,
    this.valueTransformer,
    this.strEqual,
  }) : super(key: key);

  static String? value;
  final String name;
  final String? label;
  final String hint;
  final bool maskText;
  final bool isEmail;
  final bool isPhone;
  final bool isNumber;
  final bool isVerifPass;
  final bool autoValidate;
  final bool isRequired;
  final bool readOnly;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Function()? onEditingComplete;
  final int maxLines;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final BoxConstraints? suffixIconConstraints;
  final String? errorText;
  final InputBorder? border;
  final Color? hintColor;
  final Color? textColor;
  final String? prefixText;
  final String? suffixText;
  final Widget? prefixIcon;
  final BoxConstraints? prefixIconConstraints;
  final TextInputAction textInputAction;
  final ValueChanged<String?>? onSubmitted;
  final String? initialValue;
  final FocusNode? focusNode;
  final Function()? onTap;
  final Function(String?)? valueTransformer;
  // final String? Function(dynamic)? validator;
  final String? strEqual;
  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      onSubmitted: onSubmitted,
      name: name,
      onEditingComplete: onEditingComplete,
      focusNode: focusNode,
      initialValue: initialValue,
      onTap: onTap,
      valueTransformer: valueTransformer,
      decoration: InputDecoration(
        errorText: errorText,
        prefixIcon: prefixIcon,
        suffixText: suffixText,
        suffixIcon: suffixIcon,
        prefixText: prefixText,
        suffixIconConstraints: suffixIconConstraints,
        labelText: label,
        hintText: hint,
        hintStyle: TextStyle(
          color: hintColor ?? Colors.black45,
        ),
        enabledBorder: border ??
            UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
        labelStyle: TextStyle(
          color: Colors.black45,
        ),
        prefixStyle: TextStyle(
          color: Colors.black87,
          fontSize: 14,
        ),
        border: border,
      ),
      maxLines: maxLines,
      obscureText: maskText,
      style: TextStyle(
        color: textColor ?? Colors.black87,
        fontSize: 14,
      ),
      readOnly: readOnly,
      controller: controller,
      autovalidateMode: autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
      onChanged: (val) {
        if (onChanged != null) {
          try {
            value = onChanged!(val!);
          } catch (e) {
            onChanged!(val!).then((val) {
              value = val;
            });
          }
        }
      },
      validator: FormBuilderValidators.compose([
        if (isRequired) FormBuilderValidators.required(context),
        if (isEmail) FormBuilderValidators.email(context),
        if (isPhone || isNumber) FormBuilderValidators.numeric(context),
        // if (isVerifPass)
        //   FormBuilderValidators.equal(context, value != null ? value! : '',
        //       errorText: 'Value must be equal to password'),
        if (strEqual != null) FormBuilderValidators.equal(context, strEqual!, errorText: 'Value must be equal to password'),
      ]),
      textInputAction: textInputAction,
      keyboardType: isPhone || isNumber ? TextInputType.number : keyboardType,
    );
  }
}
