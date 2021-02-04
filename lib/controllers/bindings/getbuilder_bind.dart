import 'package:get/get.dart';
import 'package:getx_demo/controllers/getbuilder_controller.dart';

class GetBuildBind extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<GetBuilderController>(() => GetBuilderController());
  }
}
