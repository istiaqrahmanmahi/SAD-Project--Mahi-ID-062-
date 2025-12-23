



import 'package:flutter/material.dart';
import 'package:flutter_demos/widgets/input_field.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  _MyRegisterState createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
   TextEditingController nameController = TextEditingController();
   TextEditingController emailController = TextEditingController();
   TextEditingController phoneController = TextEditingController();
   TextEditingController passwardController = TextEditingController();


  final _formKey=GlobalKey<FormState>();

  String name ="";
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
                          
                                controller: phoneController,
                                keyboardType: TextInputType.number,
                                label: "Phone",
                                hint: "Enter Phone",
                                icon: Icons.phone,
                          
                                validator: (value) {
                                  if (value.isEmpty) {
                                  return "Field is empty!!";
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
                              height: 30,
                            ),
                              InputField(
                          
                                controller: passwardController,
                                keyboardType: TextInputType.visiblePassword,
                                label: "passward",
                                hint: "Enter passward",
                                icon: Icons.lock,
                          
                                validator: (value) {
                                  if (value.isEmpty) {
                                  return "Field is empty!!";
                                  }
                                  return null;
                                  },
                              ),
                        
                        
                            
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
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, 'login');
                                  },
                                  child: Text(
                                    'Sign In',
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

