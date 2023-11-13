
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
      Padding(
        padding: const EdgeInsets.only(left: 80.0, right: 80, bottom: 80,
            top: 160),
        child: Image.asset('lib/images/ic_grocery.png', fit: BoxFit.contain,
            width: 300,height: 300),
      ),
      Padding(
        padding: const EdgeInsets.all(24.0),
        child: Text("We deliver groceries at your door step",
          textAlign: TextAlign.center,
          style: GoogleFonts.notoSerif(fontSize: 36, fontWeight: FontWeight.bold),
        ),
      ),

      const SizedBox(height: 24),

      Text("Fresh Items Everyday", style: TextStyle(color: Colors.grey[600]),),

      const Spacer(),

      GestureDetector(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder:
            (context) {
          return HomePage();
        },
        )),
        child: Container(
          decoration: BoxDecoration(color: Colors.purple, borderRadius:
          BorderRadius.circular(16)),
          padding: const EdgeInsets.all(24),
          child: const Text("Get Started", style: TextStyle(color: Colors.white),
              textDirection: TextDirection.ltr),
        ),
      ),

      const Spacer(),

    ],
    ));
  }

}
