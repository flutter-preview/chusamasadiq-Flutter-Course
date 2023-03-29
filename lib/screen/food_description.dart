import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../components/button.dart';

class FoodDescription extends StatelessWidget {
  late String foodName;
  late int foodPrice;
  late String foodImage;
  late String foodRatings;
  late String foodDescription;
  late int deliveryTime;
  late int deliveryCharges;

  FoodDescription({
    super.key,
    required this.foodName,
    required this.foodImage,
    required this.foodPrice,
    required this.deliveryTime,
    required this.foodRatings,
    required this.deliveryCharges,
    required this.foodDescription
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(foodName),
      ),
      body: ListView(
        children: [
          Container(
            height: screenHeight / 4,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(foodImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(screenWidth / 20),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      foodName,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Rs: $foodPrice',
                      style: const TextStyle(fontSize: 18),
                    )
                  ],
                ),
                SizedBox(height: screenHeight / 75),
                Row(
                  children: [
                    RatingBar(
                      ignoreGestures: true,
                      minRating: 1,
                      maxRating: 5,
                      itemSize: 20,
                      glow: false,
                      allowHalfRating: true,
                      initialRating: double.parse(foodRatings),
                      onRatingUpdate: (double value) {},
                      ratingWidget: RatingWidget(
                        full: const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        half: const Icon(
                          Icons.star_half,
                          color: Colors.amber,
                        ),
                        empty: const Icon(
                          Icons.star_outline,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight / 75),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Delivery Time: ${deliveryTime}min',
                    ),
                    Text(
                      'Delivery Charges: $deliveryCharges',
                    )
                  ],
                ),
                SizedBox(height: screenHeight / 50),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        foodDescription,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight / 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ButtonWidget(
                      height: 0.05,
                      width: 0.4,
                      onPress: () {  },
                      color: Colors.orange,
                      child: const FittedBox(
                        child: Text(
                          'Add to Cart ',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: screenWidth / 50),
                    ButtonWidget(
                      height: 0.05,
                      width: 0.4,
                      onPress: () {}, color: Colors.amber,

                      child: const FittedBox(
                        child: Text(
                          'Order Now',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
