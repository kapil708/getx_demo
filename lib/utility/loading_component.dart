import 'package:flutter/material.dart';
import 'package:getx_demo/packages/config_package.dart';

class LoadingComponent extends StatelessWidget {
  final Widget child;
  final bool loading;

  const LoadingComponent({Key key, this.child, this.loading = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (loading)
          Center(
            child: Material(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
                    strokeWidth: 3,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
