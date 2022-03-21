import 'package:cine_house/src/app/views/movie_details/widgets/actions_row.dart';
import 'package:cine_house/src/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class BottomCard extends StatelessWidget {
  const BottomCard({
    Key? key,
    required this.onPressed,
    required this.result,
  }) : super(key: key);

  final VoidCallback onPressed;
  final Result? result;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 8.0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              _buildDescriptionHeader(),
              const SizedBox(height: 20),
              Expanded(
                child: Text(
                  result!.overview,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildDescriptionHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Descripción',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        ActionsRow(onPressed: onPressed),
      ],
    );
  }
}