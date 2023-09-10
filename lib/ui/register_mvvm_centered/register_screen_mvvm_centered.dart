// import 'package:ecommerce/api/api_manager.dart';
import 'package:ecommerce/provider/app_config_provider.dart';

// import 'package:ecommerce/ui/DialogUtils.dart';
import 'package:ecommerce/ui/home/home_screen.dart';
import 'package:ecommerce/ui/login_mvvm_centered/login_screen_mvvm_base.dart';

// import 'package:ecommerce/ui/login/login_screen_provider_mvvm.dart';
// import 'package:ecommerce/ui/register/register_navigator.dart';
// import 'package:ecommerce/ui/register/register_viewModel.dart';
import 'package:ecommerce/ui/register_mvvm_centered/register_navigator_centered.dart';
import 'package:ecommerce/ui/register_mvvm_centered/register_viewModel_centered.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/widgets/form_label.dart';
import 'package:ecommerce/widgets/custom_form_txt_field.dart';
import 'package:ecommerce/widgets/form_submit_button.dart';
import 'package:provider/provider.dart';
import '../../base/base_state.dart';
import '../theme.dart';

class RegisterScreenMVVMCentered extends StatefulWidget {
  static const routeName = "registermvvmcentered";

  const RegisterScreenMVVMCentered({super.key});

  @override
  State<RegisterScreenMVVMCentered> createState() =>
      _RegisterScreenMVVMCenteredState();
}

class _RegisterScreenMVVMCenteredState
    extends BaseState<RegisterScreenMVVMCentered, RegisterViewModelCentered>
    implements RegisterNavigatorCentered {
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

  // RegisterViewModel viewModel = RegisterViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // viewModel.navigator = this;
    viewModel.configProvider = Provider.of<AppConfigProvider>(context);
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
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, LoginScreenMVVMBase.routeName);
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
  void gotoHome() {
    // TODO: implement gotoHome
    Navigator.pushNamed(context, HomeScreen.routeName);
  }

  @override
  RegisterViewModelCentered initViewModel() => RegisterViewModelCentered();
}
