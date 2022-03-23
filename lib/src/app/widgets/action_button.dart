import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String title;
  final String value;

  const ActionButton({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(title.toUpperCase(), style: const TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
          Text(value, textAlign: TextAlign.center, style: TextStyle(color: Colors.grey.shade800),),
        ],
      )
    );
  }
}