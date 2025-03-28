import 'package:extraedge_spacex/models/rocket_model.dart';
import 'package:flutter/material.dart';

class RocketDetailScreen extends StatelessWidget {
  final RocketModel rocket;

  const RocketDetailScreen({super.key, required this.rocket});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with Rocket Name
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Expanded(
                      child: Text(
                        rocket.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(width: 48), // Placeholder for symmetry
                  ],
                ),
              ),
              // Description Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'DESCRIPTION',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Maiden launch',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                            // Text(
                            //   rocket.firstFlight,
                            //   style: const TextStyle(
                            //       color: Colors.white, fontSize: 16),
                            // ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Launch cost',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                            Text(
                              '\$${rocket.costPerLaunch / 1000000} mln',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Success rate',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                            Text(
                              rocket.successRate != null
                                  ? '${rocket.successRate}%'
                                  : 'No data',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Active',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                            Row(
                              children: [
                                Text(
                                  rocket.active ? 'Yes' : 'No',
                                  style: TextStyle(
                                    color: rocket.active
                                        ? Colors.green
                                        : Colors.red,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Icon(
                                  rocket.active ? Icons.check : Icons.close,
                                  color:
                                      rocket.active ? Colors.green : Colors.red,
                                  size: 16,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      rocket.description,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
