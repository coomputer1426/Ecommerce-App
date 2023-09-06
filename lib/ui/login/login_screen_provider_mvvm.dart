import 'package:ecommerce/api/api_manager.dart';
import 'package:ecommerce/ui/DialogUtils.dart';
import 'package:ecommerce/ui/login/login_navigator.dart';
import 'package:ecommerce/ui/login/login_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/widgets/form_label.dart';
import 'package:ecommerce/widgets/custom_form_txt_field.dart';
import 'package:ecommerce/widgets/form_submit_button.dart';
import 'package:provider/provider.dart';

class LoginScreenMVVM extends StatefulWidget {
  static const routeName = "login";

  const LoginScreenMVVM({super.key});

  @override
  State<LoginScreenMVVM> createState() => _LoginScreenMVVMState();
}

class _LoginScreenMVVMState extends State<LoginScreenMVVM>
    implements LoginNavigator {
  // Map<String, dynamic> authData =  {
  var formKey = GlobalKey<FormState>();
  LoginViewModel viewModel = LoginViewModel();
  TextStyle poopintsTextStyle =
      const TextStyle(color: Colors.white, fontSize: 24, fontFamily: "Poppins");

  // TextEditingController nameController = TextEditingController();

  // TextEditingController mobileController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  // TextEditingController phoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  // TextEditingController repasswardConfirmationController = TextEditingController();
  bool securePassword = true;

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

  void login() async {
    if (formKey.currentState?.validate() == false) return;
    viewModel.login(emailController.text, passwordController.text);
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
