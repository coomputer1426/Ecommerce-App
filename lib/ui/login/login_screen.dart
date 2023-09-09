import 'package:ecommerce/api/api_manager.dart';
import 'package:ecommerce/ui/DialogUtils.dart';
import 'package:ecommerce/ui/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/widgets/form_label.dart';
import 'package:ecommerce/widgets/custom_form_txt_field.dart';
import 'package:ecommerce/widgets/form_submit_button.dart';
import '../theme.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "login";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Map<String, dynamic> authData =  {
  var formKey = GlobalKey<FormState>();

  // TextEditingController nameController = TextEditingController();

  // TextEditingController mobileController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  // TextEditingController phoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  // TextEditingController repasswardConfirmationController = TextEditingController();
  bool securePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              "assets/images/route_logo.png",
              width: MediaQuery.of(context).size.width,
            ),
            Text(
              "Welcome Back to Route",
              style: poopintsTextStyle,
            ),
            Text(
              "Please sign In with your email",
              style: poopintsTextStyle.copyWith(
                  fontSize: 16, fontWeight: FontWeight.w300),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // FormLabel("Full Name"),
                      // CustomFormTextField("Enter your Full Name", controller: nameController,
                      //
                      // validator: (text){
                      //   if(text==null || text.trim().isEmpty)return"Please Enter Full Name";
                      //
                      // },),
                      // FormLabel("Phone Number"),
                      // CustomFormTextField("Enter your Phone Number", keyboardType: TextInputType.phone,
                      //   validator: (text){
                      //     if(text==null || text.trim().isEmpty)return"Please Enter Phone Number";
                      //   }, controller: phoneController,),

                      FormLabel("E-mail Address"),
                      const SizedBox(
                        height: 4,
                      ),
                      CustomFormTextField(
                        "Enter your E-mail Address",
                        keyboardType: TextInputType.emailAddress,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return "Please Enter Email";
                          } else {
                            return null;
                          }
                          // Email Formatted
                        },
                        controller: emailController,
                      ),
                      FormLabel("Password"),
                      const SizedBox(
                        height: 4,
                      ),

                      CustomFormTextField(
                        "Enter your Password",
                        hideText: true,
                        obscure: securePassword,
                        suffIcon: IconButton(
                            onPressed: () {
                              securePassword = !securePassword;
                              setState(() {});
                            },
                            icon: const Icon(Icons.visibility)),
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return "Please Enter YourPassword";
                          } else {
                            return null;
                          }
                        },
                        controller: passwordController,
                      ),

                      // FormLabel("Password Confirmation"),
                      // CustomFormTextField("Re-Enter your Password", hideText: true,
                      //   suffIcon: IconButton(onPressed: (){securePassword = !securePassword;
                      //   setState(() {
                      //   });}, icon: const Icon(Icons.visibility)),
                      //   validator: (text){
                      //     if(text==null || text.trim().isEmpty)return"Please Re-Enter your Passward";
                      //     else if(repasswardConfirmationController.text != text) return "Passward doesn't match";
                      //   }, controller: repasswardConfirmationController,),
                      const SizedBox(
                        height: 20,
                      ),
                      FormSubmitButton("Sign In", () {
                        login();
                      }),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, RegisterScreen.routeName);
                        },
                        child: Text(
                          "Don't have an account?, Create Account ",
                          style: poopintsTextStyle.copyWith(
                              fontWeight: FontWeight.w500, fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void login() async {
    if (formKey.currentState?.validate() == false) return;
    DialogUtils.showLoading(context, "Loading, Pls Wait ...");
    try {
      var response = await ApiManager.login(
        // name: nameController.text,
        email: emailController.text,
        // phone: phoneController.text,
        password: passwordController.text,
        // rePassword: repasswardConfirmationController.text
      );
      if (!mounted) return;
      DialogUtils.hideDialog(context);
      if (response.statusMsg == "fail" || response.message != "success") {
        if (!mounted) return;
        DialogUtils.showMessage(context, response.mergeErrors(),
            posActionTitle: "OK");
        return;
      }
      if (!mounted) return;
      DialogUtils.showMessage(
          context, "Login Operation Result : ${response.message!} \n Press OK",
          posActionTitle: "OK");
    } catch (e) {
      DialogUtils.hideDialog(context);
      DialogUtils.showMessage(context, "Error  ${e.toString()}",
          posActionTitle: "OK");
    }
  }
}
