import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttercourse/provider/cart_provider.dart';
import 'package:fluttercourse/resources/db_helper.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  DBHelper dbHelper = DBHelper();
  List<dynamic> foodLists = [];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final cart = Provider.of<CartProvider>(context);
    final auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Badge(
                backgroundColor: Colors.orange,
                label: Consumer<CartProvider>(builder: (context, value, child) {
                  return Text(
                    value.getCounter().toString(),
                    style: const TextStyle(fontSize: 12, color: Colors.white),
                  );
                }),
                child: const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Icon(Icons.shopping_cart),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: cart.getData(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                foodLists = snapshot.data;
                if (snapshot.data.isEmpty) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Image(
                          height: screenHeight * 0.7,
                          image: const AssetImage('assets/images/empty_cart.png'),
                        ),
                      )
                    ],
                  );
                }
                else{
                  return Text('USama');
                }
              }
              return const CircularProgressIndicator();
            },
          ),
        ],
      ),
    );
  }
}
