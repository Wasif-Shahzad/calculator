import 'package:flutter/material.dart';
import '../util/stack.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myController = TextEditingController();
  final backendController = TextEditingController();

  void updateController(String toBeAdded) {
    _myController.text += toBeAdded;
    switch (toBeAdded) {
      case '÷':
        backendController.text += '/';
      case '×':
        backendController.text += '*';
      default:
        backendController.text += toBeAdded;
    }
  }

  void backspace() {
    String previous = _myController.text;
    String afterBackspace = '';
    String backendAfterBackspace = '';
    try {
      backendAfterBackspace = previous.substring(0, previous.length - 1);
      afterBackspace = previous.substring(0, previous.length - 1);
    } on RangeError {
      return;
    }
    _myController.text = afterBackspace;
    backendController.text = backendAfterBackspace;
  }

  void clearController() {
    _myController.clear();
    backendController.clear();
  }

  void giveAnswer() {
    var exp = ExpressionParser();
    String result = exp.evaluateExpression(backendController.text);
    _myController.text = result;
    backendController.text = result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
                Button(
                  displayText: 'AC',
                  onTap: () => clearController(),
                  backgroundColor: Colors.orange.shade400,
                ),
                const SizedBox(width: 5),
                Button(
                  displayText: '(',
                  onTap: () => updateController('('),
                  backgroundColor: const Color.fromARGB(255, 71, 71, 71),
                ),
                const SizedBox(width: 5),
                Button(
                  displayText: ')',
                  onTap: () => updateController(')'),
                  backgroundColor: const Color.fromARGB(255, 71, 71, 71),
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
                    )),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Button(
                  displayText: '7',
                  onTap: () => updateController('7'),
                  backgroundColor: const Color.fromARGB(255, 71, 71, 71),
                ),
                const SizedBox(
                  width: 5,
                ),
                Button(
                  displayText: '8',
                  onTap: () => updateController('8'),
                  backgroundColor: const Color.fromARGB(255, 71, 71, 71),
                ),
                const SizedBox(
                  width: 5,
                ),
                Button(
                  displayText: '9',
                  onTap: () => updateController('9'),
                  backgroundColor: const Color.fromARGB(255, 71, 71, 71),
                ),
                const SizedBox(
                  width: 5,
                ),
                Button(
                  displayText: '÷',
                  onTap: () => updateController('÷'),
                  backgroundColor: Colors.orange.shade400,
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Button(
                  displayText: '4',
                  onTap: () => updateController('4'),
                  backgroundColor: const Color.fromARGB(255, 71, 71, 71),
                ),
                const SizedBox(
                  width: 5,
                ),
                Button(
                  displayText: '5',
                  onTap: () => updateController('5'),
                  backgroundColor: const Color.fromARGB(255, 71, 71, 71),
                ),
                const SizedBox(
                  width: 5,
                ),
                Button(
                  displayText: '6',
                  onTap: () => updateController('6'),
                  backgroundColor: const Color.fromARGB(255, 71, 71, 71),
                ),
                const SizedBox(
                  width: 5,
                ),
                Button(
                  displayText: '×',
                  onTap: () => updateController('×'),
                  backgroundColor: Colors.orange.shade400,
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Button(
                  displayText: '1',
                  onTap: () => updateController('1'),
                  backgroundColor: const Color.fromARGB(255, 71, 71, 71),
                ),
                const SizedBox(
                  width: 5,
                ),
                Button(
                  displayText: '2',
                  onTap: () => updateController('2'),
                  backgroundColor: const Color.fromARGB(255, 71, 71, 71),
                ),
                const SizedBox(
                  width: 5,
                ),
                Button(
                  displayText: '3',
                  onTap: () => updateController('3'),
                  backgroundColor: const Color.fromARGB(255, 71, 71, 71),
                ),
                const SizedBox(
                  width: 5,
                ),
                Button(
                  displayText: '-',
                  onTap: () => updateController('-'),
                  backgroundColor: Colors.orange.shade400,
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Button(
                  displayText: '=',
                  onTap: () => giveAnswer(),
                  backgroundColor: Colors.orange.shade400,
                ),
                const SizedBox(
                  width: 5,
                ),
                Button(
                  displayText: '0',
                  onTap: () => updateController('0'),
                  backgroundColor: const Color.fromARGB(255, 71, 71, 71),
                ),
                const SizedBox(
                  width: 5,
                ),
                Button(
                  displayText: '.',
                  onTap: () => updateController('.'),
                  backgroundColor: const Color.fromARGB(255, 71, 71, 71),
                ),
                const SizedBox(
                  width: 5,
                ),
                Button(
                  displayText: '+',
                  onTap: () => updateController('+'),
                  backgroundColor: Colors.orange.shade400,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  final String displayText;
  final void Function() onTap;
  final Color? backgroundColor;
  const Button({
    super.key,
    required this.displayText,
    required this.onTap,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => onTap(),
        child: Container(
          width: 75,
          height: 75,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: backgroundColor,
          ),
          alignment: Alignment.center,
          child: Center(
            child: Text(
              displayText,
              style: const TextStyle(
                height: 0,
                fontSize: 28,
                color: Colors.white,
              ),
            ),
          ),
        ));
  }
}

class ExpressionParser {
  var st = DStack<double>();
  var op = DStack<String>();

  bool delim(String c) => c == ' ';

  void processOperation(String op) {
    double r = st.top();
    st.pop();
    double l = st.top();
    st.pop();
    switch (op) {
      case '+':
        st.push(l + r);
        break;
      case '-':
        st.push(l - r);
        break;
      case '*':
        st.push(l * r);
        break;
      case '/':
        if (r == 0) {
          throw ArgumentError("Division by zero");
        }
        st.push(l / r);
        break;
      default:
        throw ArgumentError("Unknown operation: $op");
    }
  }

  bool isOperation(String c) => c == '+' || c == '-' || c == '*' || c == '/';

  int priority(String operation) {
    if (operation == '+' || operation == '-') {
      return 1;
    } else if (operation == '*' || operation == '/') {
      return 2;
    }
    return -1;
  }

  bool isDigit(String s) {
    if (s.length != 1) {
      return false;
    }
    final RegExp digitRegExp = RegExp(r'^\d$');
    return digitRegExp.hasMatch(s);
  }

  String evaluateExpression(String expression) {
    try {
      for (int i = 0; i < expression.length; i++) {
        if (delim(expression[i])) {
          continue;
        } else if (expression[i] == '(') {
          op.push(expression[i]);
        } else if (expression[i] == ')') {
          while (op.top() != '(') {
            processOperation(op.top());
            op.pop();
          }
          op.pop();
        } else if (isOperation(expression[i])) {
          String curOperation = expression[i];
          while (
              !op.isEmpty() && priority(op.top()) >= priority(curOperation)) {
            processOperation(op.top());
            op.pop();
          }
          op.push(curOperation);
        } else {
          double number = 0;
          while (i < expression.length && isDigit(expression[i])) {
            number = number * 10 + int.parse(expression[i++]);
          }
          i--;
          st.push(number);
        }
      }
      while (!op.isEmpty()) {
        processOperation(op.top());
        op.pop();
      }
      if (st.isEmpty()) {
        throw ArgumentError("Invalid expression: stack is empty");
      }
      double answer = st.top();
      if (st.length() != 1) {
        throw ArgumentError("Invalid expression: extra operands");
      }
      return answer.toString();
    } catch (e) {
      return "Error: ${e.toString()}";
    }
  }
}
