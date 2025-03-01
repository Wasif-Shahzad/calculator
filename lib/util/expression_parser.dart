import 'package:calculator/util/snackbar.dart';
import 'package:calculator/util/stack.dart';
import 'package:flutter/material.dart';

class ExpressionParser {
  var st = DStack<double>();
  var op = DStack<String>();

  bool delim(String c) => c == ' ';

  void processOperation(BuildContext context, String op) {
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
          SnackbarUtils.showSnackbar(context, 'Divison by zero error');
        }
        st.push(l / r);
        break;
      default:
        SnackbarUtils.showSnackbar(context, "Unknown operation: $op");
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

  String evaluateExpression(BuildContext context, String expression) {
    try {
      for (int i = 0; i < expression.length; i++) {
        if (delim(expression[i])) {
          continue;
        } else if (expression[i] == '(') {
          op.push(expression[i]);
        } else if (expression[i] == ')') {
          while (op.top() != '(') {
            processOperation(context, op.top());
            op.pop();
          }
          op.pop();
        } else if (isOperation(expression[i])) {
          String curOperation = expression[i];
          while (
              !op.isEmpty() && priority(op.top()) >= priority(curOperation)) {
            processOperation(context, op.top());
            op.pop();
          }
          op.push(curOperation);
        } else {
          double number = 0.0;
          int decimalPlace = 1;
          bool isDecimal = false;

          while (i < expression.length &&
              (isDigit(expression[i]) || expression[i] == '.')) {
            if (expression[i] == '.') {
              isDecimal = true;
            } else if (!isDecimal) {
              number = number * 10 + int.parse(expression[i]);
            } else {
              number = number + int.parse(expression[i]) / (decimalPlace *= 10);
            }
            i++;
          }
          i--;
          st.push(number);
        }
      }
      while (!op.isEmpty()) {
        processOperation(context, op.top());
        op.pop();
      }
      if (st.isEmpty()) {
        SnackbarUtils.showSnackbar(
            context, "Invalid expression: stack is empty");
      }
      double answer = st.top();
      if (st.length() != 1) {
        SnackbarUtils.showSnackbar(
            context, "Invalid expression: extra operands");
      }
      return answer.toString();
    } catch (e) {
      SnackbarUtils.showTrollSnackbar(context);
      return '';
    }
  }
}
