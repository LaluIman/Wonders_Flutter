import 'package:flutter/material.dart';
import 'wonder.dart';

class DetailView extends StatelessWidget {
  final Wonder wonder;

  const DetailView({super.key, required this.wonder});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(wonder.name, style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWideScreen = constraints.maxWidth > 600;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(wonder.imageUrl, height: isWideScreen ? 400 : 200, width: double.infinity, fit: BoxFit.cover),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    wonder.name,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.map, color: Colors.red),
                      const SizedBox(width: 4),
                      const Text('Location: ', style: TextStyle(fontSize: 18)),
                      Text(
                        wonder.location,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.yellow),
                      const SizedBox(width: 4),
                      const Text('Rating: ', style: TextStyle(fontSize: 18)),
                      Text(
                        wonder.rating.toString(),
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Description of the wonder:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    wonder.description,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
