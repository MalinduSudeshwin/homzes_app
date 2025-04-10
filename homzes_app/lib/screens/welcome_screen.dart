import 'package:flutter/material.dart';
import 'catalog1_screen.dart';

class WelcomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> options = [
    {
      'label': 'Rent',
      'icon': Icons.chair_alt_rounded,
      'color': Color(0xFFF6E2C9),
    },
    {
      'label': 'Buy',
      'icon': Icons.apartment_rounded,
      'color': Color(0xFFF3F77C),
    },
    {'label': 'Sell', 'icon': Icons.sell_rounded, 'color': Color(0xFFD5F6DA)},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/house image 1.png'), // Your image
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Overlay
          Container(color: Colors.black.withOpacity(0.5)),

          // Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Homzes',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.menu, color: Colors.white),
                    ],
                  ),
                  SizedBox(height: 100),

                  // Main text
                  Text(
                    'Find the best\nplace for you',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30),

                  // Options
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:
                        options
                            .map(
                              (item) => Expanded(
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  padding: EdgeInsets.symmetric(vertical: 25),
                                  decoration: BoxDecoration(
                                    color: item['color'],
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(item['icon'], size: 30),
                                      SizedBox(height: 10),
                                      Text(item['label']),
                                    ],
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                  ),
                  Spacer(),

                  // Create account button
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Catalog1Screen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: StadiumBorder(),
                        padding: EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 15,
                        ),
                      ),
                      child: Text(
                        'Create an account',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
