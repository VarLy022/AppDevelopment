import 'package:design_app/pages/manageData_page/category_page.dart';
import 'package:design_app/pages/manageData_page/customer_page.dart';
import 'package:design_app/pages/manageData_page/exchange_page.dart';
import 'package:design_app/pages/manageData_page/products_page.dart';
import 'package:design_app/pages/manageData_page/staff_page.dart';
import 'package:design_app/pages/manageData_page/supplier_page.dart';
import 'package:design_app/pages/manageData_page/unit_page.dart';
import 'package:flutter/material.dart';

List<String> items = [
  "ຂໍ້ມູນຫົວໜ່ວຍ",
  "ຂໍ້ມູນປະເພດສີນຄ້າ",
  "ຂໍ້ມູນສີນຄ້າ",
  "ອັດຕາແລກປ່ຽນ",
  "ພະນັກງານ",
  "ຜູ້ສະໜອງ",
  "ລູກຄ້າ", // Ensure to add an item for all 7 routes if you use 7 routes.
];

List<Icon> icons = [
  Icon(Icons.ac_unit, size: 70, color: Colors.amber),
  Icon(Icons.category, size: 70, color: Colors.amber),
  Icon(Icons.folder_open, size: 70, color: Colors.amber),
  Icon(Icons.currency_exchange_sharp, size: 70, color: Colors.amber),
  Icon(Icons.person, size: 70, color: Colors.amber),
  Icon(Icons.bus_alert, size: 70, color: Colors.amber),
  Icon(Icons.people, size: 70, color: Colors.amber),
];

List<Widget> routePage = [
  UnitPage(),
  CategoryPage(),
  ProductsPage(),
  ExchangePage(),
  StaffPage(),
  SupplierPage(),
  CustomerPage(),
];

class ManageMenuPage extends StatefulWidget {
  const ManageMenuPage({super.key});

  @override
  State<ManageMenuPage> createState() => _ManageMenuPageState();
}

class _ManageMenuPageState extends State<ManageMenuPage> {
  void selectPage(int idx) {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => routePage[idx],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ຈັດການຂໍ້ມູນພື້ນຖານ"),
      ),
      body: Container(
        margin: EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
          ),
          itemBuilder: (c, indx) {
            return InkWell(
              onTap: () {
                selectPage(indx);
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                width: 180,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.blueGrey,
                  border: Border.all(color: Colors.green, width: 2),
                ),
                child: Column(
                  children: [
                    icons[indx], // Dynamic icon assignment
                    Spacer(),
                    Text(
                      items[indx], // Dynamic text from items
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'NotosansLao'
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
