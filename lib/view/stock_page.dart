import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:standard_searchbar/old/standard_searchbar.dart';

class StockPage extends StatefulWidget {
  const StockPage({super.key});

  @override
  State<StockPage> createState() => _StockPageState();
}

class _StockPageState extends State<StockPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xfff3f4ff),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 48.0, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Stock Management",
                style: TextStyle(fontSize: 30, color: Color(0xff101828)),
              ),
              Text(
                "Manage your inventory",
                style: TextStyle(color: Color(0x60101828), fontSize: 16),
              ),
              height(24),
              Row(
                spacing: 12,
                children: [
                  Expanded(child: StandardSearchBar(borderRadius: 8)),
                  IconButton(
                    onPressed: () {},
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    icon: Icon(FontAwesomeIcons.filter, size: 20),
                  ),
                ],
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _tabController.animateTo(0);
                    },
                    child: Text("All (6)"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _tabController.animateTo(1);
                    },
                    child: Text("All (6)"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _tabController.animateTo(2);
                    },
                    child: Text("All (6)"),
                  ),
                ],
              ),
              height(16),
              SizedBox(
                height: screenHeight * 0.7, // misal 70% tinggi layar
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _tabContent("Tab 1 Content"),
                    _tabContent("Tab 2 Content"),
                    _tabContent("Tab 3 Content"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tabContent(String text) {
    // Scroll masing-masing tab
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) =>
          Card(child: ListTile(title: Text("$text - Item ${index + 1}"))),
    );
  }

  SizedBox height(double height) => SizedBox(height: height);
  SizedBox width(double width) => SizedBox(width: width);
}
