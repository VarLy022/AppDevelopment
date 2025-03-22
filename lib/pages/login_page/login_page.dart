import 'package:design_app/manageData/manage_home_page.dart';
import 'package:design_app/pages/login_page/register_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  bool _checbox = false;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Widget logInButton() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.62,
      height: MediaQuery.of(context).size.width * 0.12,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
        onPressed: () {
          // Add your login action here
          Navigator.of(context).pop();
          MaterialPageRoute route = MaterialPageRoute(
            builder: (_) => ManageHomePage(),
          );
          Navigator.of(context).push(route);
        },
        child: Text(
          'LogIn',
          style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              // fontWeight: FontWeight.bold,
              fontFamily: 'NotoSansLao'),
        ),
      ),
    );
  }

  Widget SigUpButton() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.62,
      height: MediaQuery.of(context).size.width * 0.12,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[700]),
        onPressed: () {
          // Add your login action here
          Navigator.of(context).pop();
          MaterialPageRoute route =
              MaterialPageRoute(builder: (_) => RegisterPage());
          Navigator.of(context).push(route);
        },
        child: Text(
          'ລົງທະບຽນຜູ້ໃຊ້ໃໝ່',
          style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              // fontWeight: FontWeight.bold,
              fontFamily: 'NotoSansLao'),
        ),
      ),
    );
  }

  Widget logUpButtom() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        logInButton(),
        // SizedBox(
        //   height: 12,
        // ),
        // Text(
        //   'ທ່ານຍັງບໍ່ທັນລົງທະບຽນແມ່ນບໍ່?',
        //   style: TextStyle(
        //       color: Colors.white,
        //       fontWeight: FontWeight.bold,
        //       fontFamily: 'NotoSansLao'),
        // ),
        // SizedBox(
        //   height: 4,
        // ),
        // SigUpButton(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: IntrinsicHeight(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/bglog.jpg'),
                    fit: BoxFit.cover),
              ),
              child: Center(
                child: Column(
                  // mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 45.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: MediaQuery.of(context).size.width * 0.5,
                        child: CircleAvatar(
                          child: ClipOval(
                            child: Image.asset('assets/images/cafe_rose.jpeg'),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "Morning Rose Cafe",
                      style: TextStyle(
                        fontSize: 60,
                        color: Colors.white70,
                        fontFamily: 'Campana',
                      ),
                    ),
                    SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'User name or email',
                          hintStyle: TextStyle(
                              fontFamily: 'NotoSansLao',
                              fontSize: 16,
                              color: Colors.white),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          prefixIcon: Icon(
                            Icons.person,
                            size: 30,
                            color: Colors.white,
                          ),
                          filled: true,
                          fillColor: Colors.blueGrey,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your username';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: TextFormField(
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          hintText: 'password',
                          hintStyle: TextStyle(
                            fontFamily: 'NotoSansLao',
                            fontSize: 16,
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          prefixIcon: Icon(
                            Icons.lock,
                            size: 30,
                            color: Colors.white,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: _toggleVisibility,
                          ),
                          filled: true,
                          fillColor: Colors.blueGrey,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 24.0),
                          child: Checkbox(
                            fillColor: MaterialStateProperty.all(Colors.green),
                            checkColor: Colors.white,
                            // activeColor: Colors.white,
                            value: _checbox,
                            onChanged: (bool? value) {
                              setState(() {
                                _checbox = value ?? false;
                              });
                            },
                          ),
                        ),
                        Text(
                          'Remember me',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'NotoSansLao',
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Forgot password ?',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'NotoSansLao',
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    logUpButtom(),
                    SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 75.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.white,
                              thickness: 1,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              'Or login with',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.white,
                              thickness: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Handle Google login
                          },
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.white,
                            child: Image.asset(
                              'assets/images/google.png', // Path to Google logo
                              height: 30,
                              width: 30,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            // Handle Google login
                          },
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.white,
                            child: Image.asset(
                              'assets/images/facebook.png', // Path to Google logo
                              height: 35,
                              width: 35,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            // Handle Google login
                          },
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.white,
                            child: Image.asset(
                              'assets/images/apple.png', // Path to Google logo
                              height: 35,
                              width: 35,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                            MaterialPageRoute route = MaterialPageRoute(
                                builder: (_) => RegisterPage());
                            Navigator.of(context).push(route);
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
