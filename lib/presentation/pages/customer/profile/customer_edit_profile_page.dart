
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:grandatma_mobile/presentation/bloc/customer/profile/edit_profile/edit_profile_bloc.dart';
import 'package:grandatma_mobile/presentation/bloc/customer/profile/profile_bloc.dart';

class CustomerEditProfilePage extends StatefulWidget {
  static const String ROUTE_NAME = '/customer_edit_profile_page';
  const CustomerEditProfilePage({super.key});

  @override
  State<CustomerEditProfilePage> createState() => _CustomerEditProfilePageState();
}

class _CustomerEditProfilePageState extends State<CustomerEditProfilePage> {


  final _formKey = GlobalKey<FormBuilderState>();
  final _nameFieldKey = GlobalKey<FormBuilderFieldState>();
  TextEditingController nameController = TextEditingController();
  final _emailFieldKey = GlobalKey<FormBuilderFieldState>();
  TextEditingController emailController = TextEditingController();
  final _usernameFieldKey = GlobalKey<FormBuilderFieldState>();
  TextEditingController usernameController = TextEditingController();
  final _phoneFieldKey = GlobalKey<FormBuilderFieldState>();
  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();

  }



  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;

    nameController.text = args['name'];
    emailController.text = args['email'];
    usernameController.text = args['username'];
    phoneController.text = args['phone'];

    return Scaffold(
      body: BlocListener<EditProfileBloc, EditProfileState>(
        listener: (context, state) {
          if (state is EditProfileSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Success update profile",
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.green,
              ),
            );
            context.read<ProfileBloc>().add(FetchUserDetail());
            Navigator.pop(context, true);
          }
          if (state is EditProfileError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Failed update password",
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: context.watch<EditProfileBloc>().state
        is EditProfileLoading
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
                      "Update \nProfile",
                      style: TextStyle(fontSize: 48),
                    ),
                    SizedBox(height: 20),
                    FormBuilderTextField(
                      name: 'name',
                      key: _nameFieldKey,
                      initialValue: nameController.text,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        border: OutlineInputBorder(),
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                    ),
                    SizedBox(height: 20),
                    FormBuilderTextField(
                      name: 'email',
                      key: _emailFieldKey,
                      initialValue: emailController.text,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.email()
                      ]),
                    ),
                    SizedBox(height: 20),FormBuilderTextField(
                      name: 'username',
                      key: _usernameFieldKey,
                      initialValue: usernameController.text,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        border: OutlineInputBorder(),
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                    ),
                    SizedBox(height: 20),FormBuilderTextField(
                      name: 'phone',
                      key: _phoneFieldKey,
                      initialValue: phoneController.text,
                      decoration: InputDecoration(
                        labelText: 'Phone number',
                        border: OutlineInputBorder(),
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.blue),

                      onPressed: () {
                        if (_formKey.currentState?.saveAndValidate() ??
                            false) {
                          if (true) {
                            if(_nameFieldKey.currentState?.value == nameController.text &&
                                _emailFieldKey.currentState?.value == emailController.text &&
                                _usernameFieldKey.currentState?.value == usernameController.text &&
                                _phoneFieldKey.currentState?.value == phoneController.text){
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "No changes",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor: Colors.red,
                                ),
                              );

                          }else{
                              context.read<EditProfileBloc>().add(
                                doEditProfile(
                                  name: _nameFieldKey.currentState?.value,
                                  email: _emailFieldKey.currentState?.value,
                                  phone: _phoneFieldKey.currentState?.value,
                                  username: _usernameFieldKey.currentState?.value,
                                ),
                              );
                            }
                        }
                      }},
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
