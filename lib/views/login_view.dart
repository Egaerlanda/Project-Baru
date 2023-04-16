import 'package:apkega/views/dashboard_view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key}) ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            JudulLogin(),

            Stack(
              children: [
                CardFormLogin(),
                Center(
                  child: Image.asset('assets/residential.png',
                  width: 150,
                            ),
                ),
            
              ],
            )
            
          ],
        ),
      ),
    );
  }
}

class JudulLogin extends StatelessWidget {
  const JudulLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100, bottom: 20),
      child: Text('Smart Village\nPeniti Dalam Dua',
      style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
      ),
    );
  }
}

class CardFormLogin extends StatelessWidget {
  const CardFormLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: Color.fromARGB(255, 121, 192, 240),
        elevation: 0,
        margin: EdgeInsets.symmetric(horizontal: 40, vertical: 130),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
        child: Column(
          children: [
            SizedBox(height: 30,
            ),
            Inputan(),
            Inputan(),
            TombolLogin(),
              SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}

class TombolLogin extends StatelessWidget {
  const TombolLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){
      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(builder: (bc){
          return DashboardView();
        }));
    },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 223, 103, 73),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text('Login'),
      ));
  }
}

class Inputan extends StatelessWidget {
  const Inputan({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20)
          ),
          fillColor: Colors.white,
          contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          isDense: true,
          filled: true),
    
      ),
    );
  }
}