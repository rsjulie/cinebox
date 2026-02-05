// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:cinebox/config/result/result.dart';

import './local_storage_service.dart';

class LocalStorageServiceImpl implements LocalStorageService {
  final FlutterSecureStorage _flutterSecureStorage;
  LocalStorageServiceImpl({
    required FlutterSecureStorage flutterSecureStorage,
  }) : _flutterSecureStorage = flutterSecureStorage;

  @override
  Future<Result<String>> getIdToken() async {
    final token = await _flutterSecureStorage.read(key: 'idToken');
    if (token != null) {
      return Success(token);
    }
    return Failure(Exception('Token not found'));
  }

  @override
  Future<Result<Unit>> removeIdToken() async {
    await _flutterSecureStorage.delete(key: 'idToken');
    return successOfUnit();
  }

  @override
  Future<Result<Unit>> saveIdToken(String token) async {
    await _flutterSecureStorage.write(key: 'idToken', value: token);
    return successOfUnit();
  }
}
