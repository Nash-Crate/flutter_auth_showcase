part of 'login_page.dart';

/// Login page middle section
class LoginPageUiMiddle extends StatefulWidget {
  /// constructor
  const LoginPageUiMiddle({super.key});

  @override
  State<LoginPageUiMiddle> createState() => _LoginPageUiMiddleState();
}

class _LoginPageUiMiddleState extends State<LoginPageUiMiddle> {
  late final TextEditingController _emailTec;
  late final TextEditingController _passwordTec;
  late final FocusNode _emailFocusNode;
  late final FocusNode _passwordFocusNode;

  @override
  void initState() {
    super.initState();
    _emailTec = TextEditingController();
    _passwordTec = TextEditingController();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _emailTec.dispose();
    _passwordTec.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AppTextField(
            label: 'Email',
            hint: 'john@g.co',
            controller: _emailTec,
            focusNode: _emailFocusNode,
            onChanged: context.read<LoginCubit>().onSetEmail,
          ),

          SizedBox(height: 10.h),

          AppTextField(
            label: 'Password',
            hint: '********',
            controller: _passwordTec,
            focusNode: _passwordFocusNode,
            obscureText: true,
            onChanged: context.read<LoginCubit>().onSetPassword,
          ),

          SizedBox(height: 30.h),

          BlocBuilder<LoginCubit, LoginState>(
            buildWhen: (previous, current) => previous.isProcessing != current.isProcessing,
            builder: (context, state) {
              return AppElevatedButton(
                label: 'Login',
                isLoading: state.isProcessing,
                onPressed: context.read<LoginCubit>().onSubmit,
              );
            },
          ),
        ],
      ),
    );
  }
}
