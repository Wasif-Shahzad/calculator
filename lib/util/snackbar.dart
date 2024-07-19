import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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

  static void showTrollSnackbar(BuildContext context) {
    final player = AudioPlayer();
    player.play(AssetSource('quack.mp3'));
    final snackbar = SnackBar(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 10,
      ),
      behavior: SnackBarBehavior.floating,
      width: 450,
      duration: const Duration(seconds: 5),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: RichText(
              text: TextSpan(
                text:
                    "Congratulations, you hit one of our features we want to promote new developers to improve. 🎉\nVisit: ",
                style: TextStyle(color: Colors.white),
                children: [
                  TextSpan(
                    text: "https://github.com/Wasif-Shahzad/calculator",
                    style: const TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        const url =
                            'https://github.com/Wasif-Shahzad/calculator';
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                  ),
                  const TextSpan(
                    text: "\nAnd show us your skills with a Pull-Request! 🦾",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
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
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
