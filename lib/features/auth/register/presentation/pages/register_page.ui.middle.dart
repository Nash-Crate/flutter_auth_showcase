part of 'register_page.dart';

/// Register page middle section
class RegisterPageUiMiddle extends StatefulWidget {
  /// constructor
  const RegisterPageUiMiddle({super.key});

  @override
  State<RegisterPageUiMiddle> createState() => _RegisterPageUiMiddleState();
}

class _RegisterPageUiMiddleState extends State<RegisterPageUiMiddle> {
  late final TextEditingController _emailTec;
  late final TextEditingController _passwordTec;
  late final TextEditingController _confirmPasswordTec;
  late final FocusNode _emailFocusNode;
  late final FocusNode _passwordFocusNode;
  late final FocusNode _confirmPasswordFocusNode;

  @override
  void initState() {
    super.initState();
    _emailTec = TextEditingController();
    _passwordTec = TextEditingController();
    _confirmPasswordTec = TextEditingController();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _confirmPasswordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _emailTec.dispose();
    _passwordTec.dispose();
    _confirmPasswordTec.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.h),
        child: Column(
          children: [
            SizedBox(height: 30.h),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: BlocBuilder<RegisterCubit, RegisterState>(
                buildWhen: (previous, current) => previous.authStrategy != current.authStrategy,
                builder: (context, state) {
                  return ToggleButtons(
                    isSelected: AuthenticationStrategy.values
                        .map((p) => p == state.authStrategy)
                        .toList(),
                    onPressed: context.read<RegisterCubit>().onSetAuthenticationStrategy,
                    children: AuthenticationStrategy.values
                        .map(
                          (v) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              v.label,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                        .toList(),
                  );
                },
              ),
            ),
            SizedBox(height: 30.h),

            AppTextField(
              label: 'Email',
              hint: 'john@g.co',
              controller: _emailTec,
              focusNode: _emailFocusNode,
              onChanged: context.read<RegisterCubit>().onSetEmail,
            ),

            SizedBox(height: 10.h),

            AppTextField(
              label: 'Password',
              hint: '********',
              controller: _passwordTec,
              focusNode: _passwordFocusNode,
              obscureText: true,
              onChanged: context.read<RegisterCubit>().onSetPassword,
            ),

            SizedBox(height: 10.h),

            AppTextField(
              label: 'Confirm Password',
              hint: '********',
              controller: _confirmPasswordTec,
              focusNode: _confirmPasswordFocusNode,
              obscureText: true,
              onChanged: context.read<RegisterCubit>().onSetConfirmPassword,
            ),

            SizedBox(height: 30.h),

            BlocBuilder<RegisterCubit, RegisterState>(
              buildWhen: (previous, current) => previous.isProcessing != current.isProcessing,
              builder: (context, state) {
                return AppElevatedButton(
                  label: 'Register',
                  isLoading: state.isProcessing,
                  onPressed: context.read<RegisterCubit>().onSubmit,
                );
              },
            ),

            const SizedBox(height: 10),

            BlocSelector<RegisterCubit, RegisterState, AuthenticationStrategy>(
              selector: (state) => state.authStrategy,
              builder: (context, authPlatform) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('with '),
                    Text(authPlatform.label),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
