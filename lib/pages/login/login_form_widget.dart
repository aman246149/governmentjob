
import 'package:flutter/material.dart';
import 'package:governmentjob/controllers/authprovider.dart';
import 'package:governmentjob/widgets/vspace.dart';
import 'package:provider/provider.dart';




class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: context.read<AuthProvider>().email,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person_outline_outlined),
                    labelText: "E-Mail",
                    hintText: "E-Mail",
                    border: OutlineInputBorder()),
              ),
              const Vspace(10),
              TextFormField(
                controller: context.read<AuthProvider>().password,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.fingerprint),
                  labelText: "Password",
                  hintText: "Password",
                  border: OutlineInputBorder(),
                
                ),
              ),
              const Vspace(20),
         
              SizedBox(
                width: double.infinity,
                child: context.watch<AuthProvider>().isLoading ? const Center(child: SizedBox(width:35.0,child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.red)))) :ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      context.read<AuthProvider>().loginUser(context);
                    }
                  },
                  child: const Text("LOGIN"),
                ),
              ),
            ],
          ),
        ),
    

      
    );
  }
}
