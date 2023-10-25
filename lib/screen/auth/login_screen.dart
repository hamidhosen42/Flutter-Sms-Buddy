// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sms_buddy/screen/create_post.dart';

import '../../widgets/custom_login_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.green.shade700,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(15),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100,
                ),
                Center(
                    child: Text(
                  "Sign In",
                  style: TextStyle(fontSize: 30, color: Colors.black),
                )),
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Email",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      prefixIconColor: Colors.white,
                      hintText: "Enter your Email",
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Password",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      prefixIconColor: Colors.white,
                      hintText: "Enter your Password",
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                ),
                SizedBox(
                  height: 15,
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {},
                      child: Text(
                        "Forget Password",
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                    )),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Theme(
                        data: Theme.of(context)
                            .copyWith(unselectedWidgetColor: Colors.white),
                        child: Checkbox(
                            checkColor: Colors.white,
                            activeColor: Colors.blue,
                            value: isChecked,
                            onChanged: (value) {
                              setState(() {
                                isChecked = value!;
                              });
                            })),
                    Text("Remember me",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            color: Colors.white)),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (contex)=>CreatePostScreen()));
                  },
                  child: customButton(level: "Login")),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text("- Or -",
                      style: TextStyle(fontSize: 17, color: Colors.white)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text("Stay in with",
                      style: TextStyle(fontSize: 17, color: Colors.white)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(
                          "https://seeklogo.com/images/F/facebook-icon-logo-03865A9BA2-seeklogo.com.png"),
                    ),
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(
                          "https://banner2.cleanpng.com/20201008/rtv/transparent-google-suite-icon-google-icon-5f7f985ccd60e3.5687494416021975968412.jpg"),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have a account?",
                        style: TextStyle(fontSize: 17, color: Colors.white)),
                    InkWell(
                      onTap: (){

                      },
                      child: Text(" Sign Up",
                          style: TextStyle(fontSize: 17, color: Colors.white)),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
