import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:what_can_i_cook/components/constants.dart';
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
      /*
    _animation2 = Tween<double>(begin: 0, end: .3).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
      */
    _animation3 = Tween<double>(begin: .9, end: 1).animate(CurvedAnimation(
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
  //late Animation<double> _animation2;
  late Animation<double> _animation3;

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
          customNavigationDrawer(),
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

  Widget customNavigationDrawer() {
    return BackdropFilter(
      filter: ImageFilter.blur(
          sigmaY: _animation1.value, sigmaX: _animation1.value),
      child: Container(
        height: _bool ? 0 : MediaQuery.of(context).orientation == Orientation.landscape ? 100.w : 100.h,
        width: _bool ? 0 : MediaQuery.of(context).orientation == Orientation.landscape ? 100.h : 100.w,
        color: const Color.fromARGB(0, 255, 255, 255),
        child: Center(
          child: Transform.scale(
            scale: _animation3.value,
            child: SafeArea(
              child: Container(
                width: MediaQuery.of(context).orientation == Orientation.landscape ? 50.h : 90.w,
                height: MediaQuery.of(context).orientation == Orientation.landscape ? 50.w : 30.h,
                decoration: BoxDecoration(
                  //color: kPrimaryColor.withOpacity(_animation2.value),
                  color: kPrimaryRedColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, "/auth");
                      },
                      child: const CircleAvatar(
                        backgroundColor: Colors.black12,
                        radius: 35,
                        child: Icon(
                          Icons.person_outline_rounded,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        myTile(Icons.settings_outlined, 'Настройки', () {
                          HapticFeedback.lightImpact();
                          Navigator.pushReplacementNamed(context, "/settings");
                        }),
                        myTile(Icons.info_outline_rounded, 'О нас', () {
                          HapticFeedback.lightImpact();
                        }),
                      ],
                    ),
                    const SizedBox(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget myTile(
    IconData icon,
    String title,
    VoidCallback voidCallback,
  ) {
    return Column(
      children: [
        ListTile(
          tileColor: Colors.black.withOpacity(.08),
          leading: CircleAvatar(
            backgroundColor: Colors.black12,
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          onTap: voidCallback,
          title: Text(
            title,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 1),
          ),
          trailing: const Icon(
            Icons.arrow_right,
            color: Colors.white,
          ),
        ),
        divider()
      ],
    );
  }

  Widget divider() {
    return SizedBox(
      height: 5,
      width: MediaQuery.of(context).size.width,
    );
  }
}
