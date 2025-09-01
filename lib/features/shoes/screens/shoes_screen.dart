import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class ShoesScreen extends StatefulWidget {
  final String image;
  final String tag;

  const ShoesScreen({super.key, required this.image, required this.tag});

  @override
  State<ShoesScreen> createState() => _ShoesScreenState();
}

class _ShoesScreenState extends State<ShoesScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Hero(
          tag: widget.tag,
          child: Container(
            height: size.height,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.image),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400,
                  blurRadius: 10,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Stack(
              children: [
                _buildTopBar(context),
                _buildBottomDetails(context, size),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Top AppBar Section
  Widget _buildTopBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios, color: Colors.white),
          ),
          Container(
            width: 35,
            height: 35,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: const Center(child: Icon(Icons.favorite_border, size: 20)),
          ),
        ],
      ),
    );
  }

  /// Bottom Section with Shoe Details
  Widget _buildBottomDetails(BuildContext context, Size size) {
    return Positioned(
      bottom: 0,
      left: 0,
      width: size.width,
      height: 500,
      child: FadeInUp(
        duration: const Duration(milliseconds: 1000),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              colors: [
                Colors.black.withOpacity(.9),
                Colors.black.withOpacity(.0),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FadeInUp(
                duration: const Duration(milliseconds: 1300),
                child: const Text(
                  "Sneakers",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              FadeInUp(
                duration: const Duration(milliseconds: 1400),
                child: const Text(
                  "Size",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              const SizedBox(height: 10),
              _buildSizes(),
              const SizedBox(height: 60),
              _buildBuyButton(),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  /// Shoe Sizes Row
  Widget _buildSizes() {
    final sizes = ['40', '42', '44', '46'];

    return Row(
      children: List.generate(sizes.length, (index) {
        final isSelected = sizes[index] == '42'; // Example selected size
        return FadeInUp(
          duration: Duration(milliseconds: 1450 + index * 10),
          child: Container(
            width: 40,
            height: 40,
            margin: const EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              color: isSelected ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.white),
            ),
            child: Center(
              child: Text(
                sizes[index],
                style: TextStyle(
                  color: isSelected ? Colors.black : Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  /// Buy Now Button
  Widget _buildBuyButton() {
    return FadeInUp(
      duration: const Duration(milliseconds: 1500),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Center(
          child: Text('Buy Now', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
