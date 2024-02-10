import 'package:chatapp/components/my_button.dart';
import 'package:chatapp/components/my_textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  RegisterPage({super.key});

  void register() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            //logo
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(
              height: 20,
            ),
            //welcome message to user
            Text("Create an account!",
                style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 20,
            ),
            //login form(email and password)
            MyTextField(
              hintText: 'Email',
              obscureText: false,
              controller: _email,
            ),
            const SizedBox(
              height: 20,
            ),
            MyTextField(
              hintText: 'Password',
              obscureText: true,
              controller: _password,
            ),
            const SizedBox(
              height: 20,
            ),
            MyTextField(
              hintText: 'Confirm Password',
              obscureText: true,
              controller: _confirmPassword,
            ),
            //login button
            const SizedBox(
              height: 20,
            ),
            MyButton(
              buttonText: 'Register',
              onTap: () {
                register;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            //forgot password
            // const Text(
            //   "Forgot Password?",
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already a member? ",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                Text(
                  "Login now",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                )
              ],
            )
          ]),
        ));
  }
}