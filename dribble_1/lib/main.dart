import 'package:dribbble_1/appbar.dart';
import 'package:dribbble_1/models/shoe.dart';
import 'package:dribbble_1/shoedetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

void main() {
  // timeDilation = 5.0;
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: Colors.white),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _tabIndex = 0;

  void _incrementTab(index) {
    setState(() {
      _tabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: heroAppBar(context: context),
        body: new HomeList(),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          currentIndex: _tabIndex, // this will be set when a new tab is tapped
          selectedItemColor: Colors.grey,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text(''),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.search),
              title: new Text(''),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.mail),
              title: new Text(''),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.shop),
              title: new Text(''),
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), title: Text(''))
          ],
          onTap: (index) {
            _incrementTab(index);
          },
        ),
        backgroundColor: Colors.white);
  }
}

class HomeList extends StatefulWidget {
  const HomeList({Key key}) : super(key: key);

  @override
  _HomeListState createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  List<Shoe> _items = [
    Shoe('AIR MAX 90 „EZ Black‟', '90', '\$149', '\$299', Color(0xFFF5F5F5),
        Image.asset('assets/images/shoe_air_max_90_ez_black.png')),
    Shoe('AIR MAX 270 „Gold‟', '270', '\$199', '\$349', Color(0xFFFFF6EA),
        Image.asset('assets/images/shoe_air_max_270_gold.png')),
    Shoe('AIR MAX 95 „Red‟', '95', '\$299', '\$399', Color(0xFFFEEBEE),
        Image.asset('assets/images/shoe_air_max_95_red.png')),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(left: 20, right: 20),
      itemBuilder: (_, index) {
        return ShoeListItem(shoe: _items[index]);
      },
      itemCount: _items.length,
    );
  }
}

class ShoeListItem extends StatelessWidget {
  const ShoeListItem({Key key, this.shoe}) : super(key: key);

  final Shoe shoe;

  Future navigateToSubPage(context) async {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ShoeDetailPage(shoe: shoe)));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12, bottom: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: GestureDetector(
          onTap: () {
            navigateToSubPage(context);
          },
          child: Container(
            color: shoe.backgroundColor,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Positioned.fill(
                        child: Hero(
                          tag: 'shoe_image_background_${shoe.name}',
                          child: Container(color: shoe.backgroundColor),
                        ),
                      ),
                      Hero(
                        tag: 'shoe_image_background_text_${shoe.name}',
                        child: Text(
                          shoe.backgroundText,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0x07000000),
                              fontSize: MediaQuery.of(context).size.width / 3,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Hero(tag: 'shoe_image_${shoe.name}', child: shoe.image),
                    ],
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Image.asset(
                          'assets/images/heart.png',
                          color: Color(0xFF707070),
                        ),
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Text(
                                shoe.name,
                                style: TextStyle(
                                    color: Color(0xFF7C6D6F), fontSize: 18),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 16.0),
                                child: Text(
                                  shoe.oldPrice,
                                  style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      color: Color(0xFFDD7F7A),
                                      fontSize: 18),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text(
                                  shoe.price,
                                  style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.w900),
                                ),
                              )
                            ],
                          ),
                        ),
                        Icon(Icons.add_shopping_cart, color: Color(0xFF707070)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
