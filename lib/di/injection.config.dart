// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i6;
import 'package:injectable/injectable.dart' as _i2;

import '../application/auth/auth_bloc.dart' as _i14;
import '../application/login/login_bloc.dart' as _i11;
import '../application/profile/profile_bloc.dart' as _i12;
import '../application/register/register_bloc.dart' as _i13;
import '../domain/auth/auth_repository.dart' as _i9;
import '../domain/profle/profile_repository.dart' as _i7;
import '../infrastructure/auth/firebase_auth_repository.dart' as _i10;
import '../infrastructure/auth/firebase_user_mapper.dart' as _i5;
import '../infrastructure/profile/firebase_profile_repository.dart' as _i8;
import 'registed_modules.dart' as _i15; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModules = _$RegisterModules();
  gh.lazySingleton<_i3.FirebaseAuth>(() => registerModules.auth);
  gh.lazySingleton<_i4.FirebaseFirestore>(() => registerModules.firestore);
  gh.lazySingleton<_i5.FirebaseUserMapper>(() => _i5.FirebaseUserMapper());
  gh.lazySingleton<_i6.GoogleSignIn>(() => registerModules.googleSignIn);
  gh.lazySingleton<_i7.ProfileRepository>(() => _i8.FirebaseProfileRepository(
      get<_i4.FirebaseFirestore>(), get<_i3.FirebaseAuth>()));
  gh.lazySingleton<_i9.AuthRepository>(() => _i10.FirebaseAuthRepository(
      get<_i3.FirebaseAuth>(),
      get<_i6.GoogleSignIn>(),
      get<_i5.FirebaseUserMapper>()));
  gh.factory<_i11.LoginBloc>(() => _i11.LoginBloc(get<_i9.AuthRepository>()));
  gh.lazySingleton<_i12.ProfileBloc>(
      () => _i12.ProfileBloc(get<_i7.ProfileRepository>()));
  gh.factory<_i13.RegisterBloc>(
      () => _i13.RegisterBloc(get<_i9.AuthRepository>()));
  gh.factory<_i14.AuthBloc>(() => _i14.AuthBloc(get<_i9.AuthRepository>()));
  return get;
}

class _$RegisterModules extends _i15.RegisterModules {}
