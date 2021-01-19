import 'package:flutter/material.dart';
import 'package:interior_design/exploreTab.dart';
import 'package:interior_design/marketplaceTab.dart';
import 'package:interior_design/profileTab.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  int _pageIndex = 0;
  PageController _pageController;

  List<Widget> tabPages = [
    ExploreTab(),
    MarketPlaceTab(),
    ProfileTab(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff333333),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff333333),
        type: BottomNavigationBarType.fixed,
        elevation: 0.0,
        currentIndex: _pageIndex,
        onTap: onTabTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.explore_outlined, color: Colors.white,), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart, color: Colors.white,), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_outlined, color: Colors.white,), label: ""),
        ],
      ),
      body: PageView(
      children: tabPages,
      onPageChanged: onPageChanged,
      controller: _pageController,
    ),

      // SingleChildScrollView(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     crossAxisAlignment: CrossAxisAlignment.stretch,
      //     children: [
      //
      //       Container(
      //         height: MediaQuery.of(context).size.height / 1.5,
      //         color: Colors.black87,
      //         child: Column(
      //           children: [
      //             SizedBox(
      //               height: 50.0,
      //             ),
      //             InkWell(
      //               onTap: () {
      //                 Navigator.push(context, MaterialPageRoute(builder: (context) => ExploreTab()));
      //               },
      //                 child: Text("Explore", style: TextStyle(fontSize: 16.0, color: Colors.white),)),
      //             SizedBox(
      //               height: 30.0,
      //             ),
      //             Text("Market", style: TextStyle(fontSize: 16.0, color: Colors.white),),
      //             SizedBox(
      //               height: 30.0,
      //             ),
      //             Text("Profile", style: TextStyle(fontSize: 16.0, color: Colors.white),),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }

  void onPageChanged(int page) {
    setState(() {
      this._pageIndex = page;
    });
  }

  void onTabTapped(int index) {
    this._pageController.animateToPage(index,duration: const Duration(milliseconds: 500),curve: Curves.easeInOut);
  }

}
