// : prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:calculator_hw1/button_values.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  // values that can be input
  String number1 = ""; // . 0 - 9
  String operand = ""; // + - * /
  String number2 = ""; // . 0 - 9

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    // ####error with screen not showing, bottom over flow pixle size
    // resolved from button size issue, covering output display
    // due to width in Wrap-> button children hight -> width

    return Scaffold(
      appBar: AppBar(
        title: const Text('Virgil : Calculator'),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // output screen
            // uses expanded -> child widgets to make output screen scrollable,
            // use case of long results
            Expanded(
              child: SingleChildScrollView(
                reverse: true,
                child: Container(
                  alignment: Alignment.bottomRight,
                  padding: const EdgeInsets.all(16),
                  // screen equations input, show correct inputs using if elses ~~ "?,:" operands
                  child: Text(
                    //test area non functional
                    // "000000"
                    //test area funtional
                    "$number1$operand$number2".isEmpty
                        ? "0"
                        : "$number1$operand$number2",
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ),

            // buttons
            // use 'wrap ' to have muliple widgets inside, like individual functional buttons'
            Wrap(
              children: CalBtn.buttonValues
                  .map(
                    (value) => SizedBox(
                      width: screenSize.width / 4,
                      height: screenSize.width / 5,
                      child: buildButton(value),
                    ),
                  )
                  .toList(),
            )
          ],
        ),
      ),
    );
  }

  // #########
  Widget buildButton(value) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Material(
        //color behavior of these buttons,using a if bool contins the value from list
        color: getBtnColor(value),
        clipBehavior: Clip.hardEdge,
        shape: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white54,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        child: InkWell(
          // button function that corresponds to subsequent tapped button
          onTap: () => onCalBtnTap(value),
          child: Center(
            child: Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ######
  // reserving operand and number 2 for new input
  //making only number1 mosst used for input/solution calculations
  void onCalBtnTap(String value) {
    if (value == CalBtn.del) {
      delete();
      return;
    }

    if (value == CalBtn.clr) {
      clearAll();
      return;
    }

    if (value == CalBtn.per) {
      convertsToPercentage();
      return;
    }

    if (value == CalBtn.calculate) {
      calculate();
      return;
    }
    if (value == CalBtn.intPosNeg) {
      toggleIntPosNeg();
      return;
    }

    appendValue(value);
  }

  // ##############
  // changes number1 to postive or negtive
  void toggleIntPosNeg() {
    setState(() {
      if (number1.isNotEmpty) {
        if (number1.startsWith("-")) {
          //checks if number in number1 value is a negtaive
          number1 = number1.substring(1);
        } else {
          // checks if number in number1 is instead a postive
          number1 = "-$number1";
        }
      }
    });
  }

  // ##############
  // solutions for input
  void calculate() {
    if (number1.isEmpty) return;
    if (operand.isEmpty) return;
    if (number2.isEmpty) return;

    double num1 = double.parse(number1);
    double num2 = double.parse(number2);

    var result = 0.0;
    switch (operand) {
      case CalBtn.add:
        result = num1 + num2;
        break;
      case CalBtn.subtract:
        result = num1 - num2;
        break;
      case CalBtn.multiply:
        result = num1 * num2;
      // division by zero exception
      case CalBtn.divide:
        if (num2 == 0) {
          result = double.nan;
        } else {
          result = num1 / num2;
        }
        break;
      case CalBtn.intPosNeg:
      default:
    }

    setState(() {
      //result by zero case
      if (result.isNaN) {
        number1 = "error: can't divide by zero";
      } else {
        number1 = "$result";
        if (number1.endsWith(".0")) {
          number1 = number1.substring(0, number1.length - 2);
        }
      }

      operand = "";
      number2 = "";
    });
  }

  // #############
  // percentage button functionality
  void convertsToPercentage() {
    if (number1.isNotEmpty && operand.isNotEmpty && number2.isNotEmpty) {
      //calculates before percentage conversion
      calculate();
    }
    //when input ends with a operand symbol percentge wont work
    if (operand.isNotEmpty) {
      return;
    }

    final number = double.parse(number1);

    setState(() {
      number1 = "${(number / 100)}";
      operand = "";
      number2 = "";
    });
  }

  // #########
  // clears output with "C" functionality
  void clearAll() {
    number1 = "";
    operand = "";
    number2 = "";

    setState(() {});
  }

  // ####################
  // removes elements of input from right most removale check
  //for number1, opernad and number2
  void delete() {
    if (number2.isNotEmpty) {
      number2 = number2.substring(0, number2.length - 1);
    } else if (operand.isNotEmpty) {
      operand = "";
    } else if (number1.isNotEmpty) {
      number1 = number1.substring(0, number1.length - 1);
    }

    setState(() {});
  }

  // ###########
  //append value to end of input
  void appendValue(String value) {
    //equation = number1 operand number2
    // eqution = 64 + 32
    //cheks if input si '.' or not a number
    if (value != CalBtn.dot && int.tryParse(value) == null) {
      //checks for operand press / second number input and assigns proper input
      if (operand.isNotEmpty && number2.isNotEmpty) {
        calculate();
      }
      operand = value;
    }
    // assign value input to number 1 variable
    else if (number1.isEmpty || operand.isEmpty) {
      // check for either first input or operand is empty,
      // keeps assigning new numbers to first input if there is no operand
      //  "21" "no operand" ""
      //check for floating point numbers in number 1
      if (value == CalBtn.dot && number1.contains(CalBtn.dot)) return;
      if (value == CalBtn.dot && (number1.isEmpty || number1 == CalBtn.dot)) {
        //case if number1  == "empty" | "zero"
        value = "0.";
      }
      number1 += value;

      //number 2 assign
    } else if (number2.isEmpty || operand.isNotEmpty) {
      // check for either first input or operand is empty,
      // keeps assigning new numbers to first input if there is no operand
      //  " " "no operand" "24"
      //check for floating point numbers in number 1
      if (value == CalBtn.dot && number2.contains(CalBtn.dot)) return;
      if (value == CalBtn.dot && (number2.isEmpty || number2 == CalBtn.dot)) {
        //case if number2  == "empty" | "zero", to continue add floating point digits
        value = "0.";
      }
      number2 += value;
    }

    setState(() {
      // update state, to append subsequent vlaues with first value
    });
  }

  // #######
  Color? getBtnColor(value) {
    return [CalBtn.del, CalBtn.clr].contains(value)
        ? Colors.amber[700]
        : [
            CalBtn.per,
            CalBtn.multiply,
            CalBtn.add,
            CalBtn.subtract,
            CalBtn.divide,
            CalBtn.calculate,
            CalBtn.intPosNeg,
            // button colors for functional operands then numbers
          ].contains(value)
            ? Colors.teal[900]
            : Colors.blueGrey[800];
  }
}
