import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
      resizeToAvoidBottomInset: true,
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/onboarding', (route) => false),
      ),
      title: const Text('Login'),
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (_isLogin) ..._signInWidgets() else ..._signUpWidgets(),
        ],
      ),
    );
  }

  List<Widget> _signInWidgets() {
    return [
      _customTxtField(label: 'Email', controller: _emailController),
      const SizedBox(height: 16),
      _customTxtField(label: 'Password', controller: _passwordController, obscureText: true),
      const SizedBox(height: 16),
      _forgotAndSignUp(),
      const SizedBox(height: 18),
      _loginBtn(),
      const SizedBox(height: 30),
      _signInWith(),
      const SizedBox(height: 16),
      _signWithBtns(),
    ];
  }

  List<Widget> _signUpWidgets() {
    return [
      _customTxtField(label: 'Name', controller: _nameController),
      const SizedBox(height: 16),
      _customTxtField(label: 'Email', controller: _emailController),
      const SizedBox(height: 16),
      _customTxtField(label: 'Password', controller: _passwordController, obscureText: true),
      const SizedBox(height: 16),
      _customTxtField(label: 'Confirm Password', controller: _confirmPasswordController, obscureText: true),
      const SizedBox(height: 16),
      _forgotAndSignUp(),
      const SizedBox(height: 18),
      _loginBtn(),
    ];
  }


  Widget _customTxtField({
    required String label,
    required TextEditingController controller,
    bool obscureText = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }

  Widget _signInWith() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: Divider(thickness: 1,)),
        Padding(padding: const EdgeInsets.symmetric(horizontal: 10.0), child: Text('or sign in with')),
        Expanded(child: Divider(thickness: 1,)),
      ],
    );
  }

  Widget _signWithBtns() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _customSignInBtns(() {}, Image.asset('assets/google-logo.png', width: 24, height: 24)),
        _customSignInBtns(() {}, const Icon(Icons.apple, size: 26)),
        _customSignInBtns(() {}, const Icon(Icons.facebook, size: 26)),
        _customSignInBtns(() {}, Image.asset('assets/microsoft-logo.png', width: 24, height: 24)),
      ],
    );
  }

  Widget _customSignInBtns(VoidCallback onPressed, Widget icon) {
    return IconButton(
      onPressed: onPressed,
      icon: icon,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 2,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  Widget _forgotAndSignUp() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (_isLogin)  TextButton(
          onPressed: () {
            // Navigate to forgot password page
          },
          child: const Text('Forgot Password??...'),
        ),
        if (!_isLogin) const SizedBox.shrink(),
        TextButton(
          onPressed: () => setState(() => _isLogin = !_isLogin),
          child: Text(
            _isLogin ? 'Create an Account...' : 'Already have an Account...',
          ),
        ),
      ],
    );
  }

  Widget _loginBtn() {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
      },
      child: Text(
        _isLogin ? 'Login' : 'Register',
      ),
    );
  }
}