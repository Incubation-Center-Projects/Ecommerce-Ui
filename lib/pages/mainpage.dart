import 'package:ecommerceui/constants/colors.dart';
import 'package:flutter/material.dart';

import '../decoration.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Bg,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.77,
                        height: MediaQuery.of(context).size.height * 0.07,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 41, 39, 39),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.search),
                              color: Colors.white,
                            ),
                            Text(
                              'Search',
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(
                              width: 100,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.mic),
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.15,
                          height: MediaQuery.of(context).size.height * 0.07,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 41, 39, 39),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Icon(
                            Icons.favorite_border_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Text(
                      'Categories',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildCategoryCard('assets/image1.png', 'Electronic'),
                        _buildCategoryCard(
                            'assets/image2.jpg', 'Digital Service'),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildCategoryCard('assets/image3.jpg', 'Music'),
                        _buildCategoryCard('assets/image1.png', 'Clothes'),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildCategoryCard('assets/image2.jpg', 'Music'),
                        _buildCategoryCard('assets/image3.jpg', 'Clothes'),
                      ],
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

  Widget _buildCategoryCard(String imgPath, String type) {
    return Padding(
      padding: EdgeInsets.only(left: 8),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.27,
        width: MediaQuery.of(context).size.width * 0.45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: primaryColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Bg,
                image: DecorationImage(
                    image: AssetImage(imgPath), fit: BoxFit.fill),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 12),
              child: Text(
                type,
                style: TextStyle(
                  color: textLight1,
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
