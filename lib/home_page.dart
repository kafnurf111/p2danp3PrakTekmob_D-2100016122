import 'package:flutter/material.dart';
import 'package:namer_app/app_state.dart';
import 'package:namer_app/favorite_page.dart';
import 'package:namer_app/random_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    var pair = appState.current; // ← Add this.

    // ↓ Add Icon.
    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    List<BottomNavigationBarItem> items = [
      const BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: "Home",
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.favorite),
        label: "Favorite",
      ),
    ];

    List<Widget> screens = [
      RandomPage(pair: pair, appState: appState, icon: icon),
      const FavoritePage()
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("2100016122"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: items,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
      body: screens[currentIndex],
    );
  }
}
