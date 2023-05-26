import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../utils/utils.dart';
import '../../views/home/add_update_todo.dart';
import '../constants/app_color.dart';

class TODO extends StatelessWidget {
  final String title;
  final String description;
  final String docId;
  final Timestamp time;

  const TODO(
      {Key? key,
      required this.title,
      required this.description,
      required this.time,
      required this.docId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          useSafeArea: true,
          barrierColor: Colors.transparent,
          isScrollControlled: true,
          backgroundColor: AppColor.secondary,
          context: context,
          builder: (context) {
            return SizedBox(
                height: size.height * 0.9,
                child: AddUpdateTodo(
                  docId: docId,
                  title: title,
                  description: description,
                  time: time.toDate(),
                ));
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
            color: AppColor.secondary,
            borderRadius: BorderRadius.circular(15)),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            Text(
                description,
                style: const TextStyle(color: Colors.white, fontSize: 16),
                overflow: TextOverflow.ellipsis,
                maxLines: 3),
            const Spacer(),
            const SizedBox(height: 6),
            Align(
              alignment: Alignment.centerRight,
              child: Text(Utils.dateUTCtoLocal(time.toDate(),
                  format:
                  AppDateFormat.shortMonthFormat),
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            )
          ],
        ),
      ),
    );
  }
}
