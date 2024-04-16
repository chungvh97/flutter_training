import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  void _handleOnClick(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(147, 149, 211, 1),
        title: const Text(
          'Add Task',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          onPressed: () => {Navigator.pop(context)},
          icon: const Icon(
            Icons.arrow_back,
            size: 25,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(15, 20, 15, 54),
              child: Column(
                children: [
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Title',
                    ),
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Detail',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll(
                      Color.fromRGBO(147, 149, 211, 1)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                onPressed: () => _handleOnClick(context),
                child: const Text(
                  'ADD',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
