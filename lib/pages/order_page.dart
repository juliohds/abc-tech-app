import 'package:abctechapp/controller/order_controller.dart';
import 'package:abctechapp/model/assistance.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class OrderPage extends GetView<OrderController> {
  const OrderPage({Key? key}) : super(key: key);

  exitApp() {
    Get.toNamed("/");
  }

  Widget renderAssists(List<Assistance> assists) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: assists.length,
        itemBuilder: (context, index) =>
            ListTile(title: Text(assists[index].name)));
  }

  String message(bool isValid) {
    return isValid ? 'Selecione os serviços a serem prestados' : 'Serviços selecionados:';
  }

  Widget renderFromScreen(BuildContext context) {
    return Center(child: Align(alignment: Alignment.center,
        child: SingleChildScrollView(
        child: Form(
        key: controller.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(children: const [
              Expanded(
                  child: Text(
                'Preencha o fomulário de ordem de serviço',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ))
            ]),
            Obx(() {
              var enabled = controller.screenState.value == OrderState.creating;
              return TextFormField(
                controller: controller.operatorIdController,
                enabled: enabled,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.number,
                decoration:
                    const InputDecoration(labelText: "Código do prestador"),
                textAlign: TextAlign.center,
              );
            }),
            Row(children: [
              Expanded(
                  child: Padding(
                      padding: EdgeInsets.only(top: 25, bottom: 25),
                      child: Obx((() {
                            return Text(
                                message(!controller.selectedAssistances.isNotEmpty),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 16.0, fontWeight: FontWeight.bold),
                              );
                      })))),
              Ink(
                  decoration: const ShapeDecoration(
                      shape: CircleBorder(), color: Colors.black87),
                  child: IconButton(
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      onPressed: () => controller.editServices()),
                  width: 40,
                  height: 40)
            ]),
            Obx(
              () => renderAssists(controller.selectedAssistances),
            ),
            Row(
              children: [
              Expanded(
                  child: ElevatedButton(onPressed: () {
                FocusScope.of(context).unfocus();
                controller.finishStartOrder();
              }, child: Obx((() {
                if (controller.screenState.value == OrderState.creating) {
                  return const Text("Iniciar serviço");
                } else {
                  return const Text("Finalizar serviço");
                }
              }))))
            ]),
          ],
        ),
      ),
    ),),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Ordem de serviço"), backgroundColor: Colors.black87,
          actions: [IconButton(
            icon: const Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            onPressed: exitApp,
          ),
          ]),
        body: Container(
            constraints: const BoxConstraints(maxWidth: 500, maxHeight: 500),
            padding: const EdgeInsets.all(10.0),
            child: controller.obx((state) => renderFromScreen(context),
                onLoading: const Center(child: CircularProgressIndicator()),
                onError: (error) => Text(error.toString()))));
  }
}
