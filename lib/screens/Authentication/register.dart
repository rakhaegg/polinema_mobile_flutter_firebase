import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/authentication_services/auth_servics.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  final Function toogleScreen;

  const Register({Key? key, required this.toogleScreen, }) : super(key: key);
  
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
        final loginProvider  =  Provider.of<AuthServices>(context);

    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: () {

                            }, 
                            icon: Icon(Icons.arrow_back_ios,
                            color : Theme.of(context).primaryColor
                            )
                          ),
                          SizedBox( height: 25,),
                          Text(
                            "Welcome ",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Create account to continue ",
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: emailController,
                            validator: (val) => val!.isNotEmpty
                                ? null
                                : "Please enter a email address",
                            decoration: InputDecoration(
                                hintText: "Email",
                                prefixIcon: Icon(Icons.email),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            controller: passwordController,
                            validator: (val) => val!.length < 6
                                ? "Enter more than 6 char"
                                : null,
                            obscureText: true,
                            decoration: InputDecoration(
                                hintText: "Password",
                                prefixIcon: Icon(Icons.vpn_key),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          MaterialButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                print("Email : ${emailController.text}");
                                print("Password : ${passwordController.text}");
                                await loginProvider.register(emailController.text.trim(), passwordController.text.trim());

                              }
                            },
                            height: 70,
                            minWidth:loginProvider.isLoading ? null :  double.infinity,
                            color: Theme.of(context).primaryColor,
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: loginProvider.isLoading ? CircularProgressIndicator() : Text (
                              "Register",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Already have account ? "),
                              SizedBox(width: 5,),
                              TextButton(
                                onPressed: () => widget.toogleScreen(), 
                                child: Text(
                                  "Login "
                                )
                                )
                            ],
                          ),
                          SizedBox(height:  10,),
                          if(loginProvider.errorMessage != null)(
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
                              color: Colors.amberAccent,
                              child: ListTile(
                                title: Text(loginProvider.errorMessage),
                                leading : Icon(Icons.error),
                                trailing : IconButton(
                                  icon: Icon(Icons.close),
                                  onPressed: () => loginProvider.setMessage(null),
                                )
                              ),
                            )
                          )
                        ],
                      ),
                    )))));
  }
}
