// import 'package:ecommerce/api/api_manager.dart';
import 'package:ecommerce/ui/DialogUtils.dart';
import 'package:ecommerce/ui/register/register_navigator.dart';
import 'package:ecommerce/ui/register/register_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/widgets/form_label.dart';
import 'package:ecommerce/widgets/custom_form_txt_field.dart';
import 'package:ecommerce/widgets/form_submit_button.dart';
import 'package:provider/provider.dart';

class RegisterScreenMVVM extends StatefulWidget {
  static const routeName = "register";

  const RegisterScreenMVVM({super.key});

  @override
  State<RegisterScreenMVVM> createState() => _RegisterScreenMVVMState();
}

class _RegisterScreenMVVMState extends State<RegisterScreenMVVM>
    implements RegisterNavigator {
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
  RegisterViewModel viewModel = RegisterViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: Scaffold(
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
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void register() async {
    if (formKey.currentState?.validate() == false) return;
    viewModel.register(
        name: nameController.text,
        password: passwardController.text,
        passwordConfirm: repasswardConfirmationController.text,
        phone: phoneController.text,
        email: emailController.text);
  }

  @override
  void hideDialog() {
    // TODO: implement hideDialog
    DialogUtils.hideDialog(context);
  }

  @override
  bool unMounted() {
    return (!mounted);
  }

  @override
  void showMessage(String message,
      {String? posActionTitle,
      VoidCallback? posAction,
      String? negActionTitle,
      VoidCallback? negAction,
      bool dismissible = true}) {
    // TODO: implement showMessage
    DialogUtils.showMessage(
      context,
      message,
      posActionTitle: posActionTitle,
      posAction: posAction,
      negActionTitle: negActionTitle,
      negAction: negAction,
    );
  }

  @override
  void showProgressDialog(String progressMessage) {
    // TODO: implement showProgressDialog
    DialogUtils.showLoading(context, progressMessage);
  }
}
