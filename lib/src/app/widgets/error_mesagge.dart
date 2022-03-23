import 'package:flutter/material.dart';

class ErrorMesagge extends StatelessWidget {
  final String message;
  final VoidCallback onPressed;

  const ErrorMesagge({Key? key, required this.message, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, 
        children: [
          Text(
            message,
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20,),
          ElevatedButton(onPressed: onPressed, child: const Text('Reintentar.'),)
        ]
      ),
    );
  }
}
