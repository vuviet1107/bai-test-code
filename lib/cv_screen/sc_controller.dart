import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/base/base_controller.dart';
import 'package:untitled/model.dart';

class CvController extends BaseController {
  //Khởi tạo form key cùng controller cho textfield
  final GlobalKey<FormState> nameJobFormKey = GlobalKey();
  final GlobalKey<FormState> hostFormKey = GlobalKey();

  late TextEditingController nameJobController,
      detailJobController,
      coordinateController,
      monitoringController,
      jobGroupController,
      timeStartController,
      dayStartController,
      dayEndController,
      timeEndController,
      hostController;

  RxBool checkDrop = false.obs;
  RxInt indexDrop = 1.obs;

  RxString idGroupJob = ''.obs;
  RxString dayStart = 'dd:mm:yyyy'.obs;
  RxString endStart = 'dd:mm:yyyy'.obs;

  RxList<Model?> listGroupJob = <Model?>[
    Model(id: '0', name: 'Nhóm A'),
    Model(id: '1', name: 'Nhóm B'),
    Model(id: '2', name: 'Nhóm C'),
    Model(id: '3', name: 'Nhóm D'),
  ].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    nameJobController = TextEditingController();
    detailJobController = TextEditingController();
    hostController = TextEditingController();
    monitoringController = TextEditingController();
    coordinateController = TextEditingController();
    jobGroupController = TextEditingController();
    timeStartController = TextEditingController();
    timeEndController = TextEditingController();
    dayStartController = TextEditingController();
    dayEndController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    nameJobController.dispose();
    detailJobController.dispose();
    hostController.dispose();
    monitoringController.dispose();
    coordinateController.dispose();
    jobGroupController.dispose();
    timeStartController.dispose();
    timeEndController.dispose();
    dayStartController.dispose();
    dayEndController.dispose();
  }

  Rx<File> cv = File('').obs;
  RxBool checkCv = false.obs;

  // Tải Cv ứng viên
  upLoadFile() async {
    final file = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['doc', 'docx', 'pdf', 'jpg', 'jpeg', 'png', 'gif']);
    if (file != null) {
      cv.value = File(file.paths[0]!);
      checkCv.value = true;
    }
  }
}
