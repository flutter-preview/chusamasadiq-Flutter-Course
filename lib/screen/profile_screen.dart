import 'package:flutter/material.dart';

import '../components/button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    double coverHeight = MediaQuery.of(context).size.height / 4;
    double profileHeight = MediaQuery.of(context).size.height / 6;
    double top = coverHeight - profileHeight / 2;
    double bottom = profileHeight / 1.6;

    // Cover Image
    Widget buildCoverImage() => Image.asset(
          'assets/images/28.jpg',
          width: double.infinity,
          height: coverHeight,
          fit: BoxFit.cover,
        );

    // Profile Image
    Widget buildProfileImage() => CircleAvatar(
          radius: profileHeight / 2,
          backgroundImage: const AssetImage('assets/images/avatar.png'),
          backgroundColor: Colors.white,
        );

    // Top Image
    Widget buildTop() => Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: bottom),
              child: buildCoverImage(),
            ),
            Positioned(
              top: top,
              child: buildProfileImage(),
            ),
          ],
        );

    // Content of Profile

    return Scaffold(
      appBar: AppBar(
        title: const Text('Fabien'),
      ),
      body: ListView(
        children: [
          buildTop(),
          const ListTile(
            leading: Icon(Icons.person),
            title: Text('Fabien'),
          ),
          const ListTile(
            leading: Icon(Icons.email),
            title: Text('abc@gmail.com'),
          ),
          const ListTile(
            leading: Icon(Icons.location_city_outlined),
            title: Text('France'),
          ),
        ],
      ),
    );
  }
}
