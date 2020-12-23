import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Testing Horizontal ListView'),
      ),
      body: MyListView(),

    );
  }
}


class MyListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return myListView();
  }
  Widget myListView(){
    return Container(
      height: 160,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [mycard(),mycard(),mycard(),mycard(),mycard(),mycard()],
      ),
    ) ;
  }

  Widget mycard(){
    return Card(
      elevation: 9,
      margin: EdgeInsets.fromLTRB(4, 16, 4, 16),
      child: Container(
        alignment: Alignment.center,
        width: 100,
        height: 50,
        child: Text('Hello Algeria'),
      ),
    );
  }
}



class CardElement extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const ListTile(
                  leading: Icon(Icons.album),
                  title: Text('The Enchanted Nightingale'),
                  subtitle:
                      Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {}, child: const Text('BUY TICKETS')),
                    TextButton(onPressed: () {}, child: const Text('LISTEN')),
                    const SizedBox(width: 8),
                  ],
                )
              ],
            ),
          ),
          Card(
            elevation: 9,
            margin: EdgeInsets.all(16),
            child: Container(
              alignment: Alignment.center,
              width: 100,
              height: 50,
              child: Text('Hello Algeria'),
            ),
          ),
        ],
      ),
    );
  }
}
