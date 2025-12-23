


import 'package:flutter/material.dart';
import 'package:flutter_demos/widgets/input_field.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final _formKey=GlobalKey<FormState>();

  String name ="";

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
                        
                              controller:nameController, 
                              keyboardType:TextInputType.text, 
                              label:"Name", 
                              hint: "Enter Name", 
                              icon: Icons.person,
                        
                              validator: (value) {
                                if (value.isEmpty) {
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
                        
                              controller: emailController,
                              keyboardType: TextInputType.visiblePassword,
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
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                   onPressed: (){
                                   name ="Name is :${nameController.text}";
                                   setState((){});
                                  }, 
                                  child:Text('Login'),
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
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, 'register');
                                  },
                                  child: Text(
                                    'Sign Up',
                                     textAlign: TextAlign.left,
                                     style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Color.fromARGB(255, 17, 201, 60),
                                        fontSize: 18),
                                  ),
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

