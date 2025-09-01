import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../../shoes/screens/shoes_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Shoes",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none, color: Colors.black),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart, color: Colors.black),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildCategoryList(),
            const SizedBox(height: 20),
            FadeInUp(
              duration: const Duration(milliseconds: 1500),
              child: _buildShoeItem(
                context,
                image: 'assets/images/one.jpg',
                tag: 'red',
              ),
            ),
            FadeInUp(
              duration: const Duration(milliseconds: 1600),
              child: _buildShoeItem(
                context,
                image: 'assets/images/two.jpg',
                tag: 'blue',
              ),
            ),
            FadeInUp(
              duration: const Duration(milliseconds: 1700),
              child: _buildShoeItem(
                context,
                image: 'assets/images/three.jpg',
                tag: 'white',
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Horizontal category list
  Widget _buildCategoryList() {
    final categories = ["All", "Sneakers", "Football", "Soccer", "Golf"];
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return AspectRatio(
            aspectRatio: 2.2 / 1,
            child: FadeInUp(
              duration: Duration(milliseconds: 1000 + (index * 100)),
              child: Container(
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: index == 0 ? Colors.grey[200] : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    categories[index],
                    style: const TextStyle(fontSize: 17),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  /// Shoe item card
  Widget _buildShoeItem(
    BuildContext context, {
    required String image,
    required String tag,
  }) {
    return Hero(
      tag: tag,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ShoesScreen(image: image, tag: tag),
            ),
          );
        },
        child: Container(
          height: 250,
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400,
                blurRadius: 10,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FadeInUp(
                          duration: const Duration(milliseconds: 1000),
                          child: const Text(
                            "Sneakers",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        FadeInUp(
                          duration: const Duration(milliseconds: 1100),
                          child: const Text(
                            "Nike",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                  FadeInUp(
                    duration: Duration(milliseconds: 1200),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.favorite_border, size: 20),
                    ),
                  ),
                ],
              ),
              FadeInUp(
                duration: Duration(milliseconds: 1200),
                child: Text(
                  "100\$",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
