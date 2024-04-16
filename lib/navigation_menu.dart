import 'package:flutter/material.dart';
import 'package:layout_app/modal/items.dart';
import 'package:layout_app/screen/add_task.dart';
import 'package:layout_app/screen/card_body.dart';

import 'screen/complete.dart';

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;

  final List<DataItems> items = [];

  static const List<Widget> _widgetOptions = <Widget>[
    CardBody(),
    Complete(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(214, 215, 239, 1),
      appBar: AppBar(
        title: const Text(
          'TODO APP',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: const Color.fromRGBO(147, 149, 211, 1),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const AddTask())));
        },
        backgroundColor: const Color.fromRGBO(147, 149, 211, 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(90)),
        child: const Icon(
          Icons.add,
          size: 21,
          color: Colors.white,
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'All',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check),
            label: 'Completed',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromRGBO(147, 149, 211, 1),
        onTap: _onItemTapped,
      ),
    );
  }
}
