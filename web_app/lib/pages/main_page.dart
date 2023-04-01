import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 150.0),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Success - Main Page',
              style: TextStyle(
                fontSize: 15,
                color: Colors.blue,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              color: Color.fromARGB(255, 93, 136, 212),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () async {
                    // AuthService.signOut();
                  },
                  child: Container(
                    height: 50,
                    child: Center(child: const Text('LogOut')),
                  ),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
