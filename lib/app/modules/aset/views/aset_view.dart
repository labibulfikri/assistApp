import 'package:assist_apps/app/modules/aset/models/aset_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/aset_controller.dart';

class AsetView extends GetView<AsetController> {
  AsetView({Key? key}) : super(key: key);
  final controller = Get.put(AsetController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue.shade50,
        // appBar: AppBar(
        //   title: const Text('List Aset '),
        //   centerTitle: true,
        //   elevation: 0,
        // ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Data Aset ",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0c2568),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Icon(Icons.search),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Cari ....")
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: Get.width,
                  height: 500,
                  child: FutureBuilder<List<AsetModal>>(
                    future: controller.GetAset(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      if (!snapshot.hasData) {
                        return const Center(
                          child: Text("Tidak ada data ..."),
                        );
                      }

                      return Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            AsetModal asetM = snapshot.data![index];

                            return Column(
                              children: [
                                ListTile(
                                  leading: Text("${index + 1}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey.shade700)),
                                  title: Text(
                                    "${asetM.registerBaru} ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade700),
                                  ),
                                  subtitle: Text("${asetM.lokasiPencatatan}"),
                                  // onTap: () {
                                  //   // Get.to(DetailPageView(),
                                  //   //     arguments: "${jadwal.perkaraId}");
                                  //   Get.toNamed(Routes.DETAIL_PAGE,
                                  //       arguments: "${aset.perkaraId}");
                                  // },
                                ),
                                Divider(
                                  color: Colors.grey,
                                ),
                              ],
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
