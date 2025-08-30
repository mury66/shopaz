abstract class CommerceFailure {
  String? message;

  CommerceFailure({this.message});
}

class GeneralFailure extends CommerceFailure {
  GeneralFailure({super.message});
}


class WrongPasswordFailure extends CommerceFailure {
  WrongPasswordFailure({super.message});
}


class NetworkFailure extends CommerceFailure {
  NetworkFailure({super.message});
}

