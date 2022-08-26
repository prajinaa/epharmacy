import 'package:epharmacy/Signups/Ins/RegisterPage1.dart';
import 'package:epharmacy/common/widgets/custom_button.dart';
import 'package:epharmacy/common/widgets/custom_textfield.dart';
import 'package:epharmacy/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _signupFormKey = GlobalKey<FormState>();
  //
  final AuthService authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  // dispose method --so that we dont have memory leaks
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void signUpUser() {
    authService.signUpUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
      name: _nameController.text,
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0), // here the desired height
        child: AppBar(
          title: new Padding(
            padding: const EdgeInsets.only(left: 200.0),
            child: new Text(
              "Luveen",
              style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontSize: 30.0,
                  color: Colors.white),
            ),
          ),
          automaticallyImplyLeading: true,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25.0, 35.0, 25.0, 25.0),
        child: Form(
            key: _signupFormKey,
            child: Column(
              children: [
                CustomTextField(
                  controller: _emailController,
                  hintText: 'Email',
                ),
                //  const Text(
                // "Enter your email address:",
                // style: TextStyle(fontStyle: FontStyle.normal,fontSize: 20,color: Colors.black54
                //       ),
// ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: SizedBox(
                    width: 350,
                    height: 45,
                    child: TextField(
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 35),
                CustomTextField(
                  controller: _passwordController,
                  hintText: 'Password',
                ),
                //             const Text(
                // "Create a Password:",textAlign: TextAlign.left,
//   style: TextStyle(fontStyle: FontStyle.normal,fontSize: 20,color: Colors.black54
//         ),
// ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: SizedBox(
                    width: 350,
                    height: 45,
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 35),
                CustomTextField(
                  controller: _nameController,
                  hintText: 'Name',
                ),
//               const Text(
//   "Re-type your password:",
//   style: TextStyle(fontStyle: FontStyle.normal,fontSize: 20,color: Colors.black54
//         ),
// ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: SizedBox(
                    width: 350,
                    height: 45,
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 35),
                CustomButton(
                  text: 'SignUp',
                  onTap: () {
                    if(_signupFormKey.currentState !.validate()){
                       signUpUser();
                    }
                  },
                )
              ],
            )),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => RegisterPage1()));
            // Navigator.pushNamed(context, RegisterPage1().routeName);
          },
          child: const Icon(Icons.check)),
      //BUTTON LOCATION
    );
  }
}
