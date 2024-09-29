import 'package:call/controller/usercontroller.dart';
import 'package:call/screen/editiondetailScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  UserController userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (userController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: userController.editions.length,
            itemBuilder: (context, index) {
              final edition = userController.editions[index];
              return InkWell(
                onTap: () {
                  // Navigate to the detail screen with the edition data
                  Get.to(() => EditionDetailScreen(
                        name: edition.name,
                        language: edition.language,
                        type: edition.type,
                        source: edition.source ?? 'N/A',
                        comments: edition.comments ?? 'No comments available',
                        link: edition.link ?? 'No link available',
                      ));
                },
                child: Card(
                  elevation: 2,
                  child: ListTile(
                    title: Text(edition.name),
                    subtitle: Text('${edition.language} (${edition.type})'),
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
