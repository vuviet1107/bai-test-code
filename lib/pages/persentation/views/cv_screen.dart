import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:untitled/constants/app_colors.dart';
import 'package:untitled/constants/app_dimens.dart';
import 'package:untitled/constants/app_styles.dart';
import 'package:untitled/custom_view/choose_text_field.dart';
import 'package:untitled/custom_view/container_choose.dart';
import 'package:untitled/custom_view/custom_buttom.dart';
import 'package:untitled/custom_view/pill_text_field.dart';
import 'package:untitled/custom_view/show_time.dart';
import 'package:untitled/custom_view/text_field_none_validate.dart';
import 'package:untitled/custom_view/text_required.dart';
import 'package:untitled/custom_view/widget_circle_choose.dart';
import 'package:untitled/pages/persentation/controllers/sc_controller.dart';
import 'package:untitled/pages/persentation/views/add_document.dart';
import 'package:untitled/shared/utils/convert.dart';
import 'package:untitled/shared/utils/validate.dart';

class CvScreen extends GetView<CvController> {
  const CvScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white,
        ),
        centerTitle: true,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Tạo công việc'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Obx(
            () => Column(
              children: [
                const TextRequired(
                  text: 'Tên công việc',
                  required: true,
                ),
                PillTextField(
                  prefixIcon: const Icon(Icons.menu_book_outlined,
                      color: AppColors.blueColor),
                  formKey: controller.nameJobFormKey,
                  controller: controller.nameJobController,
                  validator: (value) => Validate.validateNotEmpty(
                      value!, 'Tên công việc không được để trống!'),
                  hintText: 'Nhập tên công việc',
                ),
                const SizedBox(height: 10),
                const TextRequired(text: 'Mô tả'),
                TextFieldNoneValidate(
                    controller: controller.detailJobController,
                    hintText: 'Nhập mô tả công việc',
                    prefixIcon: const Icon(Icons.book_sharp,
                        color: AppColors.blueColor)),
                const SizedBox(height: 10),
                const TextRequired(text: 'Thời gian bắt đầu'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                      () => ContainerChoose(
                        title: controller.dayStart.value,
                        onPress: () => showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate:
                              DateTime.now().subtract(const Duration(days: 10)),
                          lastDate: DateTime.now(),
                          confirmText: 'Xác nhận',
                          helpText: 'Chọn ngày',
                          cancelText: 'Hủy',
                          builder: (context, child) {
                            return Theme(
                              data: ThemeData.light().copyWith(
                                primaryColor: AppColors.blueColor,
                                colorScheme: const ColorScheme.light(
                                    primary: AppColors.blueColor),
                                buttonTheme: const ButtonThemeData(
                                    textTheme: ButtonTextTheme.primary),
                              ),
                              child: child!,
                            );
                          },
                        ).then((value) {
                          controller.dayStart.value =
                              ConvertValue.convertUIDate(value!);
                          controller.endStart.value = 'Đến ngày...';
                        }),
                      ),
                    ),
                    TimeTestShow(
                        controller: controller.timeStartController,
                        isTime: true,
                        hintText: 'Thời gian bắt đầu'),
                  ],
                ),
                const SizedBox(height: 10),
                const TextRequired(
                  text: 'Thời gian hoàn thành',
                  required: true,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                      () => ContainerChoose(
                        title: controller.endStart.value,
                        onPress: () => showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateFormat('dd/MM/yyyy')
                              .parse(controller.dayStart.value),
                          lastDate: DateTime(DateTime.now().year + 1),
                          confirmText: 'Xác nhận',
                          helpText: 'Chọn ngày',
                          cancelText: 'Hủy',
                          builder: (context, child) {
                            return Theme(
                              data: ThemeData.light().copyWith(
                                primaryColor: AppColors.blueColor,
                                colorScheme: const ColorScheme.light(
                                    primary: AppColors.blueColor),
                                buttonTheme: const ButtonThemeData(
                                    textTheme: ButtonTextTheme.primary),
                              ),
                              child: child!,
                            );
                          },
                        ).then((value) => controller.endStart.value =
                            ConvertValue.convertUIDate(value!)),
                      ),
                    ),
                    TimeTestShow(
                        controller: controller.timeEndController,
                        isTime: true,
                        hintText: 'Thời gian bắt đầu'),
                  ],
                ),
                const SizedBox(height: 10),
                const TextRequired(text: 'Chủ trì', required: true),
                PillTextField(
                  prefixIcon:
                      const Icon(Icons.person, color: AppColors.blueColor),
                  formKey: controller.hostFormKey,
                  controller: controller.hostController,
                  validator: (value) => Validate.validateNotEmpty(
                      value!, 'Người chủ trì không được để trống!'),
                  hintText: 'Gán @ để chọn tên chủ trì',
                  suffixIcon:
                      const Icon(Icons.search, color: AppColors.blueColor),
                ),
                const SizedBox(height: 10),
                const TextRequired(text: 'Phối hợp'),
                TextFieldNoneValidate(
                  controller: controller.coordinateController,
                  hintText: 'Gán @ để chọn phối hợp',
                  prefixIcon: const Icon(Icons.person_add_alt_1,
                      color: AppColors.blueColor),
                  suffixIcon:
                      const Icon(Icons.search, color: AppColors.blueColor),
                ),
                const SizedBox(height: 10),
                const TextRequired(text: 'Giám sát'),
                TextFieldNoneValidate(
                  controller: controller.monitoringController,
                  hintText: 'Gán @ để chọn giám sát',
                  prefixIcon: const Icon(Icons.person_outline,
                      color: AppColors.blueColor),
                ),
                const SizedBox(height: 10),
                const TextRequired(text: 'Nhóm công việc'),
                ChooseTextField(
                  controller: controller.jobGroupController,
                  hintText: 'Chọn nhóm công việc',
                  onPress: () => showModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      isScrollControlled: true,
                      context: context,
                      builder: (context) => buildSheetGender(context)),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => controller.listDocument.last!.textSymbolsTEC
                                  .text.isNotEmpty &&
                              controller.listDocument.last!.nameTextTEC.text
                                  .isNotEmpty &&
                              controller.listDocument.last!.dayTextTEC.text
                                  .isNotEmpty &&
                              controller
                                  .listDocument.last!.noteTEC.text.isNotEmpty
                          ? controller.addDocument()
                          : null,
                      child: Row(
                        children: const [
                          TextRequired(text: "Văn bản "),
                          Icon(
                            Icons.add_circle,
                            color: AppColors.greenColor,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Obx(
                  () => SizedBox(
                    height: 220 *
                        double.parse(controller.listDocument.length.toString()),
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.listDocument.length,
                        itemBuilder: (context, index) {
                          var education = controller.listDocument[index]!;
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: AddDocument(
                              dayText: education.dayTextTEC,
                              note: education.noteTEC,
                              textSymbols: education.textSymbolsTEC,
                              nameText: education.nameTextTEC,
                              onTap: () {
                                controller.listDocument
                                    .remove(controller.listDocument[index]);
                                if (controller.listDocument.isEmpty) {
                                  controller.addDocument();
                                }
                              },
                            ),
                          );
                        }),
                  ),
                ),
                const SizedBox(height: 10),
                const TextRequired(
                  text: "Tài liệu đính kèm",
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () => controller.upLoadFile(),
                  child: DottedBorder(
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(10),
                      color: controller.checkCv.value
                          ? AppColors.greenColor
                          : AppColors.redColor,
                      strokeWidth: 1,
                      child: SizedBox(
                        height: 40,
                        child: controller.checkCv.value
                            ? Center(
                                child: Text(
                                  controller.cv.value.path.split('/').last,
                                  style: AppStyles.textW400(
                                    context,
                                    size: 16,
                                    color: AppColors.greenColor,
                                  ),
                                ),
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.add,
                                    color: AppColors.redColor,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    'Thêm tài liệu',
                                    style: AppStyles.textW400(
                                      context,
                                      size: 16,
                                      color: AppColors.redColor,
                                    ),
                                  )
                                ],
                              ),
                      )),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomButton(
                      width: AppDimens.width * 0.36,
                      color: AppColors.blueColor,
                      textColor: AppColors.whiteColor,
                      title: 'Tạo cộng việc',
                    ),
                    CustomButton(
                      width: AppDimens.width * 0.36,
                      color: AppColors.greyColor,
                      textColor: AppColors.whiteColor,
                      title: 'Hủy bỏ',
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSheetGender(BuildContext context) => Obx(
        () => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 50,
              width: AppDimens.width,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              decoration: const BoxDecoration(
                color: AppColors.blueColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              ),
              child: Center(
                child: Text(
                  'Chọn giới tính',
                  style: AppStyles.textW500(context,
                      size: 16, color: AppColors.whiteColor),
                ),
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: controller.listGroupJob.length,
                itemBuilder: (context, index) {
                  return Obx(() => WidgetCircleChoose(
                        title: controller.listGroupJob[index]!.name,
                        idList: controller.listGroupJob[index]!.id,
                        id: controller.idGroupJob.value,
                        onPress: () {
                          controller.idGroupJob.value =
                              controller.listGroupJob[index]!.id!;
                          controller.jobGroupController.text =
                              controller.listGroupJob[index]!.name!;
                        },
                      ));
                },
              ),
            ),
          ],
        ),
      );
}
