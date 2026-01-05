



import 'package:flutter/material.dart';
import 'package:flutter_demos/login.dart';

import 'package:flutter_demos/auth_gate.dart';
import 'package:flutter_demos/widgets/input_field.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  _MyRegisterState createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
   final TextEditingController _nameController = TextEditingController();
   final TextEditingController _emailController = TextEditingController();
   final TextEditingController _phoneController = TextEditingController();
   final TextEditingController _PasswordController = TextEditingController();
   final TextEditingController _cpasswordController = TextEditingController();

   bool _isLoading =false;
   final _supabase=Supabase.instance.client;

  final _formKey=GlobalKey<FormState>();

  void register() async {
    String name = _nameController.text.trim();
    String email = _emailController.text.trim();
    String password = _PasswordController.text.trim();
    setState(() {
      _isLoading = true;
    });
    try {
     // print("try");
      final authResponse = await _supabase.auth.signUp(
        email: email,
        password: password,
      );
     // print("Auth: ${authResponse.user}");
      final user = authResponse.user;
      if (user != null) {
        // Save extra user info in profiles table
       // print("User: $user");
        await _supabase.from('profiles').insert({
          'id': user.id, // Link to auth.users
          'name': name,
          'email': email,
        });
      }
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Registered Successfully!!")));
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyLogin()),
      );
    } on AuthApiException catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.message)));
    }
    _nameController.clear();
    _emailController.clear();
    _PasswordController.clear();
    _cpasswordController.clear();
    setState(() {
      _isLoading = false;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/register.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 35, top: 30),
              child: Text(
                'Create\nAccount',
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35),
                      child:Form(
                        key: _formKey,

                        child: Column(
                          children: [
                        
                            InputField(
                          
                                controller:_nameController, 
                                keyboardType:TextInputType.text, 
                                label:"Name", 
                                hint: "Enter Name", 
                                icon: Icons.person,
                          
                                validator: (value) {
                                  if (value==null||value.isEmpty) {
                                  return "Field is empty!!";
                                  } else if (!RegExp(r"^[A-Za-z .]{3,}$").hasMatch(value)) {
                                  return "Invalid Format!!";
                                  }
                                  return null;
                              }, 
                               
                              ),
                              SizedBox(
                              height: 30,
                            ),
                        
                              InputField(
                          
                                controller: _phoneController,
                                keyboardType: TextInputType.number,
                                label: "Phone",
                                hint: "Enter Phone",
                                icon: Icons.phone,
                          
                                validator: (value) {
                                  if (value==null|| value.isEmpty) {
                                  return "Field is empty!!";
                                  }
                                  return null;
                                  },
                              ),
                        
                        
                              SizedBox(
                              height: 30,
                            ),
                        
                             InputField(
                          
                                controller: _emailController,
                                keyboardType: TextInputType.visiblePassword,
                                label: "Email",
                                hint: "Enter Email",
                                icon: Icons.email,
                          
                                validator: (value) {
                                  if (value==null|| value.isEmpty) {
                                  return "Field is empty!!";
                                  }
                                  return null;
                                  },
                              ),
                        
                              SizedBox(
                              height: 30,
                            ),
                              
                              InputField(
                      controller: _PasswordController,
                      keyboardType: TextInputType.visiblePassword,
                      label: "Password",
                      hint: "Enter Password",
                      icon: Icons.lock,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter password";
                        }
                        if (value.length < 8) {
                          return "Length must be more then 8";
                        }
                        if (!RegExp(
                          r'^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\S+$).{8,}$',
                        ).hasMatch(value)) {
                          return "Enter a strong password!!";
                        }
                        if (_PasswordController.text !=
                            _cpasswordController.text) {
                          return "password and confirm password does't match";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),

                    InputField(
                      controller: _cpasswordController,
                      keyboardType: TextInputType.visiblePassword,
                      label: "Confirm Password",
                      hint: "Enter Confirm Password",
                      icon: Icons.lock,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter confirm password";
                        }
                        if (value.length < 8) {
                          return "Length must be more then 8";
                        }
                        if (!RegExp(
                          r'^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\S+$).{8,}$',
                        ).hasMatch(value)) {
                          return "Enter a strong password!!";
                        }
                        if (_PasswordController.text !=
                            _cpasswordController.text) {
                          return "password and confirm password does't match";
                        }
                        return null;
                      },
                    ),
                        
                        
                            /*
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 27,
                                      fontWeight: FontWeight.w700),
                                ),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Color.fromARGB(255, 221, 27, 43),
                                  child: IconButton(
                                      color: Colors.white,
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.arrow_forward,
                                      )),
                                )
                              ],
                            ),
                            */
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                       context,
                                       MaterialPageRoute(builder: (_) => const MyLogin()),
                                    );
                                    if(_formKey.currentState!.validate()){
                                      register();
                                    }
                                  },
                                  child:
                                     _isLoading
                                        ?CircularProgressIndicator() 
                                        : Text(
                                               'Register',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Colors.white,
                                        fontSize: 18),
                                  ),
                                 
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



