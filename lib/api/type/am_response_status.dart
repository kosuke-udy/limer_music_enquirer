import 'package:fpdart/fpdart.dart';

enum AmResponseStatus {
  unknownStatusCode(0),
  noStatus(1),
  clientNotReady(2),
  ok(200),
  created(201),
  accepted(202),
  noContent(204),
  movedPermanently(301),
  found(302),
  badRequest(400),
  unauthorized(401),
  forbidden(403),
  notFound(404),
  methodNotAllowed(405),
  conflict(409),
  payloadTooLarge(413),
  uriTooLong(414),
  tooManyRequests(429),
  internalServerError(500),
  notImplemented(501),
  serviceUnavailable(503);

  final int code;

  const AmResponseStatus(this.code);

  factory AmResponseStatus.fromCode(int? code) {
    return code.toOption().match(
      () => AmResponseStatus.noStatus,
      (value) {
        try {
          final ret =
              AmResponseStatus.values.firstWhere((e) => e.code == value);
          return ret;
        } catch (e) {
          print(e.toString());
          return AmResponseStatus.unknownStatusCode;
        }
      },
    );
  }
}
