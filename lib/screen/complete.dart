import 'package:flutter/material.dart';
import 'package:layout_app/modal/items.dart';
import 'package:layout_app/screen/card_list.dart';

class Complete extends StatefulWidget {
  const Complete({super.key, required this.items});

  final List<DataItems> items;

  @override
  State<Complete> createState() => _StateComplete();
}

class _StateComplete extends State<Complete> {
  @override
  Widget build(BuildContext context) {
    List<DataItems> completedItems =
        widget.items.where((item) => item.complete).toList();

    return Scaffold(
        backgroundColor: const Color.fromRGBO(214, 215, 239, 1),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(147, 149, 211, 1),
          title: const Text(
            'Completed Task',
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
        body: ListView(
          children: completedItems.map((item) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(7, 5, 7, 5),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 82,
                    // margin: const EdgeInsets.only(bottom: 0),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(19.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.title,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromRGBO(147, 149, 211, 1),
                                    ),
                                  ),
                                  Text(
                                    item.sub_title,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ));
  }
}
