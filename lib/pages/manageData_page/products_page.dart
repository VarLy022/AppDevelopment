import 'package:flutter/material.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  List data = [];
  final String url = "";

  Future<void> fetchallData() async {
    try {
      // final repons=await http.get(Uri.parse(uri));
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ຈັດການຂໍ້ມູນປື້ມ"),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Container(
            height: 50,
            margin: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(width: 1),
                ),
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(
                  Icons.book_online,
                  color: Colors.teal,
                  size: 35,
                ),
                labelText: "ຂໍ້ມູນທີ່ຕ້ອງການຄົ້ນຫາ",
                suffix: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.close,
                        color: Colors.red,
                        size: 35,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        color: Colors.green,
                        size: 35,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 35,
        ),
      ),
    );
  }
}
