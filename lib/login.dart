


import 'package:flutter/material.dart';
import 'package:flutter_demos/registration.dart';

import 'package:flutter_demos/widgets/input_field.dart';
import 'package:flutter_demos/homePage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {

 final TextEditingController _PasswordController = TextEditingController();
 final TextEditingController _emailController = TextEditingController();
 final _formKey=GlobalKey<FormState>();
 bool _isLoading=false;
 final _supabase=Supabase.instance.client;

  void login() async {
    String email = _emailController.text.trim();
    String password = _PasswordController.text.trim();
    setState(() {
      _isLoading = true;
    });
    try {
      await _supabase.auth.signInWithPassword(
        email: email, 
        password:password
        );
      Navigator.pushReplacementNamed(context, 'home');

      _emailController.clear();
      _PasswordController.clear();
    } on AuthApiException catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.message)));
    }
    setState(() {
      _isLoading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/login.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(),
            Container(
              padding: EdgeInsets.only(left: 35, top: 130),
              child: Text(
                'Welcome\nBack',
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35),

                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [


                            InputField(
                        
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              label: "Email",
                              hint: "Enter Email",
                              icon: Icons.email,
                        
                              validator: (value) {
                                if (value.isEmpty) {
                                return "Field is empty!!";
                                }
                                return null;
                                },
                            
                            ),
                        
                            InputField(
                        
                              controller:_PasswordController, 
                              keyboardType:TextInputType.visiblePassword, 
                              label:"Passward", 
                              hint: "Enter password", 
                              icon: Icons.lock,
                        
                              validator: (value) {
                                if (value==null||value.isEmpty) {
                                return "Field is empty!!";
                                } 
                                return null;
                                          }, 
                             
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                   onPressed: (){
                                   if (_formKey.currentState!.validate()) {
                                   login();
                                  }
                                  }, 
                                  child:
                                  _isLoading
                                      ?CircularProgressIndicator()

                                      :Text('Login'),
                                ),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Color.fromARGB(255, 111, 135, 202),
                                  child: IconButton(
                                      color: Colors.white,
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.arrow_forward,
                                      )),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                               
                                GestureDetector(
                                  onTap:
                                      () => Navigator.push(
                                       context,
                                       MaterialPageRoute(
                                         builder: (context) => MyRegister(),
                                       ),
                                    ),
                                  child: Text("Don't have an account? Register"),
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Forgot Password',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Color(0xff4c505b),
                                        fontSize: 18,
                                      ),
                                    )),
                        
                        
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

