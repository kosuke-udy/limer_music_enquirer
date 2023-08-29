import 'package:fpdart/fpdart.dart';

enum ApResponseStatus {
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

  const ApResponseStatus(this.code);

  factory ApResponseStatus.fromCode(int? code) {
    return code == null
        ? ApResponseStatus.noStatus
        : ApResponseStatus.values.firstWhere(
            (e) => e.code == code,
            orElse: () => ApResponseStatus.unknownStatusCode,
          );
  }
}
