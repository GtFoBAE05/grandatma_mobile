
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../bloc/auth/changepass/change_password_bloc.dart';

class OwnerEditPasswordPage extends StatefulWidget {
  static const String ROUTE_NAME = '/owner_edit_password_page';
  const OwnerEditPasswordPage({super.key});

  @override
  State<OwnerEditPasswordPage> createState() => _OwnerEditPasswordPageState();
}

class _OwnerEditPasswordPageState extends State<OwnerEditPasswordPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _passwordFieldKey = GlobalKey<FormBuilderFieldState>();
  final _passwordConfirmationFieldKey = GlobalKey<FormBuilderFieldState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<ChangePasswordBloc, ChangePasswordState>(
        listener: (context, state) {
          if (state is ChangePasswordSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Success change password",
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.pop(context);
          }
          if (state is ChangePasswordError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Failed change password",
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: context.watch<ChangePasswordBloc>().state
        is ChangePasswordLoading
            ? Center(child: CircularProgressIndicator())
            : Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: FormBuilder(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Update \nPassword",
                      style: TextStyle(fontSize: 48),
                    ),
                    SizedBox(height: 20),
                    FormBuilderTextField(
                      name: 'password',
                      key: _passwordFieldKey,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.minLength(6),
                      ]),
                    ),
                    SizedBox(height: 20),
                    FormBuilderTextField(
                      name: 'password_confirmation',
                      key: _passwordConfirmationFieldKey,
                      decoration: InputDecoration(
                        labelText: 'Password Confirmation',
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                      onEditingComplete: () =>
                          _formKey.currentState?.saveAndValidate(),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.minLength(6),
                      ]),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.blue),
                      onPressed: () {
                        if (_formKey.currentState?.saveAndValidate() ??
                            false) {
                          if (true) {
                            _formKey.currentState?.fields['password']
                                ?.value !=
                                _formKey
                                    .currentState
                                    ?.fields['password_confirmation']
                                    ?.value
                                ? ScaffoldMessenger.of(context)
                                .showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Password dan Password Confirmation doesn\'t match',
                                  style:
                                  TextStyle(color: Colors.white),
                                ),
                                backgroundColor: Colors.red,
                              ),
                            )
                                : context.read<ChangePasswordBloc>().add(
                              doChangePassword(
                                password: _formKey.currentState
                                    ?.fields['password']?.value,
                              ),
                            );
                          }
                        }
                      },
                      child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
