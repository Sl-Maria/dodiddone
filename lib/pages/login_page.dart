import 'package:flutter/material.dart';
import 'package:dodiddone/theme/theme.dart'; // Import the theme file

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isRegistration = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: _isRegistration
                ? [
                    DoDidDoneTheme.lightTheme.colorScheme.primary, // Use theme colors
                    DoDidDoneTheme.lightTheme.colorScheme.secondary, // Use theme colors
                  ]
                : [
                    DoDidDoneTheme.lightTheme.colorScheme.secondary, // Use theme colors
                    DoDidDoneTheme.lightTheme.colorScheme.primary, // Use theme colors
                  ],
            stops: const [0.1, 0.9],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _isRegistration ? 'Регистрация' : 'Вход',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple.shade900,
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Логин',
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Пароль',
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                if (_isRegistration) // Show only for registration
                  Column(
                    children: [
                      const SizedBox(height: 20),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Повторите пароль',
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.8),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    _isRegistration ? 'Зарегистрироваться' : 'Войти',
                    style: TextStyle(color: Colors.purple.shade900),
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _isRegistration = !_isRegistration;
                    });
                  },
                  child: Text(
                    _isRegistration
                        ? 'У меня уже есть аккаунт'
                        : 'У меня еще нет аккаунта',
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
