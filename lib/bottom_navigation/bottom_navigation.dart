import 'package:flutter/material.dart';
import 'package:notify/bottom_navigation/call_logs/call_logs.dart';
import 'package:notify/bottom_navigation/groups/groups.dart';
import 'package:notify/routes/routes.dart';

import 'chats/chats.dart';

class AppNavigation extends StatefulWidget {
  @override
  _AppNavigationState createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  int _currentIndex = 1;

  final List<Widget> _children = [
    Chats(),
    Channels(),
    CallLogs(),
    CallLogs(),
  ];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final List<BottomNavigationBarItem> _items = [
      BottomNavigationBarItem(
        icon: Icon(Icons.chat),
        label: '',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.reduce_capacity),
        label: '',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.call),
        label: '',
      ),
    ];
    return Scaffold(
      body: _children[_currentIndex],
      appBar: AppBar(
        toolbarHeight: 70,
        leading: IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
        centerTitle: true,
        title: Text(
          'Notify'.toUpperCase(),
          style: theme.textTheme.headline6,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: () {
              Navigator.pushNamed(context, PageRoutes.profile);
            },
          ),
          SizedBox(
            width: 16,
          ),
        ],
      ),
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        children: [
          BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            selectedItemColor: Theme.of(context).primaryColor,
            unselectedItemColor: Theme.of(context).hintColor,
            items: _items,
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          /*PositionedDirectional(
            end: 24,
            bottom: 18,
            child: FloatingActionButton(
              onPressed: _currentIndex == 0
                  ? () {
                      Navigator.pushNamed(context, PageRoutes.newChat);
                    }
                  : _currentIndex == 1
                      ? () {
                          Navigator.pushNamed(context, PageRoutes.createGroup);
                        }
                      : () {},
              child: Icon(Icons.notifications),
              backgroundColor: Theme.of(context).primaryColor,
            ),
          ),*/
        ],
      ),
    );
  }
}
