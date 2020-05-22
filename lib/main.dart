import 'package:flutter/material.dart';

import 'list.dart';
import 'randomWordList.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // @override
  // Widget build(BuildContext context) {
  //   return new MaterialApp(
  //     title: 'Startup Name Generator',
  //     theme: new ThemeData(
  //       primaryColor: Colors.red,
  //     ),
  //     home: new RandomWords(),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new DefaultTabController(
        length: choices.length,
        child: new Scaffold(
          appBar: new AppBar(
            title: const Text('Tabbed AppBar'),
            bottom: new TabBar(
              isScrollable: true,
              tabs: choices.map((Choice choice) {
                return new Tab(
                  text: choice.title,
                  icon: new Icon(choice.icon),
                );
              }).toList(),
            ),
          ),
          body: new TabBarView(
            children: choices.map((Choice choice) {
              if (choice.key == '0') {
              return  new Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: new Text('首页'),
                );
              } else if (choice.key == '1') {
               return new Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: new RandomWords(),
                );
              } else if (choice.key == '2') {
              return  new Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: new ListPage(),
                );
              }
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class Choice {
  const Choice({this.key, this.title, this.icon});
  final String key;
  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(key: '0', title: '首页', icon: Icons.directions_car),
  const Choice(key: '1', title: '随机单词', icon: Icons.directions_bike),
  const Choice(key: '2', title: '路由demo', icon: Icons.directions_boat),
];

// class ChoiceCard extends StatelessWidget {
//   const ChoiceCard({Key key, this.choice}) : super(key: key);
//   final Choice choice;
//   @override
//   Widget build(BuildContext context) {
//     final TextStyle textStyle = Theme.of(context).textTheme.display1;
//     return new Card(
//       color: Colors.white,
//       child: new Center(
//         child: new Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             new Icon(choice.icon, size: 128.0, color: textStyle.color),
//             new Text(choice.title, style: textStyle),
//           ],
//         ),
//       ),
//     );
//   }
// }
