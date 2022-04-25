import 'package:abctechapp/controller/initial_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InitialPage extends GetView<InitialController> {
  const InitialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: Center(
          child: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Ink(
                        decoration: const ShapeDecoration(
                        shape: CircleBorder(), color: Colors.black87),
                        child: IconButton(
                        icon: const Icon(
                          Icons.account_box_sharp,
                          size: 80,
                          color: Colors.white,
                        ),
                        onPressed: () => controller.goToOrders()),
                        width: 200,
                        height: 200
                      ),
                      Row(
                        children: const [Padding(padding: EdgeInsets.only(top: 25), child: Text('Seja Bem vindo ao nosso sistema!', style: const TextStyle(
                                    fontSize: 16.0, fontWeight: FontWeight.bold),),)],
                      ),
                      Row(
                        children: const [Padding(padding: EdgeInsets.only(top: 25, bottom: 25), child: Text('clique no botão para iniciar.'),)],
                      ),
                    ],
                  ),
                ],
              ),
            ]),
        ),
      ),
    ));
  }
}
