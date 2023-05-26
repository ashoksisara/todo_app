import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/todo_provider.dart';
import '../../shared/constants/app_color.dart';
import '../../shared/constants/app_string.dart';
import '../../shared/widgets/custom_elevated_button.dart';
import '../../utils/utils.dart';

class AddUpdateTodo extends StatefulWidget {
  final String? docId;
  final String? title;
  final String? description;
  final DateTime? time;

  const AddUpdateTodo(
      {Key? key, required this.docId, this.description, this.title, this.time})
      : super(key: key);

  @override
  State<AddUpdateTodo> createState() => _AddUpdateTodoState();
}

class _AddUpdateTodoState extends State<AddUpdateTodo> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<TODOProvider>(context, listen: false);
      provider.updateData(widget.title, widget.description, widget.time);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TODOProvider>(builder: (context, provider, _) {
      return ListView(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: Navigator.of(context).pop,
                  icon: const Icon(
                    Icons.close,
                    color: AppColor.appWhite,
                  )),
              CustomElevatedButton(
                  width: 100,
                  height: 30,
                  textColor: AppColor.appWhite,
                  onPressed: () {
                    if (widget.docId != null && widget.docId!.isNotEmpty) {
                      provider.updateTODO(widget.docId!);
                    } else {
                      provider.addTODO();
                    }
                    Navigator.of(context).pop();
                  },
                  btnText: widget.docId != null && widget.docId!.isNotEmpty
                      ? AppString.update
                      : AppString.add)
            ],
          ),
          const SizedBox(height: 20),
          TextField(
            controller: provider.titleController,
            decoration: const InputDecoration(hintText: AppString.title),
            style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: AppColor.appWhite),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: provider.descriptionController,
            decoration: const InputDecoration(
              hintText: AppString.description,
            ),
            keyboardType: TextInputType.multiline,
            textInputAction: TextInputAction.newline,
            maxLines: null,
            style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: AppColor.appWhite),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                AppString.date,
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: AppColor.appWhite),
              ),
              TextButton(
                  onPressed: () async {
                    FocusScope.of(context).unfocus();
                    final selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate:
                            DateTime.now().add(const Duration(days: 1000)));
                    provider.setDate(selectedDate);
                  },
                  child: Text(
                    provider.selectedDate != null
                        ? Utils.dateToString(provider.selectedDate!,
                            format: AppDateFormat.shortMonthFormat)
                        : AppString.selectDate,
                    style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: AppColor.textLight),
                  ),
              )
            ],
          ),
          const SizedBox(height: 40),
          if (widget.docId != null)
            CustomElevatedButton(onPressed: () {
              provider.deleteTODO(widget.docId!);
              Navigator.of(context).pop();
            }, btnText: AppString.delete,textColor: AppColor.appWhite,)
        ],
      );
    });
  }
}
