import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ts/core/widgets/my_button.dart';
import 'package:ts/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ts/features/home/presentation/pages/home_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _hasMembership = false;
  bool _agreeToTerms = false;
  bool _agreeToPrivacy = false;
  void register() {
    if (_globalKey.currentState!.validate()) {
      log("jabhjdbhyubsavyhudvbyauscvtxyvgascdrd");
      context.read<AuthBloc>().add(
        RegisterEvent(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Account registration',
          style: GoogleFonts.roboto(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Form(
          key: _globalKey,
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccess) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (x) => HomeScreen()),
                );
              }
            },

            builder: (context, state) {
              if (state is AuthError) {
                SchedulerBinding.instance.addPostFrameCallback((_) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.message)));
                });
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTextField(
                    controller: _nameController,
                    hintText: 'Enter Your Name',
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return "Ismingizni";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 25),

                  _buildTextField(
                    controller: _emailController,
                    hintText: 'Enter Your Email',
                    keyboardType: TextInputType.emailAddress,
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return "Emailni kiriting";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 25),
                  _buildTextField(
                    controller: _passwordController,
                    hintText: '• • • • • • • • • •',
                    isPassword: true,
                    obscureText: _obscurePassword,
                    onToggleVisibility: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                    showCheckIcon: _passwordController.text.length >= 6,
                  ),
                  SizedBox(height: 25),

                  _buildTextField(
                    controller: _confirmPasswordController,
                    hintText: 'Confirm Password',
                    isPassword: true,
                    obscureText: _obscureConfirmPassword,
                    onToggleVisibility: () {
                      setState(() {
                        _obscureConfirmPassword = !_obscureConfirmPassword;
                      });
                    },
                    showCheckIcon:
                        _confirmPasswordController.text.isNotEmpty &&
                        _confirmPasswordController.text ==
                            _passwordController.text,
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return "parolni kiriting";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 30),

                  Text(
                    'Do you have\nTOPSTRETCHING\nmembership?',
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 16,
                      height: 1.3,
                    ),
                  ),
                  SizedBox(height: 15),

                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _hasMembership = true;
                          });
                        },
                        child: Row(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.pink,
                                  width: 2,
                                ),
                                color:
                                    _hasMembership
                                        ? Colors.pink
                                        : Colors.transparent,
                              ),
                              child:
                                  _hasMembership
                                      ? Icon(
                                        Icons.circle,
                                        color: Colors.pink,
                                        size: 12,
                                      )
                                      : null,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Yes',
                              style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 30),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _hasMembership = false;
                          });
                        },
                        child: Row(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 2,
                                ),
                                color:
                                    !_hasMembership
                                        ? Colors.grey
                                        : Colors.transparent,
                              ),
                              child:
                                  !_hasMembership
                                      ? Icon(
                                        Icons.circle,
                                        color: Colors.grey,
                                        size: 12,
                                      )
                                      : null,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'No',
                              style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),

                  Text(
                    'We\'re all set. Now let\'s create your account.',
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 20),

                  _buildCheckboxRow(
                    value: _agreeToTerms,
                    text: 'I agree to TOPSTRETCHING Terms and Conditions',
                    onChanged: (value) {
                      setState(() {
                        _agreeToTerms = value!;
                      });
                    },
                  ),
                  SizedBox(height: 15),

                  _buildCheckboxRow(
                    value: _agreeToPrivacy,
                    text: 'I agree to Privacy Policy',
                    onChanged: (value) {
                      setState(() {
                        _agreeToPrivacy = value!;
                      });
                    },
                  ),
                  SizedBox(height: 40),

                  (state is AuthLoading)
                      ? Center(
                        child: CircularProgressIndicator(color: Colors.pink),
                      )
                      : MyButtom(
                        title: "Create an account",
                        value: register,
                        height: 60,
                        color: Color(0xffF41671),
                      ),
                  SizedBox(height: 30),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    String? Function(String?)? validator,
    required TextEditingController controller,
    required String hintText,
    bool isPassword = false,
    bool obscureText = false,
    VoidCallback? onToggleVisibility,
    bool showCheckIcon = false,
    TextInputType? keyboardType,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade600, width: 1),
        ),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        style: GoogleFonts.roboto(color: Colors.white, fontSize: 16),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.roboto(
            color: Colors.grey.shade500,
            fontSize: 16,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 15),
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (showCheckIcon)
                Container(
                  width: 20,
                  height: 20,
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.check, color: Colors.white, size: 14),
                ),
              if (isPassword && onToggleVisibility != null)
                GestureDetector(
                  onTap: onToggleVisibility,
                  child: Icon(
                    obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey.shade500,
                    size: 20,
                  ),
                ),
            ],
          ),
        ),
        validator: validator,
      ),
    );
  }

  Widget _buildCheckboxRow({
    required bool value,
    required String text,
    required ValueChanged<bool?> onChanged,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => onChanged(!value),
          child: Container(
            width: 20,
            height: 20,
            margin: EdgeInsets.only(top: 2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.pink, width: 2),
              color: value ? Colors.pink : Colors.transparent,
            ),
            child:
                value ? Icon(Icons.circle, color: Colors.pink, size: 12) : null,
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontSize: 14,
              height: 1.3,
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
