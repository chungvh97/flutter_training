import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:layout_app/modal/items.dart';

class CardBody extends StatelessWidget {
  CardBody({
    super.key,
    required this.item,
    required this.handleDelete,
  });

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  var item;
  final Function handleDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(7, 20, 7, 20),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 82,
            margin: const EdgeInsets.only(bottom: 20),
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
                      const Column(
                        children: [
                          Text(
                            'TODO TITLE',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(147, 149, 211, 1),
                            ),
                          ),
                          Text(
                            'TODO SUB TITLE',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 50,
                            child: InkWell(
                              onTap: () async {
                                print('123');
                                return;
                              },
                              child: const Icon(
                                Icons.edit,
                                color: Color.fromRGBO(179, 183, 238, 1),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 50,
                            child: InkWell(
                              onTap: () async {
                                print('222');
                                if (await confirm(context)) {
                                  handleDelete(item.id);
                                }
                                return;
                              },
                              child: const Icon(
                                Icons.delete_outline_rounded,
                                color: Color.fromRGBO(179, 183, 238, 1),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 50,
                            child: InkWell(
                              onTap: () async {
                                print('123');
                                return;
                              },
                              child: const Icon(
                                Icons.check_circle_outline,
                                color: Color.fromRGBO(179, 183, 238, 1),
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
          ),
        ],
      ),
    );
  }
}
