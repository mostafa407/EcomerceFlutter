import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({
    super.key,
    required this.hintText,
    required this.controller,
    required this.funcValidator,
    required this.iconData,
    this.isPassword = false,
    this.isObsecure = false,
    this.changeVisibality,
    this.isPhone = false,
    this.countryFlag,
    this.keyboardType = TextInputType.text,
  });

  final String hintText;
  final TextEditingController controller;
  final FormFieldValidator<String> funcValidator;
  final IconData iconData;
  final bool isPassword;
  final bool isObsecure;
  final Function? changeVisibality;
  final bool isPhone;
  final Function? countryFlag;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Material(
      shadowColor: Colors.black,
      color: Colors.white,
      elevation: 20,
      child: TextFormField(
          keyboardType: keyboardType,
          controller: controller,
          decoration: InputDecoration(
              suffixIcon: isPassword
                  ? GestureDetector(
                      onTap: () {
                        changeVisibality!();
                      },
                      child: Icon(
                          isObsecure ? Icons.visibility : Icons.visibility_off))
                  : null,
              prefixIcon: isPhone
                  ? CountryCodePicker(
                      onChanged: (CountryCode value) {
                        countryFlag!(value);
                      },
                      // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                      initialSelection: 'EG',
                      padding: EdgeInsets.all(0),
                      showFlag: false,
                      favorite: ['+39', 'EG'],
                      // optional. Shows only country name and flag
                      showCountryOnly: false,
                      // optional. Shows only country name and flag when popup is closed.
                      showOnlyCountryWhenClosed: false,
                      // optional. aligns the flag and the Text left
                      alignLeft: false,
                    )
                  : Icon(
                      iconData,
                      color: Colors.red,
                    ),

              contentPadding: const EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
              hintText: hintText,
              fillColor: Colors.white,
              filled: true,
              enabled: true,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)))),
    );
  }
}
