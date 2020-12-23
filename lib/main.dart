import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'networking.dart';
import 'login_screen.dart';
import 'cards_file.dart';

//void main() => runApp(MyApp());
void main() => runApp(LoginApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<Album> _futureAlbum;

  @override
  void initState() {
    super.initState();
    _futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch and delete Data Exemple',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text("Fetch and delete Data Exemple"),
          ),
          body: Center(
            child: FutureBuilder<Album>(
              future: _futureAlbum,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {

                  if (snapshot.hasData) {

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${snapshot.data?.title ?? 'Deleted'}'),
                        ElevatedButton(
                          child: Text('Delete Data'),
                          onPressed: () {
                            setState(() {
                              _futureAlbum=deleteAlbum(snapshot.data.id.toString());
                            });
                          },
                        ),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                }
                return CircularProgressIndicator();
              },
            ),
          )),
    );
  }
}
