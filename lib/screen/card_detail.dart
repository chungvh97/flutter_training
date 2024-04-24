import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:layout_app/modal/items.dart';

class CardDetail extends StatefulWidget {
  const CardDetail(
      {super.key,
      required this.item,
      required this.id,
      required this.title,
      required this.subTitle,
      required this.type,
      required this.handleSubmit});

  final Object item;
  final String type;
  final String title;
  final String subTitle;
  final String id;

  final Function handleSubmit;

  @override
  State<CardDetail> createState() => _StateCardDetail();
}

class _StateCardDetail extends State<CardDetail> {
  TextEditingController titleController = TextEditingController();
  TextEditingController subTitleController = TextEditingController();

  void _handleOnClick(BuildContext context) {
    if (titleController.text.isEmpty || subTitleController.text.isEmpty) {
      return;
    }

    if (widget.type == 'Add Task') {
      widget.handleSubmit('', titleController.text, subTitleController.text);
    } else {
      if (widget.item is DataItems) {
        DataItems item = widget.item as DataItems;

        widget.handleSubmit(
            item.id, titleController.text, subTitleController.text);
      }
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.type == 'Edit Task') {
      if (widget.item is DataItems) {
        DataItems item = widget.item as DataItems;
        titleController.text = item.title;
        subTitleController.text = item.sub_title;
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(147, 149, 211, 1),
        title: Text(
          widget.type,
          style: const TextStyle(
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
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 54),
              child: Column(
                children: [
                  TextField(
                    controller: titleController,
                    obscureText: false,
                    decoration: const InputDecoration(
                      labelText: 'Title',
                    ),
                  ),
                  TextField(
                    controller: subTitleController,
                    obscureText: false,
                    decoration: const InputDecoration(
                      labelText: 'Detail',
                    ),
                  ),
                ],
              ),
            ),
            (widget.type == 'Add Task')
                ? SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: const MaterialStatePropertyAll(
                            Color.fromRGBO(147, 149, 211, 1)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
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
                : Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: const MaterialStatePropertyAll(
                              Color.fromRGBO(147, 149, 211, 1)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        onPressed: () => _handleOnClick(context),
                        child: const Text(
                          'Update',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Spacer(),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: const MaterialStatePropertyAll(
                              Color.fromRGBO(147, 149, 211, 1)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        onPressed: () => {Navigator.pop(context)},
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
