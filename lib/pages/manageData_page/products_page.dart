import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  TextEditingController txtSearch = TextEditingController();
  List data = [];
  final String url = "http://10.0.2.2:4000/book";

  @override
  void initState() {
    fetchAllData();
    super.initState();
  }

  Future<void> fetchAllData() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        setState(() {
          data = json.decode(response.body);
        });
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void showBookDialog({String? id, String? name, String? price, String? page}) {
    TextEditingController idController = TextEditingController(text: id ?? "");
    TextEditingController nameController =
        TextEditingController(text: name ?? "");
    TextEditingController priceController =
        TextEditingController(text: price ?? "");
    TextEditingController pageController =
        TextEditingController(text: page ?? "");

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(id == null ? 'Add Book' : 'Edit Book'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                  controller: idController,
                  decoration: InputDecoration(labelText: 'ID')),
              TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Name')),
              TextField(
                  controller: priceController,
                  decoration: InputDecoration(labelText: 'Price')),
              TextField(
                  controller: pageController,
                  decoration: InputDecoration(labelText: 'Page')),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                if (id == null) {
                  await addBook(idController.text, nameController.text,
                      priceController.text, pageController.text);
                } else {
                  await editBook(idController.text, nameController.text,
                      priceController.text, pageController.text);
                }
                Navigator.pop(context);
                fetchAllData(); // Refresh data after insert/update
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  Future<void> addBook(
      String id, String name, String price, String page) async {
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(
          {'book_ID': id, 'book_Name': name, 'price': price, 'page': page}),
    );
    if (response.statusCode == 201) {
      fetchAllData();
    } else {
      print('Failed to add book: ${response.body}');
    }
  }

  Future<void> editBook(
      String id, String name, String price, String page) async {
    final response = await http.put(
      Uri.parse('$url/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'book_Name': name, 'price': price, 'page': page}),
    );
    if (response.statusCode == 200) {
      fetchAllData();
    } else {
      print('Failed to edit book: ${response.body}');
    }
  }

  Future<void> deleteBook(String id) async {
    final response = await http.delete(Uri.parse('$url/$id'));
    if (response.statusCode == 200) {
      fetchAllData();
    } else {
      print('Failed to delete book: ${response.body}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ຈັດການຂໍ້ມູນປື້ມ"),
      ),
      body: data.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final getData = data[index];
                return ListTile(
                  leading: Text(
                    '${getData['book_ID']}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  title: Text(
                    '${getData['book_Name']}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'Price: ${getData['price']}\nPage: ${getData['page']}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade400,
                    ),
                  ),
                  isThreeLine: true,
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.network(
                        "https://i.pinimg.com/474x/b3/33/39/b333395c21ab531d9aa70058f970239c.jpg",
                      ),
                      IconButton(
                        icon: Icon(Icons.edit, color: Colors.green),
                        onPressed: () => showBookDialog(
                          id: getData['book_ID'].toString(),
                          name: getData['book_Name'],
                          price: getData['price'].toString(),
                          page: getData['page'].toString(),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => deleteBook(
                          getData['book_ID'].toString(),
                        ),
                      ),
                    ],
                  ),
                );
                Divider();
              }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showBookDialog(),
        child: Icon(Icons.add),
      ),
    );
  }
}
