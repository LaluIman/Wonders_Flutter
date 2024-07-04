// main.dart
import 'package:flutter/material.dart';
import 'detailview.dart';
import 'wonder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '7 Wonders of the World',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainView(),
    );
  }
}

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  List<Wonder> wonders = [
    Wonder(
      name: 'Great Wall of China',
      location: 'China',
      rating: 4.8,
      imageUrl: 'lib/images/wall.jpg',
      description:
          'The Great Wall of China is a series of fortifications made of stone, brick, tamped earth, wood, and other materials, generally built along an east-to-west line across the historical northern borders of China to protect against invasions and raids.',
    ),
    Wonder(
      name: 'Petra',
      location: 'Jordan',
      rating: 4.7,
      imageUrl: 'lib/images/petra.jpg',
      description:
          'Petra is a historical and archaeological city famous for its rock-cut architecture and water conduit system. It was the capital of the Nabataean Kingdom and is famous for its rock-cut architecture and water conduit system.',
    ),
    Wonder(
      name: 'Christ the Redeemer',
      location: 'Brazil',
      rating: 4.9,
      imageUrl: 'lib/images/statuec.webp',
      description:
          'Christ the Redeemer is an iconic statue of Jesus Christ overlooking the city of Rio de Janeiro in Brazil. It stands 30 meters (98 feet) tall, excluding its 8-meter (26 feet) pedestal, and is a symbol of Christianity across the world.',
    ),
    Wonder(
      name: 'Machu Picchu',
      location: 'Peru',
      rating: 4.9,
      imageUrl: 'lib/images/machu-pichu.jpg',
      description:
          'Machu Picchu is a 15th-century Inca citadel located in the Eastern Cordillera of southern Peru on a mountain ridge. It is renowned for its sophisticated dry-stone walls that fuse huge blocks without the use of mortar, intriguing astronomical alignments, and panoramic views.',
    ),
    Wonder(
      name: 'Chichen Itza',
      location: 'Mexico',
      rating: 4.8,
      imageUrl: 'lib/images/cicen-itza.jpg',
      description:
          'Chichen Itza is a large pre-Columbian archaeological site built by the Maya civilization located in Mexico. It was a major focal point in the Northern Maya Lowlands from the Late Classic (c. AD 600–900) through the Terminal Classic (c. AD 800–900) and into the early portion of the Postclassic period (c. AD 900–1200).',
    ),
    Wonder(
      name: 'Roman Colosseum',
      location: 'Italy',
      rating: 4.7,
      imageUrl: 'lib/images/coloseum.webp',
      description:
          'The Roman Colosseum, originally known as the Flavian Amphitheatre, is an elliptical amphitheater in the center of Rome, Italy. Built of concrete and stone, it is the largest amphitheater ever built and is considered one of the greatest works of Roman architecture and engineering.',
    ),
    Wonder(
      name: 'Taj Mahal',
      location: 'India',
      rating: 4.9,
      imageUrl: 'lib/images/taj-mahal.jpeg',
      description:
          'The Taj Mahal is an ivory-white marble mausoleum on the south bank of the Yamuna River in the Indian city of Agra. It was commissioned in 1631 by the Mughal emperor Shah Jahan to house the tomb of his favorite wife, Mumtaz Mahal, and it also houses the tomb of Shah Jahan himself.',
    ),
  ];

  void _toggleSaved(Wonder wonder) {
    setState(() {
      wonder.isSaved = !wonder.isSaved;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '7 Wonders of the World',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: wonders.length,
        itemBuilder: (context, index) {
          final wonder = wonders[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailView(
                    wonder: wonder,
                    toggleSaved: () => _toggleSaved(wonder),
                  ),
                ),
              );
            },
            child: Card(
              elevation: 10,
              margin: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                        child: Image.asset(
                          wonder.imageUrl,
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          _toggleSaved(wonder);
                        },
                        icon: Icon(
                          wonder.isSaved ? Icons.bookmark : Icons.bookmark_border,
                          color: wonder.isSaved ? Colors.blue : null,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          wonder.name,
                          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.map, color: Colors.red),
                            const SizedBox(width: 4),
                            const Text('Location: ', style: TextStyle(fontSize: 20)),
                            Text(
                              wonder.location,
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.star, color: Colors.yellow),
                            const SizedBox(width: 4),
                            const Text('Rating: ', style: TextStyle(fontSize: 20)),
                            Text(
                              wonder.rating.toString(),
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
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
