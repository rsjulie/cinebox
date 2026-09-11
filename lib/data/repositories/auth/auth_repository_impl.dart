// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:cinebox/data/exceptions/data_exception.dart';

import 'package:cinebox/config/result/result.dart';
import 'package:cinebox/data/services/auth/auth_service.dart';
import 'package:cinebox/data/services/google_signin/google_signin_service.dart';
import 'package:cinebox/data/services/local_storage/local_storage_service.dart';
import 'package:dio/dio.dart';

import './auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final LocalStorageService _localStorageService;
  final GoogleSignInService _googleSignInService;
  final AuthService _authService;
  AuthRepositoryImpl({
    required LocalStorageService localStorageService,
    required GoogleSignInService googleSignInService,
    required AuthService authService,
  }) : _localStorageService = localStorageService,
       _googleSignInService = googleSignInService,
       _authService = authService;

  @override
  Future<Result<bool>> isLogged() async {
    final resultToken = await _localStorageService.getIdToken();
    return switch (resultToken) {
      Success<String>() => Success(true),
      Failure<String>() => Success(false),
    };
  }

  @override
  Future<Result<Unit>> signIn() async {
    final result = await _googleSignInService.signIn();

    switch (result) {
      case Success<String>(:final value):
        try {
          await _localStorageService.saveIdToken(value);
          await _authService.auth();
          return successOfUnit();
        } on DioException catch (e, s) {
          log(
            'Erro ao autenticar usuário no backend.',
            name: 'AuthRepository',
            error: e,
            stackTrace: s,
          );
          return Failure(DataException(message: 'Erro ao realizar login no backend.'));
        }

      case Failure<String>(:final error):
        log(
          'Erro ao realizar login com o Google.',
          name: 'AuthRepository',
          error: error,
        );

        return Failure(
          DataException(message: 'Erro ao realizar login com o Google.'),
        );
    }
  }

  @override
  Future<Result<Unit>> signOut() async {
    final result = await _googleSignInService.signOut();

    switch (result) {
      case Success<Unit>():
        final removeResult = await _localStorageService.removeIdToken();
        switch (removeResult) {
          case Success<Unit>():
            return successOfUnit();
          case Failure<Unit>(:final error):
            log('Erro ao realizar logout ID Token.', error: error);
            return Failure(error);
        }
      case Failure<Unit>(:final error):
        log('Erro ao realizar signOut.', error: error);
        return Failure(error);
    }
  }
}
