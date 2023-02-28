import 'package:flutter/material.dart';
import 'package:fluttercourse/screen/food_description.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<String> foodImages = [
    'assets/images/Kabab.jpg',
    'assets/images/Biryani.jpg',
    'assets/images/burger.jpg',
    'assets/images/HotWings.jpg',
    'assets/images/ChickenKarahi.jpg',
  ];

  List<String> foodNames = ['Kabab', 'Biryani', 'Burger', 'Hot Wings', 'Chicken Karahi'];

  List<int> foodPrices = [499, 599, 699, 799, 899];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'All available favourite food',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Means Number of Item in a Row
                  crossAxisSpacing: 10, // For Spacing
                  mainAxisSpacing: 10, // For Spacing
                  childAspectRatio: 0.68, // For Size of the GridView Item
                ),
                itemCount: foodNames.length,
                itemBuilder: (BuildContext context, index) {
                  return InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FoodDescription(),
                      ),
                    ),
                    child: Ink(
                      height: 200,
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              foodImages[index],
                              fit: BoxFit.cover,
                              height: 150,
                              width: double.infinity,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            foodNames[index],
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 5),
                          Text('Price: ${foodPrices[index].toString()}/-'),
                          const SizedBox(height: 5),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('Add to Cart'),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
