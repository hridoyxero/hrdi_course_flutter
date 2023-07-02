import 'package:flutter/material.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({Key? key}) : super(key: key);

  @override
  State<ExpensesScreen> createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  TextEditingController _itemNameController = TextEditingController();
  TextEditingController _itemPriceController = TextEditingController();

  int total = 1;
  List<String> _serials = [];
  List<String> _items = [];
  List<String> _itemPrices = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expenses"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          children: [
            //Expense list

            SizedBox(height: 32,),

            //Titles
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
              ),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Serial Column
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 8,),
                            child: Text("SL".toUpperCase(), style: TextStyle(fontWeight: FontWeight.bold,),)),
                      ],
                    ),
                  ),

                  //Item Name Column
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Text("Item".toUpperCase(), style: TextStyle(fontWeight: FontWeight.bold,),),
                      ],
                    ),
                  ),

                  //Price Column
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 8,),
                            child: Text("Price".toUpperCase(), style: TextStyle(fontWeight: FontWeight.bold,),)),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // list
            Expanded(
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                        ),
                        child: Row(
                          children: [
                            //Serial Column
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(left: 16,),
                                    decoration: BoxDecoration(
                                      color: Colors.blue.shade50,
                                    ),
                                    child: Text(_serials.elementAt(index)),
                                  ),
                                ],
                              ),
                            ),

                            //Item Name Column
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(top: 4, bottom: 4,),
                                    // alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      // color: Colors.red,
                                    ),
                                    child: Text(_items.elementAt(index), textAlign: TextAlign.center,),
                                  ),
                                ],
                              ),
                            ),

                            //Price Column
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(right: 16,),
                                    decoration: BoxDecoration(
                                      color: Colors.blue.shade50,
                                    ),
                                    child: Text(_itemPrices.elementAt(index)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(height: 1, color: Colors.blue.withOpacity(0.2),),
                    ],
                  );
                },
              ),
            ),

            SizedBox(height: 32,),

            //Inputs
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: TextFormField(
                    controller: _itemNameController,
                    decoration: InputDecoration(
                      hintText: "Item Name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    controller: _itemPriceController,
                    decoration: InputDecoration(
                      hintText: "Price",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 16,
            ),

            // Add button
            InkWell(
              onTap: () {
                if (_itemNameController.text.isNotEmpty &&
                    _itemPriceController.text.isNotEmpty) {
                  _items.add(_itemNameController.text ?? "");
                  _itemPrices.add(_itemPriceController.text ?? "");

                  _serials.add((total++).toString());

                  _itemNameController.text = '';
                  _itemPriceController.text = '';
                }

                setState(() {});
              },
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "Add".toUpperCase(),
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,),
                ),
              ),
            ),

            SizedBox(
              height: 32,
            ),
          ],
        ),
      ),
    );
  }
}

