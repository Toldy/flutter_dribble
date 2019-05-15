import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

void main() {
  timeDilation = 5.0;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Text("Youhou")],
          ),
          SnackNavigationBar(),
          // BottomNavigationBar
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(items: [
      //   BottomNavigationBarItem(
      //     icon: Icon(Icons.home),
      //     title: Text("Home2"),
      //   ),
      //   BottomNavigationBarItem(
      //     title: Text("Home2"),
      //     icon: Icon(Icons.home),
      //   ),
      // ]),
    );
  }
}

class SnackNavigationBar extends StatefulWidget {
  const SnackNavigationBar({
    Key key,
  }) : super(key: key);

  @override
  _SnackNavigationBarState createState() => _SnackNavigationBarState();
}

class _SnackNavigationBarState extends State<SnackNavigationBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<SnackBarItem> tiles = <SnackBarItem>[];
    for (int i = 0; i < 5; i++) {
      tiles.add(SnackBarItem(
        onTap: () {
          print('ok');
          tiles[_selectedIndex].state.setState(() {
            tiles[_selectedIndex].state.selected = false;
          });
          print(_selectedIndex);
          _selectedIndex = i;
          print(_selectedIndex);
          tiles[_selectedIndex].state.setState(() {
            tiles[_selectedIndex].state.selected = true;
          });
        },
        icon: Hero(tag: 'icon_$i', child: Icon(Icons.home)),
        title: Text('Home'),
      ));
    }

    return Container(
      alignment: Alignment.bottomCenter,
      child: Container(
        color: Colors.red,
        child: SafeArea(
          child: Container(
            height: 50,
            padding: EdgeInsets.only(top: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: tiles,
            ),
          ),
        ),
      ),
    );
  }
}

class SnackBarItem extends StatefulWidget {
  SnackBarItem({
    Key key,
    @required this.onTap,
    @required this.icon,
    @required this.title,
  }) : super(key: key);

  final VoidCallback onTap;
  final Widget icon;
  final Text title;

  _SnackBarItemState state;

  @override
  _SnackBarItemState createState() {
    if (state == null) {
      state = _SnackBarItemState(onTap, icon, title);
    }
    return state;
  }
}

class _SnackBarItemState extends State<SnackBarItem> {
  bool selected = false;

  final VoidCallback onTap;
  final Widget icon;
  final Text title;

  _SnackBarItemState(this.onTap, this.icon, this.title);

  @override
  Widget build(BuildContext context) {
    Widget item;

    if (selected) {
      item = SnackBarItemExpanded(
        icon: icon,
        title: title,
      );
    } else {
      item = SnackBarItemCollapsed(
        icon: icon,
        title: title,
      );
    }

    return GestureDetector(onTap: onTap, child: item);
  }
}

class SnackBarItemExpanded extends StatefulWidget {
  const SnackBarItemExpanded({
    Key key,
    @required this.icon,
    @required this.title,
  }) : super(key: key);

  final Widget icon;
  final Text title;

  @override
  _SnackBarItemExpandedState createState() =>
      _SnackBarItemExpandedState(icon: icon, title: title);
}

class _SnackBarItemExpandedState extends State<SnackBarItemExpanded> {
  bool selected = false;

  final Widget icon;
  final Text title;

  _SnackBarItemExpandedState({
    @required this.icon,
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(left: (50 - 4) / 2 / 1.5, right: (50 - 4) / 2 / 1.5),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.all(Radius.circular((50 - 4) / 2)),
      ),
      child: Row(
        children: <Widget>[
          icon,
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: title,
          )
        ],
      ),
    );
  }
}

class SnackBarItemCollapsed extends StatefulWidget {
  const SnackBarItemCollapsed({
    Key key,
    @required this.icon,
    @required this.title,
  }) : super(key: key);

  final Widget icon;
  final Text title;

  @override
  _SnackBarItemCollapsedState createState() =>
      _SnackBarItemCollapsedState(icon: icon, title: title);
}

class _SnackBarItemCollapsedState extends State<SnackBarItemCollapsed> {
  bool selected = false;

  final Widget icon;
  final Text title;

  _SnackBarItemCollapsedState({
    @required this.icon,
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: icon,
    );
  }
}
