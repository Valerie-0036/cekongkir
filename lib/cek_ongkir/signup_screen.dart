import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    home: SignUpScreen(),
  ));
}

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _showPassword = false;
  bool _showConfirmPassword = false;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  void signUp() async {
    final username = _usernameController.text;
    final email = _emailController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (username.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
    print('Please fill in all fields');
    // Display error message or take appropriate action for empty fields
    return;
    }
    
    if (password != confirmPassword) {
      print('Passwords do not match');
      // Display error message or take appropriate action for password mismatch
      return;
    }

    try {
      // Hash password using SHA-256
      final hashedPassword = sha256.convert(utf8.encode(password)).toString();

      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: hashedPassword, // Use the hashed password
      );

      if (userCredential.user != null) {
        // Save username, email, and hashed password to Firestore
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .set({
          'username': username,
          'email': email,
          'hashedPassword': hashedPassword,
        });

        // Registration successful, take appropriate action such as navigating to the home page
        Navigator.pushReplacementNamed(context, '/login');
        print('Registration successful');
      }
    } catch (error) {
      print('Error signing up: $error');
      // Display error message or take appropriate action for the error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
        title: Text("Signup"),
        backgroundColor: const Color.fromARGB(255, 255, 23, 68),
        
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 30.0),
                  SizedBox(height: 40.0),
                  CardBox(
                    child: Container(
                      width: 300.0, // Ubah lebar CardBox sesuai kebutuhan
                      child: Column(
                        children: [
                          Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 25.0),
                          BoxWrapper(
                            child: BoxTextField(
                              controller: _usernameController,
                              hintText: 'Name',
                              prefixIcon: Icon(Icons.person),
                            ),
                          ),
                          BoxWrapper(
                            child: BoxTextField(
                              controller: _emailController,
                              hintText: 'Email',
                              prefixIcon: Icon(Icons.email),
                            ),
                          ),
                          BoxWrapper(
                            child: Stack(
                              alignment: Alignment.centerRight,
                              children: [
                                BoxTextField(
                                  controller: _passwordController,
                                  hintText: 'Password',
                                  obscureText: !_showPassword,
                                  prefixIcon: Icon(Icons.lock),
                                ),
                                IconButton(
                                  icon: Icon(
                                    _showPassword
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _showPassword = !_showPassword;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          BoxWrapper(
                            child: Stack(
                              alignment: Alignment.centerRight,
                              children: [
                                BoxTextField(
                                  controller: _confirmPasswordController,
                                  hintText: 'Confirm Password',
                                  obscureText: !_showConfirmPassword,
                                  prefixIcon: Icon(Icons.lock),
                                ),
                                IconButton(
                                  icon: Icon(
                                    _showConfirmPassword
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _showConfirmPassword = !_showConfirmPassword;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10.0),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: signUp,
                              // Panggil method registerUser saat tombol ditekan
                              child: Text(
                                'Create Account',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Color(int.parse('FF1643', radix: 16))
                                    .withOpacity(1.0),
                                minimumSize: Size(double.infinity, 48.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CardBox extends StatelessWidget {
  final Widget child;

  const CardBox({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: child,
      ),
    );
  }
}

class BoxWrapper extends StatelessWidget {
  final Widget child;

  const BoxWrapper({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: child,
    );
  }
}

class BoxTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final bool obscureText;
  final Icon? prefixIcon;

  const BoxTextField({
    Key? key,
    this.controller,
    required this.hintText,
    this.obscureText = false,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.symmetric(vertical: 16.0),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.0),
        ),
        prefixIcon: prefixIcon,
      ),
      obscureText: obscureText,
    );
  }
}
