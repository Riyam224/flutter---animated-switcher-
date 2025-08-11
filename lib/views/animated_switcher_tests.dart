// ignore_for_file: unused_element, unused_local_variable

import 'package:flutter/material.dart';

// todo counter app
class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  int counter = 2;

  void increment() {
    setState(() {
      counter++;
    });
  }

  void decrement() {
    setState(() {
      counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            ElevatedButton(
              onPressed: () {
                decrement();
              },
              child: Icon(Icons.remove, size: 30),
            ),
            // todo
            AnimatedSwitcher(
              duration: Duration(milliseconds: 200),
              transitionBuilder: (child, animation) {
                return ScaleTransition(scale: animation, child: child);
              },
              child: Text(
                '$counter',
                key: ValueKey<int>(counter),
                style: TextStyle(fontSize: 30),
              ),
            ),
            // todo
            ElevatedButton(
              onPressed: () {
                increment();
              },
              child: Icon(Icons.add, size: 30),
            ),
          ],
        ),
      ),
    );
  }
}

// _____________ todo theme toggle

class ThemeToggle extends StatefulWidget {
  const ThemeToggle({super.key});

  @override
  State<ThemeToggle> createState() => _ThemeToggleState();
}

class _ThemeToggleState extends State<ThemeToggle> {
  bool isDark = false;

  void changeTheme() {
    setState(() {
      isDark = !isDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDark ? Colors.black : Colors.white,
      body: GestureDetector(
        onTap: changeTheme,
        child: Center(
          // todo
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 200),
            transitionBuilder: (child, animation) {
              return RotationTransition(turns: animation, child: child);
            },
            child: Icon(
              size: 50,
              color: isDark ? Colors.white : Colors.black,
              isDark ? Icons.dark_mode : Icons.light_mode,
              key: ValueKey(isDark),
            ),
          ),
        ),
      ),
    );
  }
}

// todo 2 animated switcher

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  bool showLogin = true;
  bool isForward = true;

  void toggleLogin() {
    setState(() {
      showLogin = !showLogin;
      isForward = !isForward;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //  todo
          AnimatedSwitcher(
            duration: Duration(milliseconds: 200),
            transitionBuilder: (child, animation) {
              final beginOffset = isForward ? Offset(1, 0) : Offset(-1, 0);
              //  todo
              return FadeTransition(
                opacity: animation,
                child: SlideTransition(
                  position: animation.drive(
                    Tween(begin: beginOffset, end: Offset.zero),
                  ),
                  child: child,
                ),
              );
            },
            child: showLogin
                ? LoginView(onToggle: toggleLogin)
                : RegisterView(onToggle: toggleLogin),
          ),
        ],
      ),
    );
  }
}

class LoginView extends StatefulWidget {
  const LoginView({super.key, required this.onToggle});
  final VoidCallback onToggle;

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Logging in as ${_emailController.text}')),
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Login', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 16),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.emailAddress,
            validator: (v) {
              if (v == null || v.isEmpty) return 'Please enter your email';
              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(v))
                return 'Enter a valid email';
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _passwordController,
            decoration: const InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
            obscureText: true,
            validator: (v) =>
                (v == null || v.isEmpty) ? 'Please enter your password' : null,
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _login,
              child: const Text('Login'),
            ),
          ),
          TextButton(
            onPressed: widget.onToggle,
            child: const Text("Don't have an account? Register"),
          ),
        ],
      ),
    );
  }
}

class RegisterView extends StatefulWidget {
  const RegisterView({super.key, required this.onToggle});
  final VoidCallback onToggle;

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _register() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registering ${_usernameController.text}')),
      );
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Register', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 16),
          TextFormField(
            controller: _usernameController,
            decoration: const InputDecoration(
              labelText: 'Username',
              border: OutlineInputBorder(),
            ),
            validator: (v) =>
                (v == null || v.isEmpty) ? 'Please enter your username' : null,
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.emailAddress,
            validator: (v) {
              if (v == null || v.isEmpty) return 'Please enter your email';
              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(v))
                return 'Enter a valid email';
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _passwordController,
            decoration: const InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
            obscureText: true,
            validator: (v) =>
                (v == null || v.isEmpty) ? 'Please enter your password' : null,
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _register,
              child: const Text('Register'),
            ),
          ),
          TextButton(
            onPressed: widget.onToggle,
            child: const Text('Already have an account? Login'),
          ),
        ],
      ),
    );
  }
}
