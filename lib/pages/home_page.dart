import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myController = TextEditingController();

  void updateController(String toBeAdded) =>
    _myController.text += toBeAdded;

  void backspace(){
    String previous = _myController.text;
    String afterBackspace = '';
    try {
      afterBackspace = previous.substring(0, previous.length - 1);
    } on RangeError {
      return;
    }
    _myController.text = afterBackspace;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: 300, 
              height: 125,
              child: Align(
                alignment: Alignment.bottomRight,
                child: TextField(
                  controller: _myController,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    disabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => updateController('9'),
                  child: Container(
                    width: 75, 
                    height: 75,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 71, 71, 71),
                    ),
                    child: const Center(
                      child: Text(
                        '9',
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () => updateController('5'),
                  child: Container(
                    width: 75, 
                    height: 75,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 71, 71, 71),
                    ),
                    child: const Center(
                      child: Text(
                        '5',
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () => backspace(),
                  child: Container(
                    width: 75, 
                    height: 75,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 71, 71, 71),
                    ),
                    child: const Icon(Icons.backspace),
                  )
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text('hello'),
          ],
        ),
      ),
    );
  }
}