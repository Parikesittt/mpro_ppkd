import 'package:belajar_ppkd/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Tugas5 extends StatefulWidget {
  const Tugas5({super.key});

  @override
  State<Tugas5> createState() => _Tugas5State();
}

class _Tugas5State extends State<Tugas5> {
  bool isShow = false;
  bool isFav = false;
  bool isBookmark = false;
  bool showMore = false;
  int counter = 0;
  bool showText = false;
  int angka = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Interaksi"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toogleTheme();
            },
            icon: Icon(Icons.lightbulb),
          ),
        ],
        actionsPadding: EdgeInsets.only(right: 10),
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      isShow = !isShow;
                      setState(() {});
                    },
                    child: Text(
                      "Tampilkan Nama",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  if (isShow) ...[
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 12),
                      child: Row(
                        spacing: 12,
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(
                              'assets/images/kuda.png',
                            ),
                          ),
                          Column(
                            children: [
                              Row(
                                spacing: 4,
                                children: [
                                  Text("Parikesit"),
                                  Icon(Icons.verified, size: 14),
                                ],
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                        ],
                      ),
                      // child: SizedBox(height: 40, child: Text("Parikesit")),
                    ),
                  ] else ...[
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 12),
                      child: SizedBox(height: 40),
                    ),
                  ],
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  height: 160,
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.grey.shade300),
                  child: Image(image: AssetImage('assets/images/sapi.png')),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0, left: 16),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {
                              isFav = !isFav;
                              setState(() {});
                            },
                            icon: Icon(
                              Icons.favorite,
                              color: isFav ? Colors.red : Colors.grey,
                            ),
                          ),
                          if (isFav) ...[
                            SizedBox(
                              // padding: EdgeInsets.only(left: 8),
                              height: 20,
                              child: Text("Disukai"),
                            ),
                          ] else ...[
                            SizedBox(height: 20),
                          ],
                        ],
                      ),
                      SizedBox(width: 8),
                      Column(
                        children: [
                          Icon(
                            Icons.share,
                            size: 20,
                            color: Colors.grey.shade600,
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Column(
                          children: [
                            IconButton(
                              onPressed: () {
                                isBookmark = !isBookmark;
                                setState(() {});
                              },
                              icon: Icon(Icons.bookmark),
                              color: isBookmark ? Colors.amber : Colors.grey,
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  margin: EdgeInsets.only(top: 4),
                  // height: 80,
                  width: double.infinity,
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque nec turpis in ipsum aliquet mollis a at ipsum. Phasellus sed nunc at tortor feugiat auctor eget ut turpis. Donec varius erat nec nunc vehicula, ut sodales diam consectetur. In vel nisl neque. Nam sed porta neque. Donec sodales justo et pulvinar convallis. Nulla a tellus rutrum, ultricies eros quis, efficitur sapien.",
                    maxLines: showMore ? 9 : 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  children: [
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        showMore = !showMore;
                        setState(() {});
                      },
                      child: Text(
                        showMore ? "Lihat lebih sedikit" : "Lihat selengkapnya",
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 42),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(16),
              ),
              margin: EdgeInsets.symmetric(horizontal: 64),
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "$counter",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 12,
                    children: [
                      FloatingActionButton(
                        onPressed: () {
                          counter++;
                          setState(() {});
                        },
                        child: Icon(Icons.add, color: Colors.black),
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          counter--;
                          setState(() {});
                        },
                        child: Icon(Icons.remove, color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 300,
              width: double.infinity,
              margin: EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.grey.shade700,
                borderRadius: BorderRadius.circular(24),
              ),
              child: InkWell(
                onTap: () {
                  print("Kotak disentuh");
                  showText = !showText;
                  setState(() {});
                },
                child: Center(
                  child: Text(
                    showText ? "Cihuyyyy" : "",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.yellow,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 120,
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(16),
              ),
              child: GestureDetector(
                onTap: () {
                  print("Ditekan sekali");
                  angka++;
                  setState(() {});
                },
                onDoubleTap: () {
                  print("Ditekan dua kali");
                  angka += 2;
                  setState(() {});
                },
                onLongPress: () {
                  print("Tahan lama");
                  angka += 3;
                  setState(() {});
                },
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Tekan Aku", style: TextStyle(fontSize: 16)),
                      Text("$angka", style: TextStyle(fontSize: 20)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
