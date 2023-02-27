import 'package:flutter/material.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({Key? key}) : super(key: key);

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  List<String> foodImages = [
    'assets/images/Kabab.jpg',
    'assets/images/Biryani.jpg',
    'assets/images/burger.jpg',
    'assets/images/HotWings.jpg',
  ];

  List<String> foodNames = ['Kabab', 'Biryani', 'Burger', 'Hot Wings'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Delivery App'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Hi, Fabien',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/avatar.png'),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Container(
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                    label: Text('Tap to Search'),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: foodImages.length,
                  itemBuilder: (BuildContext context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 180,
                            child: AspectRatio(
                              aspectRatio: 4 / 3,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  foodImages[index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          foodNames[index],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Menu'),
                  Text(
                    'View all',
                    style: TextStyle(color: Colors.orange),
                  )
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: foodImages.length,
                  itemBuilder: (BuildContext context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Container(
                            height: 220,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(foodImages[index]),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
