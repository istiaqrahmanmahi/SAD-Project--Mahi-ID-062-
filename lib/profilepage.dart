
import 'package:flutter/material.dart';
import 'package:flutter_demos/widgets/input_field.dart';



//ctrl + shift + R =convert to stateless implementation
////ctrl + shift + R =convert to statefull implementation


class profile_Page extends StatefulWidget{
  const profile_Page({super.key});


  @override
  State<profile_Page> createState() =>_ProfilePageState();

}

class _ProfilePageState extends State<profile_Page>{
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final _formKey=GlobalKey<FormState>();

  String name =""; //inpute ta store hobe 
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      appBar: AppBar(
        title: Text('Profile Page'),
        backgroundColor: Colors.blueGrey,

      ),

      body: Center(
        child: Container(
         // height: 300,
         //width: 300,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.blue[300],
        
          ),
          child: Form(
            key: _formKey,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                InputField(
                 
                  controller:nameController, 
                  keyboardType:TextInputType.text, 
                  label: "Name", 
                  hint: "Enter name", 
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
                SizedBox(height: 20),
            
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
                SizedBox(height: 20),
            
                  ElevatedButton(
                    onPressed: (){
                      name ="Name is :${nameController.text}";
                      setState((){});
                    }, 
                    child:Text('Submit'),
                    ),
                    SizedBox(height: 20),

                  TextButton(
                     onPressed: () {
                         Navigator.pushNamed(context, 'Register');
                      },
                      child: Text(
                         "Go to Registration",
                          style: TextStyle(
                             decoration: TextDecoration.underline,
                             color: Colors.white,
                             fontSize: 16,
                           ),
                       ),
                    ),



                    Text(name),
                
                ],
            ),
          ),
        ),
      ),

    );
  }

}
