import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController(); // Controller for confirm password

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        _birthDateController.text = DateFormat('MM/dd/yyyy').format(pickedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Color(0xFFFFDD00),
              width: 2,
            ),
          ),
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        title: const Text(
          'Sign up',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Background Circle
          Positioned(
            top: -200,
            right: -400,
            child: Container(
              width: 820,
              height: 820,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Color(0xFFFFDD00).withOpacity(0.5), // Meningkatkan opacity dari 0.3 ke 0.5
                    Colors.transparent,
                  ],
                  stops: [0.0, 1.0],
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // First Name & Last Name
                  Row(
                    children: [
                      Expanded(
                          child: _buildTextField(_firstNameController, 'First Name')),
                      const SizedBox(width: 10),
                      Expanded(
                          child: _buildTextField(_lastNameController, 'Last Name')),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Email Address
                  _buildTextField(_emailController, 'Email address'),
                  const SizedBox(height: 16),

                  // Birth Date with Calendar Icon
                  _buildTextField(
                    _birthDateController,
                    'Birth of date',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.calendar_today, color: Colors.grey),
                      onPressed: () => _selectDate(context),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Phone Number
                  _buildTextField(_phoneController, 'Phone number',
                      prefixText: '+62 '),
                  const SizedBox(height: 16),

                  // Password
                  _buildTextField(_passwordController, 'Password', isPassword: true),
                  const SizedBox(height: 16),

                  // Confirm Password
                  _buildTextField(_confirmPasswordController, 'Confirm Password', isPassword: true), // Added confirm password field
                  const SizedBox(height: 24),

                  // Create Account Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle sign up logic here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text(
                        'Create account',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label, {
    bool isPassword = false,
    Widget? suffixIcon,
    String? prefixText,
  }) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.grey[900]?.withOpacity(0.7), 
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        suffixIcon: suffixIcon,
        prefixText: prefixText,
        prefixStyle: const TextStyle(color: Colors.white),
      ),
    );
  }
}
