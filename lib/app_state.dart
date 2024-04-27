import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  var current = WordPair.random();

  // ↓ Add this.
  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  // ↓ Add Favorites.
  var favorites = [];

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }

  void removeFavorite(pair) {
    favorites.remove(pair);
    notifyListeners();
  }
}
