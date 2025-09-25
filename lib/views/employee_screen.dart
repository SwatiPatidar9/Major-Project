import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'addemployee_screen.dart';

// Dummy Employee Model
class Employee {
  final int id;
  final String employeName;
  final String employeEmailId;
  final String employePhoneNumber;
  final String roleName;

  Employee({
    required this.id,
    required this.employeName,
    required this.employeEmailId,
    required this.employePhoneNumber,
    required this.roleName,
  });
}

class EmployeeTablePage extends StatefulWidget {
  const EmployeeTablePage({super.key});

  @override
  State<EmployeeTablePage> createState() => _EmployeeTablePageState();
}

class _EmployeeTablePageState extends State<EmployeeTablePage> {
  // Static employee data (instead of API)
  List<Employee> employees = [
    Employee(
      id: 1,
      employeName: "Rahul Sharma",
      employeEmailId: "rahul.sharma@example.com",
      employePhoneNumber: "9876543210",
      roleName: "Manager",
    ),
    Employee(
      id: 2,
      employeName: "Priya Verma",
      employeEmailId: "priya.verma@example.com",
      employePhoneNumber: "9123456780",
      roleName: "HR",
    ),
    Employee(
      id: 3,
      employeName: "Amit Kumar",
      employeEmailId: "amit.kumar@example.com",
      employePhoneNumber: "9998887777",
      roleName: "Developer",
    ),
  ];

  // Delete Employee
  void deleteEmployee(int id) {
    setState(() {
      employees.removeWhere((e) => e.id == id);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Employee deleted successfully")),
    );
  }

  // Block Employee
  void blockEmployee(int id) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Employee $id has been blocked")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employee List"),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.white),
            onPressed: () {
              // Navigate to Add Employee Page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddEmployeePage(),
                ),
              );

            },
          ),
        ],
      ),
      backgroundColor: Colors.grey.shade100,
      body: employees.isEmpty
          ? const Center(child: Text("No employees found"))
          : ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: employees.length,
        itemBuilder: (context, index) {
          final emp = employees[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 0.3,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Employee Info
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      Text(emp.employeName,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                      Text("ID: ${emp.id}"),
                      Text(emp.employeEmailId),
                      Text("Role: ${emp.roleName}"),
                      const SizedBox(height: 10),
                    ],
                  ),

                  // Action Buttons
                  Column(
                    children: [
                      Row(
                        children: [
                          // Call Button
                          IconButton(
                            icon: const Icon(Icons.call, size: 20, color: Colors.green),
                            onPressed: () async {
                              final Uri callUri = Uri(
                                scheme: 'tel',
                                path: emp.employePhoneNumber ?? "",
                              );

                              if (await canLaunchUrl(callUri)) {
                                await launchUrl(
                                  callUri,
                                  mode: LaunchMode.externalApplication, // ✅ Forces dialer app
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("Could not open dialer")),
                                );
                              }
                            },
                          ),

                          // Edit Button
                          IconButton(
                            icon: const Icon(Icons.edit,
                                size: 20, color: Colors.blue),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AddEmployeePage(),
                                ),
                              );

                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          // Delete Button
                          IconButton(
                            icon: const Icon(Icons.delete,
                                size: 20, color: Colors.red),
                            onPressed: () {
                              deleteEmployee(emp.id);
                            },
                          ),
                          // Block Button
                          IconButton(
                            icon: const Icon(Icons.block_rounded,
                                size: 20, color: Colors.black),
                            onPressed: () {
                              blockEmployee(emp.id);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}




// Dummy Edit Employee Page
class EditEmployeePage extends StatelessWidget {
  final Employee employee;
  const EditEmployeePage({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit: ${employee.employeName}")),
      body: Center(
        child: Text("Edit details of ${employee.employeName} here"),
      ),
    );
  }
}
