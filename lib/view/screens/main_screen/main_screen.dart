import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:what_can_i_cook/utils/constants.dart';
import 'package:what_can_i_cook/view/screens/main_screen/add/add_page.dart';
import 'package:what_can_i_cook/view/screens/main_screen/find/find_page.dart';
import 'package:what_can_i_cook/view/screens/main_screen/home/home_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  static const _kTabPages = <Widget>[
    HomePage(),
    AddPage(),
    FindPage(),
  ];
  static const _kTabs = <Tab>[
    Tab(
      icon: Icon(Icons.home),
    ),
    Tab(
      icon: Icon(Icons.add),
    ),
    Tab(
      icon: Icon(Icons.search),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _kTabPages.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: SizedBox(
          height: 35,
          child: Image.asset(
            "assets/images/pretty_title.png",
            color: AppColors.kPrimaryRedColor,
          ),
        ),
        elevation: 0,
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
        foregroundColor: AppColors.kPrimaryRedColor,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        centerTitle: true,
      ),
      body: TabBarView(
        controller: _tabController,
        children: _kTabPages,
      ),
      bottomNavigationBar: SafeArea(
        child: TabBar(
          unselectedLabelColor: Colors.grey,
          labelColor: AppColors.kPrimaryRedColor,
          indicatorColor: AppColors.kPrimaryRedColor,
          tabs: _kTabs,
          controller: _tabController,
        ),
      ),
    );
  }
}
