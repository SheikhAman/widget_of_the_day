import 'package:flutter/material.dart';

class Day35RotatedBoxWidget extends StatelessWidget {
  const Day35RotatedBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      appBar: AppBar(
        title: const Text('Day 35 - RotatedBox'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                'https://images.unsplash.com/photo-1529107386315-e1a2ed48a620?auto=format&fit=crop&w=1200&q=80',
                fit: BoxFit.cover,
              )
            ),
          ),

          const SizedBox(height: 10),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RotatedBox(
                quarterTurns: 3,
                child: Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Challenges of Democracy',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: const Text(
                    'Fifty years ago, the dominant concern of citizens and observers alike was about the economic future of newly independent Bangladesh. Five decades later, a poverty-stricken, disaster-prone vulnerable economy has confounded observers at home and abroad alike by scripting a remarkable story of economic transformation and resilience. The achievements came neither overnight nor by the efforts of any single quarter. But the change has been real, and the country today has legitimately embraced a higher-level aspiration of middle-income status within the coming decade.\n\n'
                        'Progress in economic development, however, has not been mirrored in progress in political development. After independence, politics seemed the lesser challenge. In a twist of irony, today it is deficits in political development that are gnawing at the foundational dream of an inclusive, humane society.\n\n'
                        'Such political decay is fuelling unaccountable power, rampant cronyism and systemic corruption.',
                    style: TextStyle(fontSize: 15, height: 1.5),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}