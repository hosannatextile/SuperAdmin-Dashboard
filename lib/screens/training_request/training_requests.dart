import 'package:admin/responsive.dart';
import 'package:admin/screens/dashboard/components/header.dart';
import 'package:admin/screens/dashboard/components/my_fields.dart';
import 'package:admin/screens/dashboard/components/recent_files.dart';
import 'package:admin/screens/dashboard/components/storage_details.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class TrainingRequestScreen extends StatefulWidget {
  @override
  State<TrainingRequestScreen> createState() => _TrainingRequestScreenState();
}

class _TrainingRequestScreenState extends State<TrainingRequestScreen> {
  String assignedDepartment = 'Select Department';
  final List<Map<String, String>> data = [
    {
      'topic': 'Fire Saftey',
      'department': 'Safety',
      'requester': 'Imran',
      'status': 'Pending',
      
    },
    {
      'topic': 'Fire Saftey',
      'department': 'Safety',
      'requester': 'Imran',
      'status': 'Approve',
      
    },
    {
      'topic': 'Fire Saftey',
      'department': 'Safety',
      'requester': 'Imran',
      'status': 'Approve',
      
    },
    {
      'topic': 'Fire Saftey',
      'department': 'Safety',
      'requester': 'Imran',
      'status': 'Rejected',
      
    },
    {
      'topic': 'Fire Saftey',
      'department': 'Safety',
      'requester': 'Imran',
      'status': 'Pending',
      
    },
  
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
            Text("Training Requests",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
          
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
                        'Topic',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),

                    // ───────── column 1 ─────────
                    Expanded(
                      flex: 3,
                      child: Text("Department"),
                    ),

                    // ───────── column 2 ─────────
                    Expanded(
                      flex: 3,
                      child: Text('Requester'),
                    ),

                    // ───────── column 3 ─────────
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Status',
                        textAlign: TextAlign
                            .start, // right-align last column if you like
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Text(
                        'Assigned Department',
                        textAlign: TextAlign
                            .start, // right-align last column if you like
                      ),
                    ),
                  
                  ],
                ),
              ),
            ),
            SizedBox(height: 8),
            Column(
              children: data.map((entry) {
                return InkWell(
                  onTap: (){},
                  //()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UserDetailsScreen())),
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
                              entry['topic'] ?? '',
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                  
                          // ───────── column 1 ─────────
                          Expanded(
                            flex: 3,
                            child: Text(entry['department'] ?? ''),
                          ),
                  
                          // ───────── column 2 ─────────
                          Expanded(
                            flex: 3,
                            child: Text(entry['requester'] ?? ''),
                          ),
                  
                          // ───────── column 3 ─────────
                          Expanded(
                            flex: 2,
                            child: Text(
                              entry['status'] ?? '',
                              textAlign: TextAlign
                                  .start, // right-align last column if you like
                            ),
                          ),
                          // ───────── column 4 ─────────
                         Expanded(
                          flex: 5,
                           child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
              ),
              child: DropdownButton<String>(
                isExpanded: true,
                value: assignedDepartment,
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
                  assignedDepartment = value!;
                  setState(() {});
                  print(value);
                },
              ),
            ),
                         )
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
