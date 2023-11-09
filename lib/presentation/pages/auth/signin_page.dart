import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:grandatma_mobile/presentation/bloc/auth/signin/signin_bloc.dart';
import 'package:grandatma_mobile/presentation/pages/auth/hotel_information_page.dart';
import 'package:grandatma_mobile/presentation/pages/auth/signup_page.dart';
import 'package:grandatma_mobile/presentation/pages/customer/customer_main_page.dart';
import 'package:grandatma_mobile/presentation/pages/gm/gm_main_page.dart';
import 'package:grandatma_mobile/presentation/pages/owner/owner_main_page.dart';

class SigninPage extends StatefulWidget {
  static const ROUTE_NAME = '/';

  const SigninPage({Key? key}) : super(key: key);

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isButtonDisabled = true;

  @override
  void initState() {
    super.initState();
    emailController.addListener(validateButton);
    passwordController.addListener(validateButton);
    emailController.text = "andi@gmail.com";
    passwordController.text = "andi";
  }

  void validateButton() {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      setState(() {
        isButtonDisabled = false;
      });
    } else {
      setState(() {
        isButtonDisabled = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign In',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocListener<SigninBloc, SigninState>(
        listener: (context, state) {
          if (state is SigninSuccess) {
            if (state.signin.role == "owner") {
              Navigator.pushReplacementNamed(context, OwnerMainPage.ROUTE_NAME);
            } else if (state.signin.role == "gm") {
              Navigator.pushReplacementNamed(context, GmMainPage.ROUTE_NAME);
            } else if (state.signin.role == "customer") {
              Navigator.pushReplacementNamed(
                  context, CustomerMainPage.ROUTE_NAME);
            } else {}
          }
          if (state is SigninError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.message,
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: context.watch<SigninBloc>().state is SigninLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: FormBuilder(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          'https://cdn.shopify.com/s/files/1/1061/1924/products/Loudly_Crying_Face_Emoji_grande.png?v=1480481054',
                          height: 150,
                        ),
                        const SizedBox(height: 20),
                        FormBuilderTextField(
                            name: "email",
                            controller: emailController,
                            decoration: InputDecoration(
                              hintText: 'Email',
                              label: Text('Email'),
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 2.0),
                              ),
                            ),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              FormBuilderValidators.email()
                            ])),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            label: Text('Password'),
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2.0),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 15),
                            textStyle: const TextStyle(fontSize: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onPressed: isButtonDisabled
                              ? null
                              : () {
                                  if (_formKey.currentState
                                          ?.saveAndValidate() ??
                                      false) {
                                    if (true) {
                                      context
                                          .read<SigninBloc>()
                                          .add(FetchSignin(
                                            email: emailController.text,
                                            password: passwordController.text,
                                          ));
                                    }
                                  }
                                },
                          child: const Text('Login'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, SignupPage.ROUTE_NAME);
                          },
                          child: const Text(
                            'Don\'t have an account? Sign up',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, HotelInformationPage.ROUTE_NAME);
                          },
                          child: const Text(
                            'Learn more about Grandatma by clicking here',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
