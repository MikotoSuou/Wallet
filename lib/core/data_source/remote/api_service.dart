import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:wallet/features/home/data/responses/user_response.dart';

import '../../../features/send_money/data/requests/send_money_request.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET("user")
  Future<UserResponse> userService();
  
  @POST("transactions")
  Future<void> sendMoneyService(@Body() SendMoneyRequest request);

  // @GET("products/{PRODUCT_ID}")
  // Future<HttpResponse<ProductDetailResponse>> productDetailService(
  //   @Path("PRODUCT_ID") String productId,
  // );
}