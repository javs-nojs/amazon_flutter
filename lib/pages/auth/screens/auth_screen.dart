import 'package:amazon_flutter/components/custom_button.dart';
import 'package:amazon_flutter/components/custom_form_textfield.dart';
import 'package:amazon_flutter/constants/global_variables.dart';
import 'package:flutter/material.dart';

enum Auth { signin, signup }

class AuthScreen extends StatefulWidget {
  static const String routeNamed = 'auth-screen';

  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;

  final _siginFormlKey = GlobalKey<FormState>();
  final _sigupFormlKey = GlobalKey<FormState>();

  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _username.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: GlobalVariables.greyBackgroundCOlor,
        title: Image.asset(
          'assets/images/amazon.png',
          width: 100.0,
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0.8),
          child: Container(
            color: Colors.grey,
            height: 0.8,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w500),
            ),
            ListTile(
              title: RichText(
                text: const TextSpan(
                  text: 'Create accounts. ',
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'New to Amazon?',
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
              leading: Transform.scale(
                scale: 1.2,
                child: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signup,
                  groupValue: _auth,
                  onChanged: (Auth? value) => setState(() {
                    _auth = value!;
                  }),
                ),
              ),
            ),
            if (_auth == Auth.signup)
              Container(
                padding: const EdgeInsets.all(8.0),
                color: GlobalVariables.backgroundColor,
                child: Form(
                    key: _sigupFormlKey,
                    child: Column(
                      children: [
                        CustomFormTextfield(
                            title: 'First and last name',
                            controller: _username),
                        const SizedBox(height: 16.0),
                        CustomFormTextfield(
                            title: 'Mobile number or email',
                            controller: _email),
                        const SizedBox(height: 16.0),
                        CustomFormTextfield(
                            title: 'Create a password', controller: _password),
                        const SizedBox(height: 16.0),
                        CustomButton(
                          text: 'Sig up',
                          onPressed: () {},
                        )
                      ],
                    )),
              ),
            ListTile(
              title: const Text(
                'Sign in. Already a customer?',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
              ),
              leading: Transform.scale(
                scale: 1.2,
                child: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signin,
                  groupValue: _auth,
                  onChanged: (Auth? value) => setState(() {
                    _auth = value!;
                  }),
                ),
              ),
            ),
            if (_auth == Auth.signin)
              Container(
                padding: const EdgeInsets.all(8.0),
                color: GlobalVariables.backgroundColor,
                child: Form(
                    key: _sigupFormlKey,
                    child: Column(
                      children: [
                        CustomFormTextfield(
                            title: 'First and last name',
                            controller: _username),
                        const SizedBox(height: 16.0),
                        CustomButton(
                          text: 'Sig in',
                          onPressed: () {},
                        )
                      ],
                    )),
              ),
          ],
        ),
      ),
    );
  }
}
