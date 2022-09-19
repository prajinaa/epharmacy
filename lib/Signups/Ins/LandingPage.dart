import 'package:epharmacy/features/Signups/Ins/ForgotPassword.dart';
import 'package:epharmacy/features/Signups/Ins/RegisterPage.dart';
import 'package:epharmacy/common/widgets/custom_button.dart';
import 'package:epharmacy/common/widgets/custom_textfield.dart';
import 'package:epharmacy/constant/global_variables.dart';
import 'package:epharmacy/features/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final _loginFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  // final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

   void loginUser() {
    authService.loginUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(25.0, 70.0, 25.0, 25.0),
            child: Column(
              children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/Logo.png'),
                      fit: BoxFit.fill,
                    ),
                    color: Colors.green.shade500,
                    borderRadius: BorderRadius.all(
                      Radius.circular(80),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
         Container(
                  padding: const EdgeInsets.all(0.0),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                    key: _loginFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: _emailController,
                          hintText: 'Enter your email address',
                          labelText: 'Email',
                         ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: _passwordController,
                          hintText: 'Enter your password',
                          labelText: 'Password',
                        ),
                        const SizedBox(height: 10),
                        
                        CustomButton(
                          text: 'Log In',
                          onTap: () {
                            
                            if (_loginFormKey.currentState!.validate()) {
                              loginUser();
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(100, 181, 246, 1),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgotPassword()),
                    );
                  },
                  child: const Text('Forgot password?'),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: const Text('Don\'t have an account yet?',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        decoration: TextDecoration.underline,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(100, 181, 246, 1),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                    child: const Text('Register here.'),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(children: <Widget>[
                  Expanded(
                      child: Divider(
                    color: Colors.black,
                    height: 36,
                  )),
                  Text(" OR "),
                  Expanded(
                      child: Divider(
                    color: Colors.black,
                    height: 36,
                  )),
                ]),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: SizedBox(
                    width: 210,
                    height: 40,
                    child: ElevatedButton.icon(
                        icon: FaIcon(
                          FontAwesomeIcons.google,
                          color: Colors.white,
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.green.shade500,
                            onPrimary: Colors.white,
                            minimumSize: Size(double.infinity, 50)),
                        onPressed: () {},
                        label: const Text("Signup with Google")),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: SizedBox(
                    width: 210,
                    height: 40,
                    child: ElevatedButton.icon(
                        icon: FaIcon(
                          FontAwesomeIcons.user,
                          color: Colors.white,
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.green.shade500,
                            onPrimary: Colors.white,
                            minimumSize: Size(double.infinity, 50)),
                        onPressed: () {},
                        label: const Text("Continue with Google")),
                  ),
                ),
              ],
            ),
        
        ),
      ),
    );
  }
}
