import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final List<String> option = ["A = 16", "B = 4", "C = 7", "D = 10"];

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  String? selectoption1, selectoption2, selectoption3;
  TextEditingController txtDate = TextEditingController();
  String age = "";
  Future<void> selectDateOfBirth() async {
    try {
      DateTime? date1 = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1970),
          lastDate: DateTime.now());

      setState(() {
        if (date1 != null) {
          txtDate.text = DateFormat("dd/MM/yyyy")
              .format(date1); //txtDate.text=date1.toString().split("")[0]
          /*int DateSelect = int.parse(DateFormat("dd").format(date1));
          int MonthSelect = int.parse(DateFormat("MM").format(date1));
          int YearSelect = int.parse(DateFormat("yy").format(date1));
          int YearNow = int.parse(DateFormat("yy").format(DateTime.now()));*/
          int _age = DateTime.timestamp().year - date1.year;
          age = _age.toString();
          print("Age=$age year old");
        } else {
          txtDate.text = DateFormat("dd/MM/yyyy").format(DateTime.now());
        }
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Category"),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(65),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: txtDate,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(
                    Icons.calendar_today,
                    size: 30,
                    color: Colors.teal,
                  ),
                  labelText: "ວັນເດືອນປີເກີດ"),
              readOnly: true,
              onTap: () {
                selectDateOfBirth();
              },
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Text(
                "1. ຈົ່ງເລືອກຄຳຕອບທີ່ຖືກຕ້ອງຈາກການຄິດໄລ່ 5+2?",
                style: TextStyle(
                    color: Colors.lightBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: option.map((opt) {
                  return RadioListTile(
                      value: opt,
                      title: Text("${opt}"),
                      groupValue: selectoption1,
                      onChanged: (val) {
                        setState(() {
                          selectoption1 = val;
                        });
                      });
                }).toList(),
              ),
              SizedBox(
                height: 18,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (selectoption1 == "C = 7") {
                      showDialog(
                        context: context,
                        builder: (c) => AlertDialog(
                          title: Text("ຄຳຕອບທີ່ເລືອກຖືກ"),
                          content: Text("ຄຳຕອບ 5+2=7 ເປັນຄຳຕອບທີ່ຖືກຕ້ອງ"),
                          actions: [
                            TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text("ຕົກລົງ"))
                          ],
                        ),
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (c) => AlertDialog(
                          title: Text("ຄຳຕອບທີ່ເລືອກຜິດ"),
                          content: Text("ກະລຸນາເລືອກຄຳຕອບໃໝ່"),
                          actions: [
                            TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text("ຕົກລົງ"))
                          ],
                        ),
                      );
                    }
                  },
                  child: Text("ເລືອກຄຳຕອບ")),
              SizedBox(
                height: 18,
              ),
              Text(
                "2. ຈົ່ງເລືອກຄຳຕອບທີ່ຖືກຕ້ອງຈາກການຄິດໄລ່ 15-5?",
                style: TextStyle(
                    color: Colors.lightBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: option.map((opt) {
                  return RadioListTile(
                      value: opt,
                      title: Text("${opt}"),
                      groupValue: selectoption2,
                      onChanged: (val) {
                        setState(() {
                          selectoption2 = val;
                        });
                      });
                }).toList(),
              ),
              SizedBox(
                height: 18,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (selectoption2 == "D = 10") {
                      showDialog(
                        context: context,
                        builder: (c) => AlertDialog(
                          title: Text("ຄຳຕອບທີ່ເລືອກຖືກ"),
                          content: Text("ຄຳຕອບ 15-5=10 ເປັນຄຳຕອບທີ່ຖືກຕ້ອງ"),
                          actions: [
                            TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text("ຕົກລົງ"))
                          ],
                        ),
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (c) => AlertDialog(
                          title: Text("ຄຳຕອບທີ່ເລືອກຜິດ"),
                          content: Text("ກະລຸນາເລືອກຄຳຕອບໃໝ່"),
                          actions: [
                            TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text("ຕົກລົງ"))
                          ],
                        ),
                      );
                    }
                  },
                  child: Text("ເລືອກຄຳຕອບ")),
              SizedBox(
                height: 18,
              ),
              Text(
                "3. ຈົ່ງເລືອກຄຳຕອບທີ່ຖືກຕ້ອງຈາກການຄິດໄລ່ 4x4?",
                style: TextStyle(
                    color: Colors.lightBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: option.map((opt) {
                  return RadioListTile(
                      value: opt,
                      title: Text("${opt}"),
                      groupValue: selectoption3,
                      onChanged: (val) {
                        setState(() {
                          selectoption3 = val;
                        });
                      });
                }).toList(),
              ),
              SizedBox(
                height: 18,
              ),
              ElevatedButton(
                onPressed: () {
                  if (selectoption3 == "A = 16") {
                    showDialog(
                      context: context,
                      builder: (c) => AlertDialog(
                        title: Text("ຄຳຕອບທີ່ເລືອກຖືກ"),
                        content: Text("ຄຳຕອບ 4x4=16 ເປັນຄຳຕອບທີ່ຖືກຕ້ອງ"),
                        actions: [
                          TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text("ຕົກລົງ"))
                        ],
                      ),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (c) => AlertDialog(
                        title: Text("ຄຳຕອບທີ່ເລືອກຜິດ"),
                        content: Text("ກະລຸນາເລືອກຄຳຕອບໃໝ່"),
                        actions: [
                          TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text("ຕົກລົງ"))
                        ],
                      ),
                    );
                  }
                },
                child: Text("ເລືອກຄຳຕອບ"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
