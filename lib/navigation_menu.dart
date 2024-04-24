import 'package:flutter/material.dart';
import 'package:layout_app/modal/items.dart';
import 'package:layout_app/screen/card_detail.dart';
import 'package:layout_app/screen/card_list.dart';
import 'package:layout_app/screen/complete.dart';

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  final int _selectedIndex = 0;

  final List<DataItems> items = [
    DataItems(
        id: '1', title: 'chung1', sub_title: 'sub_title1', complete: true),
    DataItems(
        id: '2', title: 'chung2', sub_title: 'sub_title2', complete: false),
    DataItems(
        id: '3',
        title: 'chung33123213',
        sub_title: 'sub_title3',
        complete: false),
  ];

  void _handleComplete(String id) {
    // Find the person with the given id
    setState(() {
      DataItems? personToUpdate = items.firstWhere((person) => person.id == id);
      personToUpdate.complete = true;
    });
  }

  void _handleDelete(String id) {
    setState(() {
      items.removeWhere((element) => element.id == id);
    });
  }

  void _handleUpdate(String id, String title, String subTitle) {
    // Find the person with the given id
    setState(() {
      DataItems? personToUpdate = items.firstWhere((person) => person.id == id);
      personToUpdate.title = title;
      personToUpdate.sub_title = subTitle;
    });
  }

  void _onItemTapped(int index) {
    if (index == 1) {
      Navigator.push(context,
          MaterialPageRoute(builder: ((context) => (Complete(items: items)))));
    }
  }

  void _handleAddTask(String id, String title, String subTitle) {
    final newItem = DataItems(
        id: DateTime.now().toString(),
        title: title,
        sub_title: subTitle,
        complete: false);
    setState(() {
      items.add(newItem);
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
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => CardDetail(
                        type: 'Add Task',
                        item: const {},
                        id: '',
                        title: '',
                        subTitle: '',
                        handleSubmit: _handleAddTask,
                      ))));
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
        child: CardList(
          items: items,
          handleDelete: _handleDelete,
          handleUpdate: _handleUpdate,
          handleComplete: _handleComplete,
        ),
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
