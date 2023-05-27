import 'package:flutter/material.dart';
import 'package:governmentjob/controllers/authprovider.dart';
import 'package:governmentjob/widgets/vspace.dart';
import 'package:provider/provider.dart';



class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    final formKey = GlobalKey<FormState>();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Form(
        key: formKey,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: context.read<AuthProvider>().fullName,
                decoration: const InputDecoration(
                    label: Text("Full Name"),
                    prefixIcon: Icon(Icons.person_outline_rounded)),
              ),
              const Vspace(10),
              TextFormField(
                controller: context.read<AuthProvider>().email,
                decoration: const InputDecoration(
                    label: Text("E-Mail"),
                    prefixIcon: Icon(Icons.email_outlined)),
              ),
              const Vspace(10),
              TextFormField(
                controller:  context.read<AuthProvider>().password,
                decoration: const InputDecoration(
                    label: Text("Password"),
                    prefixIcon: Icon(Icons.fingerprint)),
              ),
              const Vspace(20),
              SizedBox(
                width: double.infinity,
                child:  context.watch<AuthProvider>().isLoading
                    ? const Center(
                        child: SizedBox(
                            width: 35.0,
                            child: CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation(Colors.red))))
                    : ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                         
                             context.read<AuthProvider>().registerUser(context);
                          }
                        },
                        child: const Text("SIGNUP"),
                      ),
              )
            ],
          ),
       
      ),
    );
  }
}
