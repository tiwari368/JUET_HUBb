import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController passwordC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  child: Text(
                    "Login to your account",
                    style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Form(
                key: formkey,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("Please Enter Your Email");
                      }
                      // reg expression for email validation
                      if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                          .hasMatch(value)) {
                        return ("Please Enter a valid email");
                      }
                      return null;
                    },
                    onSaved: (value) {
                      emailC.text = value!;
                    },
                    keyboardType: TextInputType.emailAddress,
                    controller: emailC,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.mail),
                        contentPadding: EdgeInsets.all(10),
                        hintText: "Email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  validator: (value) {
                    RegExp regex = new RegExp(r'^.{6,}$');
                    if (value!.isEmpty) {
                      return ("Password is required for login");
                    }
                    if (!regex.hasMatch(value)) {
                      return ("Enter Valid Password(Min. 6 Character)");
                    }
                  },
                  onSaved: (value) {
                    passwordC.text = value!;
                  },
                  textInputAction: TextInputAction.done,
                  controller: passwordC,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.vpn_key),
                      suffixIcon: GestureDetector(
                        onTap: (() {}),
                      ),
                      contentPadding: EdgeInsets.all(10),
                      hintText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  obscureText: true,
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 20),
                  height: 70,
                  width: 320,
                  child: RaisedButton(
                    onPressed: (() {}),
                    color: Colors.blue.shade200,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "Login",
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                  )),
              GestureDetector(
                onTap: (() {}),
                child: Container(
                  margin: EdgeInsets.only(top: 12, left: 180),
                  child: Text(
                    "Forget Password ?",
                    style: TextStyle(color: Colors.black45, fontSize: 15),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 24),
                child: Text(
                  "OR",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
