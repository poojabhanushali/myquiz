import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../home_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;
  bool isLoading = false;

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ageController = TextEditingController();
  final dobController = TextEditingController();
  final qualificationController = TextEditingController();

  void selectForm(bool login) {
    setState(() => isLogin = login);
  }

  Future<void> submit() async {
    String username = usernameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String dob = dobController.text.trim();
    String age = ageController.text.trim();
    String qualification = qualificationController.text.trim();

    if (email.isEmpty || password.isEmpty || (!isLogin && username.isEmpty)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all required fields")),
      );
      return;
    }

    setState(() => isLoading = true);
    final prefs = await SharedPreferences.getInstance();

    if (isLogin) {
      // Get stored credentials
      String? storedEmail = prefs.getString("email");
      String? storedPassword = prefs.getString("password");

      if (storedEmail == email && storedPassword == password) {
        await prefs.setString("loggedInUser", email);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomePage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Invalid email or password.")),
        );
      }
    } else {
      // Save signup info
      await prefs.setString("username", username);
      await prefs.setString("email", email);
      await prefs.setString("password", password);
      await prefs.setString("dob", dob);
      await prefs.setString("age", age);
      await prefs.setString("qualification", qualification);
      await prefs.setString("loggedInUser", username);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Signup successful! Please login.")),
      );
      setState(() => isLogin = true);
    }

    setState(() => isLoading = false);
  }

  Widget buildTextField({
    required String label,
    required TextEditingController controller,
    bool obscure = false,
    TextInputType type = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 6,
              offset: const Offset(0, 3),
            )
          ],
        ),
        child: TextField(
          controller: controller,
          obscureText: obscure,
          keyboardType: type,
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            contentPadding:
            const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(isLogin ? "Login" : "Signup")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: isLogin ? Colors.blue : Colors.grey),
                      onPressed: () => selectForm(true),
                      child: const Text("Login")),
                  const SizedBox(width: 10),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                          !isLogin ? Colors.blue : Colors.grey),
                      onPressed: () => selectForm(false),
                      child: const Text("Signup")),
                ],
              ),
              const SizedBox(height: 20),
              if (!isLogin) ...[
                buildTextField(label: "Username", controller: usernameController),
                buildTextField(
                    label: "Age",
                    controller: ageController,
                    type: TextInputType.number),
                buildTextField(label: "Date of Birth", controller: dobController),
                buildTextField(
                    label: "Qualification",
                    controller: qualificationController),
              ],
              buildTextField(
                  label: "Email",
                  controller: emailController,
                  type: TextInputType.emailAddress),
              buildTextField(
                  label: "Password",
                  controller: passwordController,
                  obscure: true),
              const SizedBox(height: 20),
              isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                  onPressed: submit,
                  child: Text(isLogin ? "Login" : "Signup")),
            ],
          ),
        ),
      ),
    );
  }
}
