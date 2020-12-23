import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'search_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  static List<Widget> _widgetsOptions = [
    Home(),
    SearchScreen(),
    Text('Hello 3'),
    Text('Hello 4'),
    Text('Hello 5'),
  ];
  
  int _selectedIndex = 0;

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shadowColor: null,
        title: Image.asset("assets/instagram_logo.png"),
        actions: [
          Icon(Icons.add_box_outlined),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
          ),
          Icon(Icons.favorite_border),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
          ),
          Icon(Icons.chat_outlined),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
          ),
        ],
      ),
      body: _widgetsOptions.elementAt(_selectedIndex),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home), label: "home",),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_rounded), label: "search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.video_collection), label: "explore"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_rounded), label: "cart"),
          BottomNavigationBarItem(
              icon: ImageIcon(
                  AssetImage(
                    "assets/download.jpeg",
                  ),
                  color: Color(0xFF3A5A98)),
              label: "account"),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget listView() {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 110,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              storyImage(70, 70),
              storyImage(70, 70),
              storyImage(70, 70),
              storyImage(70, 70),
              storyImage(70, 70),
              storyImage(70, 70),
              storyImage(70, 70),
            ],
          ),
        ),
        Divider(),
        post(),
        post(),
        post(),
        post(),
      ],
    );
  }

  Widget post() {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              circularImage(30, 30),
              Expanded(
                child: Text('artworks_station',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Container(
                margin: EdgeInsets.all(8),
                child: Icon(Icons.more_vert),
              ),
            ],
          ),
          Image.asset(
            "assets/download.jpeg",
            width: 600,
            height: 240,
            fit: BoxFit.cover,
          ),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    FavoriteIconButton(),
                    CommentButton(),
                    SendButton(),
                  ],
                ),
              ),
              Container(
                child: IconButton(
                  icon: Icon(Icons.bookmark_border_outlined),
                  onPressed:() => print('bookmark tapped'),
                  ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: Text('124 likes',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Container(
                margin: EdgeInsets.all(8),
                child: RichText(
                  text: TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                            text: 'artworks_station  ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: "How would you call her ? "),
                        TextSpan(
                            text: "...more",
                            style: TextStyle(
                              color: Colors.grey,
                            ))
                      ]),
                ),
              ),
              Row(
                children: [
                  circularImage(20, 20),
                  RichText(
                    text: TextSpan(
                      text: 'add a comment',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                child:Text(
                  '6 hours ago',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 8,
                  ),
                )
              ),

            ],
          ),
          SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }

  Widget circularImage(double width, double height) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage("https://i.imgur.com/Wo98jHG.jpeg"),
          //AssetImage("assets/profile.png"),
          // NetworkImage("https://i.imgur.com/BoN9kdC.png"),
        ),
      ),
    );
  }

  Widget storyImage(double width, double height) {
    return Column(
      children: [
        circularImage(55, 55),
        Text(
          'Your Story',
          style: TextStyle(fontSize: 12),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: listView(),
    );
  }
}

class FavoriteIconButton extends StatefulWidget {
  @override
  _FavoriteIconButtonState createState() => _FavoriteIconButtonState();
}

class _FavoriteIconButtonState extends State<FavoriteIconButton> {
  bool _favorite = false;

  void _toggleFavorite() {
    setState(() {
      _favorite = !_favorite;

      print(_favorite);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        icon: Icon(
          _favorite ? Icons.favorite : Icons.favorite_border,
        ),
        color: _favorite ? Colors.red[500] : null,
        onPressed: _toggleFavorite,
      ),
    );
  }
}


class CommentButton extends StatefulWidget {
  @override
  _CommentButtonState createState() => _CommentButtonState();
}

class _CommentButtonState extends State<CommentButton> {
  @override
  Widget build(BuildContext context) {
    return
        Container(
          child:IconButton(
            icon : Icon(Icons.comment_outlined),
            onPressed:() => print('comments pressed'),
          )
        );
  }
}



class SendButton extends StatefulWidget {
  @override
  _SendButtonState createState() => _SendButtonState();
}

class _SendButtonState extends State<SendButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(icon: Icon(Icons.send),
        onPressed: () => print('send pressed'),
      )
    );
  }
}



class PlayIcon extends StatefulWidget {
  @override
  _PlayIconState createState() => _PlayIconState();
}

class _PlayIconState extends State<PlayIcon> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  bool _isplaying = false;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(microseconds: 450));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  void _handleOnPressed() {

    setState(() {
      _isplaying = !_isplaying;
      _isplaying
          ? _animationController.forward()
          : _animationController.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: IconButton(
        splashColor: Colors.greenAccent,
        iconSize: 80,
        icon: AnimatedIcon(
          icon: AnimatedIcons.play_pause,
          progress: _animationController,
        ),
        onPressed: () => _handleOnPressed(),
      ),
    );
  }
}
