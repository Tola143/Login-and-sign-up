import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:onboarding_screen/components/my_button.dart";
import "package:onboarding_screen/components/my_iconbutton.dart";
import "package:onboarding_screen/components/my_textbutton.dart";
import "package:onboarding_screen/components/my_textfield.dart";

class SignInScreen extends StatelessWidget {
  SignInScreen({
    super.key,
  });

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in
  void signInUser() async {
    if (emailController.text != "" && passwordController.text != "") {
      print('Thanks You :)');
    } else {
      print('Please input your credential');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: Form(
            child: Column(
              children: [
                Text(
                  "Hello, ready to get started?",
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
                const Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: MyTextButton(
                    lableText: 'Forget password?',
                    pageRoute: 'forget',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                MyButton(onTap: signInUser, labelButton: 'Sign In'),

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
                      Text('Not a member ?'),
                      MyTextButton(lableText: 'Register now', pageRoute: 'register',)
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
