import 'package:design_app/pages/login_page/login_page.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _obscureText = true;
  bool _obscureText1 = true;
  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _toggleVisibility1() {
    setState(() {
      _obscureText1 = !_obscureText1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bglog.jpg'),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Create account',
              style: TextStyle(
                  fontSize: 40, color: Colors.white, fontFamily: 'NotoSansLao',fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: 'User name',
                    hintStyle: TextStyle(
                        color: Colors.white, fontFamily: 'NotoSansLao'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 30,
                    ),
                    filled: true,
                    fillColor: Colors.blueGrey),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: 'Email address',
                    hintStyle: TextStyle(
                        color: Colors.white, fontFamily: 'NotoSansLao'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                    filled: true,
                    fillColor: Colors.blueGrey),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: 'Phone 20xxxxxxxx',
                    hintStyle: TextStyle(
                        color: Colors.white, fontFamily: 'NotoSansLao'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    prefixIcon: Icon(
                      Icons.phone,
                      color: Colors.white,
                      size: 30,
                    ),
                    filled: true,
                    fillColor: Colors.blueGrey),
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: TextFormField(
                obscureText: _obscureText,
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(
                      fontFamily: 'NotoSansLao',
                      fontSize: 16,
                      color: Colors.white),
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
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: _toggleVisibility,
                  ),
                  filled: true,
                  fillColor: Colors.blueGrey,
                ),
              ),
            ),
            // SizedBox(height: 8),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 24.0),
            //   child: TextFormField(
            //     obscureText: _obscureText1,
            //     decoration: InputDecoration(
            //       hintText: 'ຢືນຢັນລະຫັດຜ່ານ',
            //       hintStyle: TextStyle(
            //           fontFamily: 'NotoSansLao',
            //           fontSize: 16,
            //           color: Colors.white),
            //       border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(12),
            //       ),
            //       prefixIcon: Icon(
            //         Icons.lock,
            //         size: 30,
            //         color: Colors.white,
            //       ),
            //       suffixIcon: IconButton(
            //         icon: Icon(
            //           _obscureText1 ? Icons.visibility : Icons.visibility_off,
            //         ),
            //         onPressed: _toggleVisibility1,
            //       ),
            //       filled: true,
            //       fillColor: Colors.blueGrey,
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.62,
              height: MediaQuery.of(context).size.width * 0.12,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[500],
                  // minimumSize: Size(double.infinity,50)
                ),
                onPressed: () {},
                child: Text(
                  'Register',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: 'NotoSansLao'),
                ),
              ),
            ),
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
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'Or register with',
                      style: TextStyle(fontSize: 18, color: Colors.white),
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
                  'Already have account?',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                SizedBox(
                  width: 6,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    MaterialPageRoute route =
                        MaterialPageRoute(builder: (_) => LoginPage());
                    Navigator.of(context).push(route);
                  },
                  child: Text(
                    'Login',
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
    );
  }
}
