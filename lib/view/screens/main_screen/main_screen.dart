import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:what_can_i_cook/components/constants.dart';
import 'package:what_can_i_cook/view/screens/main_screen/add/add_page.dart';
import 'package:what_can_i_cook/view/screens/main_screen/find/find_page.dart';
import 'package:what_can_i_cook/view/screens/main_screen/home/home_page.dart';
import 'package:what_can_i_cook/view/widgets/custom_navigation_drawer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  static const _kTabPages = <Widget>[
    Center(
      child: HomePage(),
    ),
    Center(child: AddPage()),
    Center(child: FindPage()),
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

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));

    _animation1 = Tween<double>(begin: 0, end: 20).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
      reverseCurve: Curves.easeIn,
    ))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.dismissed) {
          _bool = true;
        }
      });
    _animation2 = Tween<double>(begin: .9, end: 1).animate(CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastLinearToSlowEaseIn,
        reverseCurve: Curves.ease))
      ..addListener(() {
        setState(() {});
      });
    _tabController = TabController(
      length: _kTabPages.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  late AnimationController _animationController;
  late Animation<double> _animation1;
  late Animation<double> _animation2;

  bool _bool = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        
        title: Image.asset(
          "assets/images/pretty_title.png",
          color: kPrimaryRedColor,
          scale: 0.2.h,
        ),
        
        elevation: 0,
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
        foregroundColor: kPrimaryRedColor,
        leading: IconButton(
          icon: const Icon(Icons.menu_rounded),
          splashColor: Colors.transparent,
          onPressed: () {
            if (_bool == true) {
              _animationController.forward();
            } else {
              _animationController.reverse();
            }
            _bool = false;
          },
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamedAndRemoveUntil(
                    context, '/favorite', (route) => false);
              },
              icon: const Icon(Icons.favorite))
        ],
      ),
      body: Stack(
        children: [
          TabBarView(
            controller: _tabController,
            children: _kTabPages,
          ),
          // ALWAYS PLACE IT ON THE BOTTOM OF EVERY WIDGET...
          customNavigationDrawer(context, _animation1, _animation2, _bool)
        ],
      ),
      bottomNavigationBar: Material(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: TabBar(
          unselectedLabelColor: Colors.grey,
          labelColor: kPrimaryRedColor,
          //indicatorColor: Colors.transparent,
          indicatorColor: kPrimaryRedColor,
          tabs: _kTabs,
          controller: _tabController,
        ),
      ),
    );
  }
}
