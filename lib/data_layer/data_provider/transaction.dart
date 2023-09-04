import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:marlo/data_layer/data_provider/auth.dart';
import 'package:marlo/data_layer/data_provider/refresh.dart';
import 'package:marlo/data_layer/model/error_model/error.dart';

class TransactionsImp {
  Future<Either<ErrorModel,Response>> getAllTransactions(String access) async {
    try {
      Dio dio = Dio();
      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            options.headers['Authorization'] = 'Bearer $access';
            options.headers['authtoken'] = access;
            return handler.next(options);
          },
          onError: (e, handler) async {
            if (e.response!.statusCode == 401) {
              final newAccessToken = await AuthUser().loginUser();
              if (newAccessToken.isRight) {
                e.requestOptions.headers['Authorization'] =
                    'Bearer ${newAccessToken.right}';

                return handler.resolve(await dio.fetch(e.requestOptions));
              } else {
                return handler.next(e);
              }
            }

            return handler.next(e);
          },
         
        ),
      );
      Response response = await dio.get(
          '');
     return Right(response);
    } on DioException catch (e) {
     return Left(ErrorModel(error: e.message.toString()));
    } catch (e) {
     return Left(ErrorModel(error: e.toString()));
    }
  }
}
