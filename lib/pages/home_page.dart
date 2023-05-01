import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerceui/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  @override
  Widget build(BuildContext context) {
    final pages = List.generate(
      6,
      (index) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color.fromARGB(255, 0, 21, 255),
        ),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Text(
              "Page $index",
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            ),
          ),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Bg,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello,",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Hari Prasad",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width * 0.06,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.indigo,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              //search bar
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.07,
                decoration: BoxDecoration(
                  color: Color(0xFF292727),
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
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width,
                child: PageView.builder(
                  controller: controller,
                  itemCount: pages.length,
                  itemBuilder: (_, index) {
                    return pages[index % pages.length];
                  },
                ),
              ),
              SizedBox(
                height: 16,
              ),
              SmoothPageIndicator(
                controller: controller,
                count: pages.length,
                effect: WormEffect(
                  dotHeight: 12,
                  dotWidth: 12,
                  activeDotColor: Color(0xFFFFCB11),
                  dotColor: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Featured',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.06,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildCategoryCard(
                          'assets/image1.png', 'Sport Brand', '₹2499', 1),
                      _buildCategoryCard(
                          'assets/image2.jpg', 'Sport Brand', '₹2499', 1),
                      _buildCategoryCard(
                          'assets/image3.jpg', 'Sport Brand', '₹2499', 1),
                      SizedBox(
                        width: 16,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'ALL',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.06,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              _ProductList()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard(
      String imgPath, String brand, String price, int index) {
    return Padding(
      padding: EdgeInsets.only(left: 16),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.25,
        width: MediaQuery.of(context).size.width * 0.42,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: primaryColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.165,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Bg,
                image: DecorationImage(
                    image: AssetImage(imgPath), fit: BoxFit.fill),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8),
              child: Text(
                brand,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width * 0.03,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    price,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.white,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // A list of all products
  Widget _ProductList() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      child: Column(
        children: [
          _buildProductCard('assets/image1.png', 'Sport Brand',
              'Snopy SN-BT96 pPretty Back Bluetooth Headphone', '₹2499', 1),
          _buildProductCard('assets/image2.jpg', 'Sport Brand',
              'Snopy SN-BT96 pPretty Back Bluetooth Headphone', '₹2499', 1),
          _buildProductCard('assets/image3.jpg', 'Sport Brand',
              'Snopy SN-BT96 pPretty Back Bluetooth Headphone', '₹2499', 1),
          _buildProductCard('assets/image1.png', 'Sport Brand',
              'Snopy SN-BT96 pPretty Back Bluetooth Headphone', '₹2499', 1),
          _buildProductCard('assets/image2.jpg', 'Sport Brand',
              'Snopy SN-BT96 pPretty Back Bluetooth Headphone', '₹2499', 1),
          _buildProductCard('assets/image3.jpg', 'Sport Brand',
              'Snopy SN-BT96 pPretty Back Bluetooth Headphone', '₹2499', 1),
          _buildProductCard('assets/image1.png', 'Sport Brand',
              'Snopy SN-BT96 pPretty Back Bluetooth Headphone', '₹2499', 1),
          _buildProductCard('assets/image2.jpg', 'Sport Brand',
              'Snopy SN-BT96 pPretty Back Bluetooth Headphone', '₹2499', 1),
          _buildProductCard('assets/image3.jpg', 'Sport Brand',
              'Snopy SN-BT96 pPretty Back Bluetooth Headphone', '₹2499', 1),
        ],
      ),
    );
  }

  _buildProductCard(String s, String t, String u, String v, int i) {
    return Padding(
      padding: EdgeInsets.only(top: 16),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.15,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: primaryColor,
        ),
        child: Row(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                ),
                color: Bg,
                image: DecorationImage(image: AssetImage(s), fit: BoxFit.fill),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t,
                    style: TextStyle(
                      color: textLight1,
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: Text(
                      u,
                      style: TextStyle(
                        color: textLight2,
                        fontSize: MediaQuery.of(context).size.width * 0.032,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.52,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            v,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.05,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Icon(
                          Icons.favorite_border_outlined,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
