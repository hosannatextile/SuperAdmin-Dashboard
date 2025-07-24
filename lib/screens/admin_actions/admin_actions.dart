import 'package:admin/responsive.dart';
import 'package:admin/screens/dashboard/components/header.dart';
import 'package:admin/screens/dashboard/components/my_fields.dart';
import 'package:admin/screens/dashboard/components/recent_files.dart';
import 'package:admin/screens/dashboard/components/storage_details.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class AdminActionsScreen extends StatefulWidget {
  @override
  State<AdminActionsScreen> createState() => _AdminActionsScreenState();
}

class _AdminActionsScreenState extends State<AdminActionsScreen> {
  String selectedAssignee="Select Assignee";
  String selectedManager="Select Manager";
  String selectedDepartment="Select Department";
  final List<Map<String, String>> data = [
    // {
    //   'task': 'Audit the Data',
    //   'assignee': 'Rashid',
    //   'manager': 'Zubair',
    //   'complete': '12 April 2025',
    //   'status':'overdue'
    // },
    // {
    //   'task': 'Audit the Data',
    //   'assignee': 'Rashid',
    //   'manager': 'Zubair',
    //   'complete': '12 April 2025',
    //   'status':'pending'
    // },
    // {
    //   'task': 'Audit the Data',
    //   'assignee': 'Rashid',
    //   'manager': 'Zubair',
    //   'complete': '12 April 2025',
    //   'status':'delayed'
    // },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(),
            Text("Admin Actions"),
            SizedBox(height: defaultPadding),
           Row(children: [
              Expanded(
                flex: 2,
                child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: selectedAssignee,
                  underline: SizedBox(),
                  style: TextStyle(fontSize: 20,color: Colors.grey),
                  items: [
                     DropdownMenuItem(
                      value: "Select Assignee",
                      child: Text("Select Assignee"),
                    ),
                     DropdownMenuItem(
                      value: "IT",
                      child: Text("IT"),
                    ),
                     DropdownMenuItem(
                      value: "Admin",
                      child: Text("Admin"),
                    ),
                  
                   
                   
                  ],
                  onChanged: (value) {
                    selectedAssignee = value!;
                    setState(() {});
                    print(value);
                  },
                ),
                            ),
              ),
              SizedBox(width: 10,),
              Expanded(
                flex: 2,
                child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: selectedManager,
                  underline: SizedBox(),
                  style: TextStyle(fontSize: 20,color: Colors.grey),
                  items: [
                     DropdownMenuItem(
                      value: "Select Manager",
                      child: Text("Select Manager"),
                    ),
                     DropdownMenuItem(
                      value: "IT",
                      child: Text("IT"),
                    ),
                     DropdownMenuItem(
                      value: "Admin",
                      child: Text("Admin"),
                    ),
                  
                   
                   
                  ],
                  onChanged: (value) {
                    selectedManager = value!;
                    setState(() {});
                    print(value);
                  },
                ),
                            ),
              ),
              SizedBox(width: 10,),
              Expanded(
                flex: 2,
                child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: selectedDepartment,
                  underline: SizedBox(),
                  style: TextStyle(fontSize: 20,color: Colors.grey),
                  items: [
                     DropdownMenuItem(
                      value: "Select Department",
                      child: Text("Select Department"),
                    ),
                     DropdownMenuItem(
                      value: "IT",
                      child: Text("IT"),
                    ),
                     DropdownMenuItem(
                      value: "Admin",
                      child: Text("Admin"),
                    ),
                  
                   
                   
                  ],
                  onChanged: (value) {
                    selectedDepartment = value!;
                    setState(() {});
                    print(value);
                  },
                ),
                            ),
              ),
           ],),
              SizedBox(height: defaultPadding),
            Card(
              margin: EdgeInsets.all(8),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // ───────── column 0 ─────────
                    Expanded(
                      flex: 2, // <- bigger/smaller numbers tweak width
                      child: Text(
                        'Task',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),

                    // ───────── column 1 ─────────
                    Expanded(
                      flex: 2,
                      child: Text("Assignee"),
                    ),

                    // ───────── column 2 ─────────
                    Expanded(
                      flex: 2,
                      child: Text('Manager'),
                    ),

                    // ───────── column 3 ─────────
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Completed',
                        textAlign: TextAlign
                            .center, // right-align last column if you like
                      ),
                    ),
                    // Expanded(
                    //   flex: 2,
                    //   child: Text(
                    //     'Status',
                    //     textAlign: TextAlign
                    //         .center, // right-align last column if you like
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
             SizedBox(height: 8),
            Column(
              children:data.length==0?[Text("No Data")]: data.map((entry) {
                return InkWell(
                 // onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UserDetailsScreen())),
                  child: Card(
                    margin: EdgeInsets.all(8),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // ───────── column 0 ─────────
                          Expanded(
                            flex: 2, // <- bigger/smaller numbers tweak width
                            child: Text(
                              entry['task'] ?? '',
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                  
                          // ───────── column 1 ─────────
                          Expanded(
                            flex: 2,
                            child: Text(entry['assignee'] ?? ''),
                          ),
                  
                          // ───────── column 2 ─────────
                          Expanded(
                            flex: 2,
                            child: Text(entry['manager'] ?? ''),
                          ),
                  
                          // ───────── column 3 ─────────
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                Text(
                                  entry['complete'] ?? '',
                                  textAlign: TextAlign
                                      .start, // right-align last column if you like
                                ),
                                Text(
                                  entry['status'] ?? '',
                                  textAlign: TextAlign
                                      .start, // right-align last column if you like
                                ),
                              ],
                            ),
                          ),
                          // ───────── column 4 ─────────
                         
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
