import 'package:get/get.dart';

import '../../api_constants.dart';

class BaseProvider extends GetConnect {
  @override
  void onInit() {
    // httpClient.baseUrl = ApiConstants.baseUrl;
    // httpClient.addAuthenticator(authInterceptor);
    // httpClient.addRequestModifier(requestInterceptor);
    // httpClient.addResponseModifier(responseInterceptor);
  }
}
