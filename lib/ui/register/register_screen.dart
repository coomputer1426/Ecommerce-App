import 'package:ecommerce/api/api_manager.dart';
import 'package:ecommerce/ui/DialogUtils.dart';
import 'package:ecommerce/ui/login/login_screen.dart';
import 'package:ecommerce/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/widgets/form_label.dart';
import 'package:ecommerce/widgets/custom_form_txt_field.dart';
import 'package:ecommerce/widgets/form_submit_button.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = "register";

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // Map<String, dynamic> authData =  {
  var formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();

  TextEditingController mobileController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController passwardController = TextEditingController();

  TextEditingController repasswardConfirmationController =
      TextEditingController();
  bool securePassword = true;
  bool secureRePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Image.asset(
              "assets/images/route_logo.png",
              width: MediaQuery.of(context).size.width,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      FormLabel("Full Name"),
                      CustomFormTextField(
                        "Enter your Full Name",
                        controller: nameController,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return "Please Enter Full Name";
                          } else {
                            return null;
                          }
                        },
                      ),
                      FormLabel("Phone Number"),
                      CustomFormTextField(
                        "Enter your Phone Number",
                        keyboardType: TextInputType.phone,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return "Please Enter Phone Number";
                          } else {
                            return null;
                          }
                        },
                        controller: phoneController,
                      ),
                      FormLabel("E-mail Address"),
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
                      FormLabel("Passward"),
                      CustomFormTextField(
                        "Enter your Passward",
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
                            return "Please Enter Your Password";
                          } else {
                            return null;
                          }
                        },
                        controller: passwardController,
                      ),
                      FormLabel("Password Confirmation"),
                      CustomFormTextField(
                        "Re-Enter your Password",
                        hideText: true,
                        obscure: secureRePassword,
                        suffIcon: IconButton(
                            onPressed: () {
                              secureRePassword = !secureRePassword;
                              setState(() {});
                            },
                            icon: const Icon(Icons.visibility)),
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return "Please Re-Enter your Password";
                          } else if (repasswardConfirmationController.text !=
                              text) {
                            return "Password doesn't match";
                          } else {
                            return null;
                          }
                        },
                        controller: repasswardConfirmationController,
                      ),
                      FormSubmitButton("Sign Up", () {
                        register();
                      }),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, LoginScreen.routeName);
                        },
                        child: Text(
                          "Already have account? Sign In",
                          textAlign: TextAlign.center,
                          style: poopintsTextStyle.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w500),
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

  void register() async {
    if (formKey.currentState?.validate() == false) return;
    DialogUtils.showLoading(context, "Loading, Pls Wait ...");
    try {
      var response = await ApiManager.register(
          name: nameController.text,
          email: emailController.text,
          phone: phoneController.text,
          password: passwardController.text,
          rePassword: repasswardConfirmationController.text);
      // debugPrint("Message : ${response.message}");
      if (passwardController.text == repasswardConfirmationController.text) {
        debugPrint("Equal");
      }
      debugPrint("Password : ${passwardController.text}");
      debugPrint("Password Confirm : ${repasswardConfirmationController.text}");
      // debugPrint("Status Message : ${response.statusMsg}");

      if (!mounted) return;
      DialogUtils.hideDialog(context);
      if (response.errors != null || response.statusMsg == "fail") {
        if (!mounted) return;
        DialogUtils.showMessage(context, response.mergeErrors(),
            posActionTitle: "OK");
        return;
      }
      if (!mounted) return;
      DialogUtils.showMessage(
          context,
          (response.message == "success")
              ? "The User ${response.user?.name} has been registered Successfully"
              : "${response.message ?? ""} ${response.statusMsg ?? ""}",
          posActionTitle: "OK");
    } catch (e) {
      DialogUtils.hideDialog(context);
      DialogUtils.showMessage(context, "Error  ${e.toString()}",
          posActionTitle: "OK");
    }
  }
}
