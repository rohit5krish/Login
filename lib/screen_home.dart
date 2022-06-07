import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen_two.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HOME PAGE'),
        actions: [
          IconButton(
              onPressed: () {
                signout(context);
              },
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 254, 255, 254),
      body: SafeArea(
          child: ListView(
        children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Available Bikes',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'Game-of-squids'),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Container(
              width: 200,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    topRight: Radius.circular(30)),
                color: Colors.red,
              ),
              height: 270,
              child: Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ClipOval(
                      child: Image.asset(
                        'images/rc390.jpg',
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Text(
                      'RC390',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const Text('2020 - 45,000km',
                        style: TextStyle(fontSize: 15)),
                    const Text(
                      '₹1,75,000',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Container(
              width: 200,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    topLeft: Radius.circular(30)),
                color: Colors.red,
              ),
              height: 300,
              child: Padding(
                padding: const EdgeInsets.only(top: 7),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ClipRRect(
                      child: Image.asset('images/Duke390.jpg',
                          height: 200, width: 200, fit: BoxFit.cover),
                    ),
                    const Text(
                      'Duke 390',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const Text('2019 - 65,000km',
                        style: TextStyle(fontSize: 15)),
                    const Text(
                      '₹1,45,000',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Container(
              width: 200,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    topRight: Radius.circular(30)),
                color: Colors.red,
              ),
              height: 320,
              child: Padding(
                padding: const EdgeInsets.only(top: 10, right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ClipOval(
                      child: Image.asset(
                        'images/Z900.jpg',
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Text(
                      'Kawasaki Z900',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const Text('2021 - 30,000km',
                        style: TextStyle(fontSize: 15)),
                    const Text(
                      '₹5,50,000',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Container(
              width: 200,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    topLeft: Radius.circular(30)),
                color: Colors.red,
              ),
              height: 270,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ClipRRect(
                      child: Image.asset(
                        'images/YZF R15 V4 Model Image.jpg',
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Text(
                      'R15 V4',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const Text('2021 - 30,000km',
                        style: TextStyle(fontSize: 15)),
                    const Text(
                      '₹5,50,000',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      )),
    );
  }

  signout(BuildContext ctx) async {
    final _sharedpref = await SharedPreferences.getInstance();
    await _sharedpref.clear();

    showDialog(
        context: ctx,
        builder: (ctx) {
          return AlertDialog(
            title: const Text('Log Out'),
            content: const Text('Are You sure to want to log out?'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (ctx) => const LoginPage()),
                        (route) => false);
                  },
                  child: const Text('Yes')),
              TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: const Text('No'))
            ],
          );
        });
  }
}
