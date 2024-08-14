part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  const LoginEvent({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'Email': email});
    result.addAll({'Password': password});

    return result;
  }
}

class RegisterEvent extends AuthEvent {
  final String first_Name;
  final String last_Name;
  final String email;
  final String phoneNumber;
  final String password;
  final String confirmPassword;

  const RegisterEvent(
      {required this.first_Name,
      required this.last_Name,
      required this.email,
      required this.phoneNumber,
      required this.password,
      required this.confirmPassword});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'First_Name': first_Name});
    result.addAll({'Last_Name': last_Name});
    result.addAll({'Email': email});
    result.addAll({'PhoneNumber': phoneNumber});
    result.addAll({'Password': password});
    result.addAll({'role': "Boss"});
    result.addAll({'ConfirmPassword': confirmPassword});

    return result;
  }
}
