import 'package:flutter/material.dart';

//ei file tar kaj holo je ami bar bar use korbo

class InputField extends StatelessWidget {

  final controller, keyboardType, label, hint, icon, validator;

  const InputField({
   super.key,
   required this.controller,
   required this.keyboardType,
   required this.label,
   required this.hint,
   required this.icon, 
   //required String label,
   required this.validator,
  });


  @override
  Widget build(BuildContext context) {
    return TextFormField(
                controller:controller ,
                keyboardType: keyboardType,// kun smy kun dhoroner input nibo ta suggest korbe
                obscureText: keyboardType == TextInputType.visiblePassword ? true: false, //input field hidden korar janno
                validator: validator,

                decoration: InputDecoration(
                  labelText: label,
                  hintText: hint,
                  prefixIcon: Icon(icon),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                ),
    );

  }
}