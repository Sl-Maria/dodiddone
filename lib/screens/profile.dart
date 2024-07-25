import 'package:flutter/material.dart';

import '../pages/login_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isEmailVerified = false; // Replace with actual user data

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Avatar
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/def_avatar.png'), // Replace with actual avatar
            ),
            const SizedBox(height: 20),
            // Email
            Text(
              'example@email.com', // Replace with actual user email
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            // Email verification status
            if (!_isEmailVerified)
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Подтверждение почты'),
                      content: const Text(
                          'Письмо с подтверждением отправлено на ваш адрес.'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                  setState(() {
                    _isEmailVerified = true;
                  });
                },
                child: const Text('Подтвердить почту'),
              ),
            const SizedBox(height: 20),
            // Logout button
            ElevatedButton(
              onPressed: () {
                // Implement logout logic
                // For example, clear user session data
                // and navigate back to the login page
                Navigator.pushReplacement(context, 
                      MaterialPageRoute(builder: (context) {return const LoginPage();}
                  )
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.black,
              ),
              child: const Text('Выйти'),
            ),
          ],
        ),
      );
  }
}
