import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'cards_file.dart';
import 'home.dart';




const MaterialColor white = const MaterialColor(
  0xFFFFFFFF,
  const <int, Color>{
    50: const Color(0xFFFFFFFF),
    100: const Color(0xFFFFFFFF),
    200: const Color(0xFFFFFFFF),
    300: const Color(0xFFFFFFFF),
    400: const Color(0xFFFFFFFF),
    500: const Color(0xFFFFFFFF),
    600: const Color(0xFFFFFFFF),
    700: const Color(0xFFFFFFFF),
    800: const Color(0xFFFFFFFF),
    900: const Color(0xFFFFFFFF),
  },
);


class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login",
      theme: ThemeData(
          primarySwatch: white,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  /*backgroundColor: MaterialStateProperty.resolveWith(
              (states) {
                if (states.contains(MaterialState.pressed))
                  //return Theme.of(context).colorScheme.primary.withOpacity(0.5);
                    return Colors.red;

                return null;
              },
            ),*/
                  backgroundColor: MaterialStateProperty.all(Colors.red)))),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Dovahkiin',
          style: TextStyle(
              color: Colors.red, fontSize: 30, fontWeight: FontWeight.bold),
          children: [
            TextSpan(
              text: ' Store',
              style: TextStyle(color: Colors.amber),
            )
          ]),
    );
  }

  Widget _text_input(String title, {bool isPassword = false}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(8.0),
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 32),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                )),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              obscureText: isPassword,
              decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Color(0xfff3f3f4),
                filled: true,
              ))
        ],
      ),
    );
  }

  Widget tex(){
  }


  Widget _testButton() {
    return ElevatedButton(
      child: Container(
        width: MediaQuery.of(context).size.width - 64,
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Align(
            alignment: Alignment.center,
            child: Text(
              "Fire",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            )),
      ),
      onPressed: () {
      },
    );
  }

  Widget stupid_button() {
    return Container(
      height: 50.0,
      child: RaisedButton(
        onPressed: ()  {
          //
          // //final myFuture=  http.get('http://www.example.com');
          // final future =  http.get('http://www.example.com');
          // //myFuture.then((response){
          // future.then((response){
          //   if(response.statusCode == 200)
          //     print('Successzzz');
          //   else
          //     print('Failure');
          //   });
          Navigator.pushReplacement(context,
            //MaterialPageRoute(builder: (context) =>CardPage()));
            MaterialPageRoute(builder: (context) =>HomeScreen()));
        },
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        padding: EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
              //gradient: LinearGradient(colors: [Color(0xff374ABE), Color(0xff64B6FF)],
              gradient: LinearGradient(
                colors: [Colors.red, Colors.orange],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(30.0)),
          child: Container(
            constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
            alignment: Alignment.center,
            child: Text(
              "Login",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }

  Widget _linkText() {
    return Container(
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
          text: 'Don\'t have an account ?',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
          children: [
            TextSpan(
                text: ' create one !',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _title(),
            SizedBox(height: 16),
            _text_input("Email"),
            _text_input("Password", isPassword: true),
            SizedBox(height: 16),
            stupid_button(),
            SizedBox(
              height: 8,
            ),
            _linkText(),
          ],
        ),
      ),
    );
  }
}
