import 'package:flutter/material.dart';

class BottomTabbarExample extends StatefulWidget {
  const BottomTabbarExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BottomTabbarExampleState();
}

class _BottomTabbarExampleState extends State<BottomTabbarExample>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  static const _kTabPages = <Widget>[
    Center(child: Icon(Icons.cloud, size: 64.0, color: Colors.teal)),
    Center(child: Icon(Icons.alarm, size: 64.0, color: Colors.cyan)),
    Center(child: Icon(Icons.forum, size: 64.0, color: Colors.blue)),
  ];
  static const _kTabs = <Tab>[
    Tab(
      icon: Icon(Icons.home),
            text: 'Home',
      
      ),
    Tab(
      icon: Icon(Icons.add),
            text: 'Add',
      
      ),
    Tab(
      icon: Icon(Icons.search),
            text: 'Search',
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
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(250, 255, 255, 255),
        foregroundColor: const Color.fromARGB(251, 241, 1, 73),
        title: const Text('Настройки'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: (){
                    Navigator.pop(context);
                    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                  },
              icon: const Icon(Icons.close))
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: _kTabPages,
      ),
      bottomNavigationBar: Material(
        
        color: const Color.fromARGB(248, 255, 255, 255),
        child: TabBar(
          unselectedLabelColor: Colors.grey,
          labelColor: const Color.fromARGB(249, 255, 54, 54),
          indicatorColor:const Color.fromARGB(249, 255, 54, 54),
          tabs: _kTabs,
          controller: _tabController,
        ),
      ),
    );
  }
}