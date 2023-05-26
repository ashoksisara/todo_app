import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/shared/constants/app_string.dart';
import '../../provider/todo_provider.dart';
import '../../service/firebase_auth_service.dart';
import '../../shared/constants/app_color.dart';
import '../../shared/constants/app_image.dart';
import '../../shared/widgets/app_drawer.dart';
import '../../shared/widgets/todo.dart';
import '../../utils/utils.dart';
import 'add_update_todo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  User? user;

  @override
  void initState() {
    _readTODO();
    user = FirebaseAuthService.instance.user;
    super.initState();
  }

  void _readTODO(){
    final provider = Provider.of<TODOProvider>(context,listen: false);
    provider.readTODO();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu, color: AppColor.secondary, size: 30),
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
        title: const Text(
          AppString.appName,
          style:
              TextStyle(color: AppColor.secondary, fontWeight: FontWeight.bold),
        ),
      ),
      drawer: const AppDrawer(),
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            height: 140,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              color: AppColor.primary,
              image: DecorationImage(
                  image: AssetImage(
                    AppImage.background,
                  ),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(AppString.welcome,
                    style: TextStyle(
                        color: AppColor.appWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
                Text((user?.displayName ?? 'User').toUpperCase(),
                    style: const TextStyle(
                        color: AppColor.appWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 30)),
                const Text(AppString.stayOrganizeStayFocus,
                    style: TextStyle(
                      color: AppColor.appWhite,
                    )),
                const Spacer(),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    Utils.dateUTCtoLocal(DateTime.now(),
                        format:
                        AppDateFormat.fullDateTimeFormat),
                    style: const TextStyle(
                      color: AppColor.appWhite,
                    ),
                  ),
                )
              ],
            ),
          ),
          Consumer<TODOProvider>(
            builder: (context, provider, _) {
              return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 1,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: provider.data?.length ?? 0,
                  itemBuilder: (BuildContext ctx, index) {
                    final data = provider.data;
                    final title = data?[index]["title"] ?? "";
                    final description = data?[index]["description"] ?? "";
                    final docId = data?[index]["docId"];
                    final time = data?[index]["time"] as Timestamp?;
                    return  TODO(
                      title: title,
                      description: description,
                      docId: docId,
                      time: time!,
                    );
                  });
            }
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.primary,
        onPressed: () {
          showModalBottomSheet(
            useSafeArea: true,
            barrierColor: Colors.transparent,
            isScrollControlled: true,
            backgroundColor: AppColor.secondary,
            context: context,
            builder: (context) {
              return const FractionallySizedBox(
                  heightFactor: 0.92,
                  child: AddUpdateTodo(
                    docId: null,
                  ));
            },
          );
        },
        child: const Icon(Icons.add, color: AppColor.appWhite),
      ),
    );
  }
}
