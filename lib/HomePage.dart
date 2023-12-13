import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://utillz1.web3bharat.xyz/'));
    return Scaffold(
        //drawer: AppDrawer(),
        // appBar: AppBar(
        //   elevation: 2,
        //   backgroundColor: primaryColor,
        //   title: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Obx(() {
        //         return Text(
        //           //AppConstant.appName,
        //           getTitle(controller.currentIndex.value),
        //           style: const TextStyle(color: Colors.white, fontSize: 20),
        //         );
        //       }),
        //       const SizedBox(height: 5),
        //       Obx(() {
        //         return Text(
        //           profileController.userName.value,
        //           style: const TextStyle(
        //               fontSize: 12, color: Colors.white),
        //         );
        //       })
        //     ],
        //   ),
        //   leading: IconButton(
        //     icon: const FaIcon(FontAwesomeIcons.alignLeft),
        //     onPressed: () => {_scaffoldKey.currentState!.openDrawer()},
        //   ),
        //   actions: [
        //     IconButton(
        //         onPressed: () => {Get.toNamed("/patient-message")},
        //         icon: const Icon(
        //           Icons.notifications,
        //           color: Colors.white,
        //         )),
        //     IconButton(
        //         onPressed: () => {},
        //         icon: const Icon(
        //           Icons.exit_to_app,
        //           color: Colors.white,
        //         ))
        //   ],
        // ),
        body: WebViewWidget(controller: controller),
    );
  }

}