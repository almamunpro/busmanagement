import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'ticket_buying_page.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int passengerCount = 1; // Define passengerCount here
  // Set the default value to 'AC' or any other initial value
  String selectedFromLocation = 'Dhaka';
  String selectedToLocation = 'Uttara';
  String selectedType = 'AC';
  DateTime? selectedDate;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void _ticketBuyingPage() {
    // Navigate to the registration page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TicketBuyingPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.01,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.more_vert),
                    onPressed: () {
                      // Handle menu button press
                    },
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/profile_image.jpg'),
                  ),
                ],
              ),
            ),
            Container(
              width: 600,
              child: Text(
                "Hey, Abdullah!",
                style: TextStyle(
                  fontSize: 26,
                  // fontWeight: FontWeight.w600,
                  color: Colors.blue,
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 600,
              child: Text(
                "e-Travel",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.blue),
              ),
            ),
            SizedBox(height: 20),

            // Container with two rows and two columns
            Container(
              width: 600,
              height: 200,
              // color: Colors.blue,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        // Row 1, Column 1
                        Container(
                          // padding: EdgeInsets.all(8.0),
                          // color: Colors.blue,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                // width: 10,
                                // height: 20,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.blue,
                                ),
                              ),
                              Text(
                                'From:',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          width: double.infinity,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.location_on, color: Colors.green),
                              SizedBox(width: 10),
                              Expanded(
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  hint: Text('From Location'),
                                  value: selectedFromLocation,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedFromLocation = newValue!;
                                    });
                                  },
                                  items: <String>[
                                    'Dhaka',
                                    'Uttara',
                                    'Valuka',
                                    'Mymensingh'
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 119, 194, 255),
                                          // backgroundColor: Colors.blue
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8.0),
                        // Row 2, Column 1

                        Expanded(
                          child: Column(
                            children: [
                              // Row 1, Column 2
                              Container(
                                // padding: EdgeInsets.all(8.0),
                                // color: Colors.red,
                                child: Text(
                                  'To :',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 8.0),
                        // Row 2, Column 2
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          width: double.infinity,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.location_on, color: Colors.green),
                              SizedBox(width: 10),
                              Expanded(
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  hint: Text('To Location'),
                                  value: selectedToLocation,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedToLocation = newValue!;
                                    });
                                  },
                                  items: <String>[
                                    'Dhaka',
                                    'Uttara',
                                    'Valuka',
                                    'Mymensingh'
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

// Additional Container 1
            Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Column(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      'Passenger :',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        // Handle decrease button press
                                        setState(() {
                                          if (passengerCount > 1) {
                                            passengerCount--;
                                          }
                                        });
                                      },
                                      child: Text(
                                        '-',
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      '$passengerCount',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    ElevatedButton(
                                      onPressed: () {
                                        // Handle increase button press
                                        setState(() {
                                          passengerCount++;
                                        });
                                      },
                                      child: Text(
                                        '+',
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Row(
                          children: [
                            Text(
                              'Type :',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 8),
                            DropdownButton<String>(
                              value: selectedType,
                              onChanged: (String? newValue) {
                                // Handle type selection
                                setState(() {
                                  selectedType = newValue!;
                                });
                              },
                              items: <String>['AC', 'Non-AC']
                                  .map<DropdownMenuItem<String>>(
                                (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                },
                              ).toList(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),

// Additional Container 2
            // ...

// Additional Container 2
            // Container(
            //   width: 600,
            //   height: 100,
            //   color: Colors.orange,
            //   child: Center(
            //     child: Text(
            //       'Additional Container 2',
            //       style: TextStyle(
            //         fontSize: 18,
            //         fontWeight: FontWeight.bold,
            //         color: Colors.black,
            //       ),
            //     ),
            //   ),
            // ),

            SizedBox(height: 20),

// Date Input
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                children: [
                  Text(
                    'Depart :',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                      _selectDate(context); // Call function to show date picker
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        selectedDate != null
                            ? "${selectedDate!.toLocal()}".split(' ')[0]
                            : 'Select Date',
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

// Search Button
            ElevatedButton(
              onPressed: _ticketBuyingPage,
              child: const Text('search'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
