
class SignUpWithEmailAndPasswordFailure {
  final String message;

  const SignUpWithEmailAndPasswordFailure([this.message = "An Unknown error occurred."]);

  factory SignUpWithEmailAndPasswordFailure.code(String code){
    switch (code) {
      case 'weak-password' :
        return const SignUpWithEmailAndPasswordFailure (
            'Pleass enter a stronger password.');
      case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailure (
            'Email is not valid or badly formatted.');
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure (
            'An account already exists for that email.');
      case 'operation-not-allowed':
        return const SignUpWithEmailAndPasswordFailure (
            'Operation is not allowed. Please contact support.');
      case 'user-disabled':
        return const SignUpWithEmailAndPasswordFailure (
            'This user has been disabled. Please contact support for help.');
      case 'invalid-password':
        return const SignUpWithEmailAndPasswordFailure (
            'The provided value for the password user property is invalid. It must be a string with at least six characters.');
      case 'invalid-password-hash':
        return const SignUpWithEmailAndPasswordFailure(
            'The password hash must be a valid byte buffer.');
      case 'invalid-password-salt':
        return const SignUpWithEmailAndPasswordFailure(
            'The password salt must be a valid byte buffer');

      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }
}