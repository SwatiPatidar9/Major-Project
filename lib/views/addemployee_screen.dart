import 'package:flutter/material.dart';

class AddEmployeePage extends StatefulWidget {
  const AddEmployeePage({super.key});

  @override
  State<AddEmployeePage> createState() => _AddEmployeePageState();
}

class _AddEmployeePageState extends State<AddEmployeePage> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final idController = TextEditingController();
  final addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Employee"),
        backgroundColor: Color(0xFF0097A7),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              buildInputField("Employee Name", nameController),
              const SizedBox(height: 12),
              buildInputField("Employee ID", idController),
              const SizedBox(height: 12),
              buildInputField("Mobile Number", mobileController,
                  keyboardType: TextInputType.phone),
              const SizedBox(height: 12),

              buildInputField("Email ID", emailController,
                  keyboardType: TextInputType.emailAddress),
              const SizedBox(height: 12),

              buildInputField("Password", passwordController,
                  obscureText: true),
              const SizedBox(height: 12),

              buildInputField("Address", addressController, maxLines: 3),
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Form Submitted ✅")),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0097A7),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Submit",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// 🔹 Reusable styled TextFormField
  Widget buildInputField(String hint, TextEditingController controller,
      {bool obscureText = false,
        int maxLines = 1,
        TextInputType keyboardType = TextInputType.text}) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      maxLines: maxLines,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.grey[200], // grey background
        border: InputBorder.none, // no border
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 14,
        ),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "$hint is required";
        }
        return null;
      },
    );
  }
}
