import 'package:flutter/material.dart';
import 'catalog3_screen.dart';

class Catalog1Screen extends StatelessWidget {
  List<Map<dynamic, dynamic>> featured = [];
  List<Map<dynamic, dynamic>> newOffers = [];

  void _navigateToCatalog3(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 500),
        pageBuilder: (_, __, ___) => Catalog3Screen(),
        transitionsBuilder: (_, animation, __, child) {
          return SlideTransition(
            position: Tween(begin: Offset(1, 0), end: Offset.zero).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeInOut),
            ),
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F8DC),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9F8DC),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed:
              () => _navigateToCatalog3(context), // Your navigation function
        ),
        title: const Text(
          'Hi, Stanislav',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          const CircleAvatar(child: Text("S")),
          const SizedBox(width: 10),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Search
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search',
                icon: Icon(Icons.search),
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Featured
          sectionTitle("Featured"),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: featured.length,
              itemBuilder: (context, index) => propertyCard(featured[index]),
            ),
          ),
          const SizedBox(height: 20),
          // New Offers
          sectionTitle("New offers"),
          ...newOffers.map((offer) => newOfferCard(offer)).toList(),
        ],
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const Text("View all"),
      ],
    );
  }

  Widget propertyCard(Map data) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              data['image'],
              height: 120,
              width: 160,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(data['title'], maxLines: 1, overflow: TextOverflow.ellipsis),
          Text(
            "\$${data['price']}",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget newOfferCard(Map data) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Image.network(
            data['image'],
            height: 180,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data['title'],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${data['price']}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.green, size: 16),
                        Text("${data['rating']} (${data['reviews']} Reviews)"),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
