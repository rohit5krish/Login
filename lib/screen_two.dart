import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/screen_home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _userctrl = TextEditingController();
  final _passctrl = TextEditingController();
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 252, 244, 244),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'NIGHT HAWK',
                style: TextStyle(
                    fontFamily: 'Zidan', fontSize: 70, color: Colors.red[600]),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'The Moto Dealers',
                style: TextStyle(fontFamily: 'Fully-automatic', fontSize: 20),
              ),
              const SizedBox(
                height: 40,
              ),
              TextFormField(
                style: const TextStyle(fontFamily: 'Confession', fontSize: 20),
                controller: _userctrl,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Username'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter Username';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                style: const TextStyle(fontFamily: 'Confession', fontSize: 20),
                controller: _passctrl,
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Password'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter Password';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      check(context);
                    } else {
                      // ignore: avoid_print
                      print('Null Values');
                    }
                  },
                  icon: const Icon(Icons.check),
                  label: const Text('Login'))
            ],
          ),
        ),
      ),
    );
  }

  void check(BuildContext ctx) async {
    final _username = _userctrl.text;
    final _password = _passctrl.text;

    final _sharedpref = await SharedPreferences.getInstance();
    await _sharedpref.setBool(saved_val, true);

    if (_username == 'admin' && _password == 'passwd') {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
        return const HomePage();
      }));
    } else {
      ScaffoldMessenger.of(ctx).showSnackBar(const SnackBar(
        content: Text('Incorrect Password'),
        backgroundColor: Colors.red,
        margin: EdgeInsets.all(10),
        behavior: SnackBarBehavior.floating,
      ));
    }
  }
}
