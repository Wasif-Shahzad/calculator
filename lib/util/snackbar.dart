import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class SnackbarUtils {
  static void showSnackbar(BuildContext context, String text) {
    final player = AudioPlayer();
    String check = text.substring(0, 5);
    print(check);
    if (check == 'Error') {
      player.play(AssetSource('quack.mp3'));
    }
    final snackbar = SnackBar(
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 10,
        ),
        behavior: SnackBarBehavior.floating,
        width: 400,
        duration: const Duration(seconds: 4),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                text,
                textAlign: TextAlign.center,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                player.stop();
              },
            )
          ],
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
