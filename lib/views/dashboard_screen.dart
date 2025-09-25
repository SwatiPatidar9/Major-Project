import 'package:flutter/material.dart';

import 'attendance_screen.dart';
import 'employee_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  // bottom nav actions
  void _onBottomNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        debugPrint("Home clicked");
        break;
      case 1:
        debugPrint("Leads clicked");
        break;
      case 2:
        debugPrint("Reminders clicked");
        break;
      case 3:
        debugPrint("Meeting clicked");
        break;
      case 4:
        debugPrint("Task clicked");
        break;
    }
  }

  // card actions
  void _onCardTap(String key) {
    switch (key) {
      case "Attendance":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const AttendanceScreen()),
        );
        break;
      case "Employee":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const EmployeeTablePage()),
        );
        break;
      default:
        debugPrint("No page defined for $key");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: Container(
          color: const Color(0xFF0097A7),
          padding: const EdgeInsets.only(top: 20, left: 16, right: 16, bottom: 0),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage("assets/profile.png"),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("swati Patidar",
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  Text("swati@gmail.com", style: TextStyle(color: Colors.white70, fontSize: 14)),
                ],
              ),
              const Spacer(),
              const Icon(Icons.notifications_none, color: Colors.white, size: 28),
              const SizedBox(width: 8),

            ],
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              physics: const NeverScrollableScrollPhysics(),
              children: [
              //  _buildCard("Leads", "9 Leads", "Total Leads", Colors.lightBlue.shade100, Icons.bar_chart),
               // _buildCard("Quotations", "1 Quotations", "Quotation sent", Colors.purple.shade100, Icons.description),
               // _buildCard("Inventory", "50 Product", "Check Inventory", Colors.blue.shade100, Icons.inventory),
              //  _buildCard("Hot Prospectus", "0 Leads", "Hot Prospectus", Colors.grey.shade300, Icons.query_stats),
               // _buildCard("Task", "2 Tasks", "Task", Colors.teal.shade100, Icons.check_circle),
                _buildCard("Attendance", "0 Attendances", "Attendance", Colors.brown.shade200, Icons.access_time),
                _buildCard("Employee", "3 Employee", "Employee", Colors.red.shade100, Icons.people),
                _buildCard("Leave", "0 Leaves", "Leave", Colors.pink.shade100, Icons.event_busy),
              ],
            ),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text("Today Attendance",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text("No Attendance Found.",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onBottomNavTapped,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "Leads"),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "Reminders"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "Meeting"),
          BottomNavigationBarItem(icon: Icon(Icons.task), label: "Task"),
        ],
      ),
    );
  }

  Widget _buildCard(String key, String title, String subtitle, Color color, IconData icon) {
    return InkWell(
      onTap: () => _onCardTap(key),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 28, color: Colors.black54),
            const Spacer(),
            Text(title,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Text(subtitle, style: const TextStyle(color: Colors.black54, fontSize: 13)),
          ],
        ),
      ),
    );
  }
}




/*
// // Dummy DashboardScreen for testing
// import 'package:flutter/material.dart';
//
// class DashboardScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Dashboard")),
//       body: Center(child: Text("Welcome to Dashboard!")),
//     );
//   }
// }

import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Container(
          color: const Color(0xFF0097A7),
          padding: const EdgeInsets.only(top: 30, left: 16, right: 16, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage("assets/profile.png"), // Replace with networkImage
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("swati Patidar",
                          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                      Text("swati@gmail.com", style: TextStyle(color: Colors.white70, fontSize: 14)),
                    ],
                  ),
                  const Spacer(),
                  const Icon(Icons.notifications_none, color: Colors.white, size: 28),
                  const SizedBox(width: 8),

                ],
              ),
            ],
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              physics: const NeverScrollableScrollPhysics(),
              children: [
              //  _buildCard("9 Leads", "Total Leads", Colors.lightBlue.shade100, Icons.bar_chart),
               // _buildCard("1 Quotations", "Quotation sent", Colors.purple.shade100, Icons.description),
                //_buildCard("50 Product", "Check Inventory", Colors.blue.shade100, Icons.inventory),
               // _buildCard("0 Leads", "Hot Prospectus", Colors.grey.shade300, Icons.query_stats),
                _buildCard("0 Leaves", "Leave", Colors.pink.shade100, Icons.event_busy),
               // _buildCard("2 Tasks", "Task", Colors.teal.shade100, Icons.check_circle),
                _buildCard("0 Attendances", "Attendance", Colors.brown.shade200, Icons.access_time),
                _buildCard("3 Employee", "Employee", Colors.red.shade100, Icons.people),
              ],
            ),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text("Today Attendance",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text("No Attendance Found.",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "Reminders"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "Meeting"),
          BottomNavigationBarItem(icon: Icon(Icons.task), label: "Task"),
        ],
      ),
    );
  }

  Widget _buildCard(String title, String subtitle, Color color, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 28, color: Colors.black54),
          const Spacer(),
          Text(title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Text(subtitle, style: const TextStyle(color: Colors.black54, fontSize: 13)),
        ],
      ),
    );
  }
}
*/
