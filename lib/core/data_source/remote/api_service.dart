import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:wallet/features/home/data/responses/user_response.dart';
import 'package:wallet/features/send_money/data/requests/update_balance_request.dart';
import 'package:wallet/features/transactions/data/responses/transaction_response.dart';

import '../../../features/send_money/data/requests/send_money_request.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET("users/1")
  Future<UserResponse> userService();
  
  @POST("transactions")
  Future<void> sendMoneyService(@Body() SendMoneyRequest request);

  @PATCH("users/1")
  Future<void> updateBalanceService(@Body() UpdateBalanceRequest request);

  @GET("transactions")
  Future<List<TransactionResponse>> transactionsService();

}