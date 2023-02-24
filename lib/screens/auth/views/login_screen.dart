import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shop/constants.dart';
import 'package:shop/route/route_constants.dart';
import 'package:shop/services/onbording_api.dart';
import 'package:shop/widgets/snackbar.dart';

import '../../../utils/commons.dart';
import 'components/login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/login_dark.png",
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome back!",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: defaultPadding / 2),
                  const Text(
                    "Log in with your data that you intered during your registration.",
                  ),
                  const SizedBox(height: defaultPadding),
                  LogInForm(
                    formKey: _formKey,
                    username: _userNameController,
                    pass: _passwordController,
                  ),
                  Align(
                    child: TextButton(
                      child: const Text("Forgot password"),
                      onPressed: () {
                        Navigator.pushNamed(
                            context, passwordRecoveryScreenRoute);
                      },
                    ),
                  ),
                  SizedBox(
                    height: _size.height > 700
                        ? _size.height * 0.1
                        : defaultPadding,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _onLoginPressed();
                    },
                    child: const Text("Log in"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, signUpScreenRoute);
                        },
                        child: const Text("Sign up"),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _onLoginPressed() {
    if (_formKey.currentState!.validate()) {
      OnBoardingApi.login(
              username: 'Default',
              key:
                  'C7BFUfNI2v3WFEJbUxbebHm2F1WLe82W38vpI8HZVzCRKLNwKmsVkCZRmwzQC7GtOnKy15m6UmWXVc8scQPNEQwV26kpkk1OUiqai7OB0mdttFLf7KRiDzisPhGoopiyUm2t3bIH5tOYFwlDcxVhsRLn4fyblTIQxDmy248HecwpINEwRtbR4Um8fblvitXzFROBrksVS6Y8uDqWKVxjRkwjPsYF7EvVEZWp0W7MtWZbSRb6343ZUB1FQlj4DCqh',
              context: context)
          .then((dioResult) async {
        if (dioResult != null) {
          FlutterSecureStorage storage = const FlutterSecureStorage();

          await storage.write(
              key: "api_token", value: dioResult.data['api_token']);
          Navigator.pushNamedAndRemoveUntil(context, entryPointScreenRoute,
              ModalRoute.withName(logInScreenRoute));
        } else {
          CustomSnackBar.showCustomInfoSnack(context, 'Something Went Wrong');
        }
      });
    }
  }
}
