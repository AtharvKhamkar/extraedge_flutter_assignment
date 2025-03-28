import 'package:extraedge_spacex/controllers/rocket_controller.dart';
import 'package:extraedge_spacex/models/rocket_model.dart';
import 'package:extraedge_spacex/screens/rockets_details_screen.dart';
import 'package:extraedge_spacex/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:card_swiper/card_swiper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final RocketController controller = RocketController().initialized
        ? Get.find<RocketController>()
        : Get.put(RocketController());

    return SafeArea(
      child: Scaffold(
        backgroundColor: black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Explore',
                      style: Theme.of(context).textTheme.displayLarge),
                  Text(
                    'SpaceX Rockets',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: medGrey),
                  ),
                ],
              ),
            ),

            // Body Section
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  );
                }
                if (controller.errorMessage.isNotEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          controller.errorMessage.value,
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () => controller.fetchRockets(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[800],
                          ),
                          child: const Text(
                            'Retry',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return Swiper(
                  itemCount: controller.rockets.length,
                  itemWidth: MediaQuery.of(context).size.width * 0.8,
                  itemHeight: MediaQuery.of(context).size.height * 0.6,
                  layout: SwiperLayout.STACK,
                  pagination: const SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                      activeSize: 12,
                      color: Colors.grey,
                      activeColor: Colors.white,
                    ),
                  ),
                  itemBuilder: (context, index) {
                    final rocket = controller.rockets[index];
                    return RocketCard(rocket: rocket);
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

// Rocket Card Widget
class RocketCard extends StatelessWidget {
  final RocketModel rocket;

  const RocketCard({super.key, required this.rocket});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to RocketDetailScreen(rocket: rocket);
        Get.to(() => RocketDetailScreen(rocket: rocket));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: grey,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 10,
                spreadRadius: 2)
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: rocket.id,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  rocket.flickrImages.first,
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              rocket.name,
              style: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              rocket.country,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.engineering, color: medGrey, size: 18),
                    const SizedBox(width: 5),
                    Text('Engines: ${rocket.enginesCount}',
                        style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),
                Icon(
                  Icons.rocket,
                  color: rocket.active ? Colors.green : Colors.red,
                  size: 32,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
