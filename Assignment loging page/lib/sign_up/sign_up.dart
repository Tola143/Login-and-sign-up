import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboarding_screen/components/my_button.dart';
import 'package:onboarding_screen/components/my_iconbutton.dart';
import 'package:onboarding_screen/components/my_textbutton.dart';
import 'package:onboarding_screen/components/my_textfield.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({
    super.key,
  });

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final nameController = TextEditingController();

  final dateController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final re_passwordController = TextEditingController();

  // date picker
  void signUpUser() async {
    if (nameController.text != "" &&
        dateController.text != "" &&
        emailController.text != "" &&
        passwordController.text != "" &&
        passwordController.text == re_passwordController.text) {
      print('Thanks You :)');
    } else {
      print('Please input your credential');
    }
  }

  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1980),
      lastDate: DateTime(2030),
    );

    if (_picked != null) {
      setState(() {
        dateController.text = _picked.toString().split(" ")[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Form(
            child: Column(
              children: [
                Text(
                  "Hello, ready to get sign up?",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Please sign in with your email and password.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.displaySmall,
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextField(
                  textController: nameController,
                  label: 'Name',
                  hindText: 'Enter your name',
                  obscureText: false,
                ),
                // MyTextField(
                //   textController: emailController,
                //   label: 'Date of birth',
                //   hindText: 'Enter your date of birth',
                //   obscureText: false,
                // ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    controller: dateController,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Date of birth',
                      hintText: 'Enter your date of birth',
                      filled: true,
                      prefixIcon: Icon(Icons.calendar_today),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 42, vertical: 20),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey),
                        gapPadding: 10,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.blue),
                        gapPadding: 10,
                      ),
                    ),
                    readOnly: true,
                    onTap: () {
                      _selectDate();
                    },
                  ),
                ),

                MyTextField(
                  textController: emailController,
                  label: 'Email',
                  hindText: 'Enter your email',
                  obscureText: false,
                ),
                MyTextField(
                  textController: passwordController,
                  label: 'Password',
                  hindText: 'Enter your password',
                  obscureText: true,
                ),
                MyTextField(
                  textController: re_passwordController,
                  label: 'Confirm Password',
                  hindText: 'Confirm password',
                  obscureText: true,
                ),

                const SizedBox(
                  height: 10,
                ),
                MyButton(onTap: signUpUser, labelButton: 'Sign Up'),

                const SizedBox(
                  height: 30,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('Or continue with'),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                ),

                // Icon buttom
                const SizedBox(
                  height: 0,
                ),
                const Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyIconButton(imagePath: 'assets/icons/google.png'),
                      SizedBox(
                        width: 20,
                      ),
                      MyIconButton(imagePath: 'assets/icons/apple.png'),
                    ],
                  ),
                ),
                const Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account ?'),
                      MyTextButton(
                        lableText: 'Sign in',
                        pageRoute: 'login',
                      )
                    ],
                  ),
                ),
                // const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
