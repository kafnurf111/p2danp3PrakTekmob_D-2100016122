import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/app_state.dart';
import 'package:namer_app/components/big_card.dart';

class RandomPage extends StatelessWidget {
  const RandomPage(
      {super.key,
      required this.pair,
      required this.appState,
      required this.icon});

  final WordPair pair;
  final AppState appState;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // ← Add this.
        children: [
          BigCard(pair: pair), // ← Change to this.
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  appState.toggleFavorite();
                },
                label: const Text('Like'),
                icon: Icon(icon),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  appState.getNext();
                },
                child: const Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
