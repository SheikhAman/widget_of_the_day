import 'package:flutter/material.dart';
import 'package:widget_of_the_day/features/widgets_of_the_day/day_53_hero_animation/place_details_screen.dart';
import 'package:widget_of_the_day/features/widgets_of_the_day/day_53_hero_animation/place_model.dart';

class Day53HeroAnimationWidget extends StatelessWidget {
  const Day53HeroAnimationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final places = [
      Place(
        name: 'Paris',
        imageUrl:
        'https://images.unsplash.com/photo-1502602898657-3e91760cbb34?w=1000',
      ),
      Place(
        name: 'Tokyo',
        imageUrl:
        'https://images.unsplash.com/photo-1540959733332-eab4deabeeaf?w=1000',
      ),
      Place(
        name: 'Dubai',
        imageUrl:
        'https://images.unsplash.com/photo-1512453979798-5ea266f8880c?w=1000',
      ),
      Place(
        name: 'Singapore',
        imageUrl:
        'https://images.unsplash.com/photo-1525625293386-3f8f99389edd?w=1000',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 53 - Hero Animation'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: places.length,
        itemBuilder: (context, index) {
          final place = places[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PlaceDetailsScreen(place: place),
                  ),
                );
              },
              child: Row(
                children: [
                  Hero(
                    tag: place.name,
                    child: Image.network(
                      place.imageUrl,
                      width: 120,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      place.name,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: Icon(Icons.arrow_forward_ios),
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


