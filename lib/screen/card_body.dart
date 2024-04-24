import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:layout_app/modal/items.dart';
import 'package:layout_app/screen/add_task.dart';

class CardBody extends StatelessWidget {
  const CardBody({
    super.key,
    required this.items,
    required this.handleDelete,
    required this.handleUpdate,
    // required List<DataItems> items,
  });

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  final List<DataItems> items;
  // var item;
  final Function handleDelete;
  final Function handleUpdate;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: items.map((item) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(7, 15, 7, 0),
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
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 50,
                                child: InkWell(
                                  onTap: () async {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: ((context) => AddTask(
                                                  type: 'Edit Task',
                                                  item: item,
                                                  id: item.id,
                                                  title: item.title,
                                                  subTitle: item.sub_title,
                                                  handleSubmit: handleUpdate,
                                                ))));
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
      }).toList(),
    ));
  }
}
