import 'package:breaking_bad_app/models/base_models/base_model.dart';
import 'package:dartz/dartz.dart';

class BaseResponse<T extends BaseModel> {
  final int? statusCode;
  final String? message;
  final bool? success;
  final Either<T?, List<T>> data;

  BaseResponse({
    this.statusCode,
    this.message,
    this.success,
    required this.data,
  });

  factory BaseResponse.fromJson(json, BaseModel model) => BaseResponse(
        statusCode: json["statusCode"],
        message: json["message"],
        success: json["success"],
        data: json["data"] == null
            ? const Left(null)
            : json["data"] is List
                ? Right(List<T>.from(json["data"]
                        .map((e) => model.fromJson(e as Map<String, dynamic>)))
                    .toList())
                : Left((model.fromJson(json["data"])) as T),
      );

  Map<String, dynamic> toMap() => {
        "statusCode": statusCode,
        "message": message,
        "success": success,
        "data": data.fold(
          (l) => l?.toJson(),
          (r) => r.map((i) => i.toJson()).toList(),
        ),
      };
}
