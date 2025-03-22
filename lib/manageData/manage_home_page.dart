import 'package:design_app/manageData/drawer_menu.dart';
import 'package:design_app/pages/pages_drawer/manage_menu_page.dart';
import 'package:design_app/pages/bottonBar_page/home_page.dart';
import 'package:design_app/pages/login_page/login_page.dart';
import 'package:design_app/pages/bottonBar_page/message_page.dart';
import 'package:design_app/pages/bottonBar_page/position_page.dart';
import 'package:design_app/pages/bottonBar_page/service_page.dart';
import 'package:flutter/material.dart';

// items in icon leading
List<String> itm = ["ເຊື່ອມຕໍ່ຖານຂໍ້ມູນ", "ເຊື່ອມຕໍ່ອີນເຕີເນັດ", "ຕັ້ງຄ່າ"];
List icon = [
  Icon(
    Icons.storage,
    color: Colors.amber.shade900,
    size: 30,
  ),
  Icon(
    Icons.wifi,
    color: Colors.amber.shade900,
    size: 30,
  ),
  Icon(
    Icons.settings,
    color: Colors.amber.shade900,
    size: 30,
  ),
];

// menu items app bar
List<String> itMenu = [
  "ຈັດການຂໍ້ມູນພື້ນຖານ",
  "ຂາຍສິນຄ້າ",
  "ສັ່ງຊື້ສິນຄ້າ",
  "ນຳເຂົ້າສິນຄ້າ",
  "ຄົ້ນຫາ",
  "ລາຍງານ"
];
List iconMenu = [
  Icon(
    Icons.folder,
    color: Colors.amber.shade900,
    size: 30,
  ),
  Icon(
    Icons.shopping_bag,
    color: Colors.amber.shade900,
    size: 30,
  ),
  Icon(
    Icons.add_shopping_cart,
    color: Colors.amber.shade900,
    size: 30,
  ),
  Icon(
    Icons.local_shipping,
    color: Colors.amber.shade900,
    size: 30,
  ),
  Icon(
    Icons.search,
    color: Colors.amber.shade900,
    size: 30,
  ),
  Icon(
    Icons.bar_chart,
    color: Colors.amber.shade900,
    size: 30,
  ),
];

// Navigator botton page when we click
List itmPage = [
  HomePage(),
  PositionPage(),
  MessagePage(),
  ServicePage(),
];

class ManageHomePage extends StatefulWidget {
  const ManageHomePage({super.key});

  @override
  State<ManageHomePage> createState() => _ManageHomePageState();
}

class _ManageHomePageState extends State<ManageHomePage> {
  int idx = 0;

  void ontabPPed(int indx) {
    setState(() {
      idx = indx;
    });
  }

  // show message on leading icon
  void showMessage() {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text("ທົດສອບການສະແດງຄ່າ"),
            content: Text("Hello"),
            actions: [
              TextField(
                decoration: InputDecoration(
                    labelText: 'ອີເມວ', border: OutlineInputBorder()),
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: 'ລະຫັດ', border: OutlineInputBorder()),
              ),
              ElevatedButton(onPressed: () {}, child: Text('ຕົກລົງ'))
            ],
          );
        });
  }

  //  Widget tab bar
  Widget TabBarItem() {
    return TabBar(
        isScrollable: true, // ໃສ່ໄຫ້ມັນເລື່ອນໄດ້
        tabs: [
          Tab(
            icon: iconMenu[0],
            text: itMenu[0],
          ),
          Tab(
            icon: iconMenu[1],
            text: itMenu[1],
          ),
          Tab(
            icon: iconMenu[2],
            text: itMenu[2],
          ),
          Tab(
            icon: iconMenu[3],
            text: itMenu[3],
          ),
          Tab(
            icon: iconMenu[4],
            text: itMenu[4],
          ),
          Tab(
            icon: iconMenu[5],
            text: itMenu[5],
          ),
          // Tab(
          //   icon: iconMenu[3],
          //   text: itMenu[3],
          // ),
          // Tab(
          //   icon: iconMenu[4],
          //   text: itMenu[4],
          // ),
          // Tab(
          //   icon: iconMenu[5],
          //   text: itMenu[5],
          // ),
        ]);
  }

  // menu in icon leading
  Widget MenuPopup() {
    return PopupMenuButton<String>(
      itemBuilder: (c) => [
        // ໃສ່ list title
        PopupMenuItem(
          child: Card(
            elevation: 10,
            shadowColor: Colors.amberAccent,
            child: ListTile(
              leading: icon[0],
              // comment
              subtitle:
                  Text("hjdgffgyjrgfyggfuyregfyugreyufgyeugyuyugyugygeyg"),
              title: Text(
                '${itm[0]}',
                style: TextStyle(
                  color: Colors.blue.shade900,
                  fontSize: 22,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
        PopupMenuDivider(),
        PopupMenuItem(
          child: Card(
            elevation: 10,
            shadowColor: Colors.amberAccent,
            // shape: Border.all(color: Colors.blue, ),
            child: ListTile(
              leading: icon[1],
              title: Text(
                '${itm[1]}',
                style: TextStyle(
                  color: Colors.blue.shade900,
                  fontSize: 22,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
                showMessage();
              },
            ),
          ),
        ),
        PopupMenuDivider(),
        PopupMenuItem(
          child: Card(
            elevation: 10,
            shadowColor: Colors.amberAccent,
            child: ListTile(
              leading: icon[2],
              title: Text(
                '${itm[2]}',
                style: TextStyle(
                  color: Colors.blue.shade900,
                  fontSize: 22,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
      ],
    );
  }

  // botton Navigator bar
  Widget BottomBar() {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.green,
        selectedIconTheme: IconThemeData(color: Colors.white, size: 32),
        selectedFontSize: 16,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        currentIndex: idx,
        onTap: ontabPPed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.amber),
          BottomNavigationBarItem(icon: Icon(Icons.place), label: 'Position'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Message'),
          BottomNavigationBarItem(
              icon: Icon(Icons.more_vert), label: 'Services'),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: Text('ແອບຂາຍເຄື່ອງ'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
              iconSize: 30,
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              icon: Icon(Icons.person),
              iconSize: 30,
            ),
            // icon 3 khit
            MenuPopup(),
          ],
          // ເມນູຈັດການຂໍ້ມູນພື້ນຖານ
          // bottom: PreferredSize(
          //   preferredSize: Size.fromHeight(60),
          //   child: TabBarItem(),
          // ),
        ),
        body: itmPage == null ? CircularProgressIndicator() : itmPage[idx],
        // body: itmPage == null
        //     ? CircularProgressIndicator()
        //     : TabBarView(
        //         children: [
        //           Center(
        //             child: ManageMenuPage(),
        //           ),
        //           Center(
        //             child: Text('Sale'),
        //           ),
        //           Center(
        //             child: Text('Order'),
        //           ),
        //           Center(
        //             child: Text('Import'),
        //           ),
        //           Center(
        //             child: Text('Search'),
        //           ),
        //           Center(
        //             child: Text('Report'),
        //           ),
        //         ],
        //       ),
        drawer: DrawerMenu(),
        bottomNavigationBar: BottomBar(),
      ),
    );
  }
}
