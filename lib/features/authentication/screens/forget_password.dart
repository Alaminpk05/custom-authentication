import 'package:authentication/core/constant/colors.dart';
import 'package:authentication/core/constant/const_string.dart';
import 'package:authentication/core/constant/icons.dart';
import 'package:authentication/core/utils/validation/auth_validator.dart';
import 'package:authentication/features/authentication/widget/auth_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key, required this.type});
  final String type;

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(8.w, 8.h, 8.w, 2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.type == forgetPge ? 'Forgot password' : 'Delete Account',
              style: Theme.of(
                context,
              ).textTheme.headlineLarge!.copyWith(fontSize: 23.sp),
            ),
            SizedBox(height: 1.5.h),
            FittedBox(
              fit: BoxFit.contain,
              child: Text(
                widget.type == forgetPge
                    ? "No worries, we'll send you reset instructions."
                    : 'Enter your password for authentication',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            SizedBox(height: 5.h),
            AuthTextField(
              hintText: widget.type == forgetPge ? 'Email' : 'Password',
              showEyeIcon: false,
              prefixIcon: widget.type == forgetPge ? email : key,
              controller: _textController,
              validator: (String? value) {
                return widget.type == forgetPge
                    ? AuthValidator.validateEmail(value ?? "")
                    : AuthValidator.validatePassword(value ?? "");
              },
              type: '',
            ),
            SizedBox(height: 4.h),
          
             

               LoginOrSignUpButton(
                title: widget.type == forgetPge ? 'Send' : 'Deleted',
                onTap: () {
                  // widget.type == forgetPge
                  //     ? context.read<AuthenticationBloc>().add(
                  //       PasswordResetEvent(email: _textController.text),
                  //     )
                  //     : context.read<AuthenticationBloc>().add(
                  //       DeleteAccount(password: _textController.text),
                  //     );
                },
              ),
            
            SizedBox(height: 2.h),
            TextButton.icon(
              onPressed: () {
                context.pop();
              },
              label: Text(
                'Back',
                style: Theme.of(
                  context,
                ).textTheme.labelMedium!.copyWith(color: lightGrey),
              ),
              icon: Icon(Icons.arrow_back, size: 20, color: lightGrey),
            ),
          ],
        ),
      ),
    );
  }
}
