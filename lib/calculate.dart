import 'package:flutter/material.dart';
import 'package:expressions/expressions.dart';
import 'dart:math' as math;

class Calculate extends StatefulWidget {
  const Calculate({Key? key});

  @override
  State<Calculate> createState() => _CalculateState();
}

class _CalculateState extends State<Calculate> {
  String input = '';
  String accumulator = '';

  void _onNumberPressed(String number) {
    setState(() {
      input += number;
      accumulator += number;
    });
  }

  void _onOperationPressed(String op) {
    setState(() {
      if (input.isNotEmpty || op == '(' || op == ')') {
        input += op;
        accumulator += ' $op ';
      }
    });
  }

  void _onCalculatePressed() {
    setState(() {
      if (input.isNotEmpty) {
        try {
          // Replace ^ with pow and handle parentheses
          final modifiedInput = input.replaceAllMapped(
              RegExp(r'(\([^()]+\)|\d+)\s*\^\s*(\d+)'), (match) {
            return 'pow(${match.group(1)}, ${match.group(2)})';
          });

          final expression = Expression.parse(modifiedInput);
          final evaluator = const ExpressionEvaluator();
          final result = evaluator.eval(expression, {
            'pow': (num base, num exponent) => math.pow(base, exponent)
          });
          accumulator += ' = $result';
          input = result.toString();
        } catch (e) {
          print('Error: $e'); // Log the error for debugging
          accumulator += ' = Error';
        }
      }
    });
  }

  void _onClearPressed() {
    setState(() {
      input = '';
      accumulator = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Text(
                  '$accumulator',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                color: Colors.green[700],
              ),
            ),
          ],
        ),
        Wrap(
          children: List.generate(10, (index) {
            return Container(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () => _onNumberPressed(index.toString()),
                child: Text(index.toString()),
              ),
            );
          }),
        ),
        Wrap(
          children: ['+', '-', '*', '/', '(', ')', '^'].map((op) {
            return Container(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () => _onOperationPressed(op),
                child: Text(op),
              ),
            );
          }).toList(),
        ),
        Container(
          padding: const EdgeInsets.all(20),
          child: ElevatedButton(
            onPressed: _onCalculatePressed,
            child: const Text('Calculate'),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(20),
          child: ElevatedButton(
            onPressed: _onClearPressed,
            child: const Text('Clear'),
          ),
        ),
      ],
    );
  }
}

