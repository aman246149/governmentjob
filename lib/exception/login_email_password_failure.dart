
class LoginWithEmailAndPasswordFailure {
  final String message;

  const LoginWithEmailAndPasswordFailure([this.message = "An Unknown error occurred."]);

  factory LoginWithEmailAndPasswordFailure.fromCode(String code){
    switch (code) {
      case 'invalid-email':
        return const LoginWithEmailAndPasswordFailure (
            'Email is not valid or badly formatted.');
      case 'user-not-found':
        return const LoginWithEmailAndPasswordFailure (
            'There is no existing user record corresponding to the provided identifier.Signup please');
      case 'operation-not-allowed':
        return const LoginWithEmailAndPasswordFailure (
            'The provided sign-in provider is disabled for your Firebase project. Enable it from the Sign-in Method section of the Firebase console.');
      case 'invalid-password':
        return const LoginWithEmailAndPasswordFailure (
            'The provided value for the password user property is invalid. It must be a string with at least six characters.');
      case 'invalid-password-hash':
        return const LoginWithEmailAndPasswordFailure(
            'The password hash must be a valid byte buffer.');
      case 'invalid-password-salt':
        return const LoginWithEmailAndPasswordFailure(
            'The password salt must be a valid byte buffer');
      case 'invalid-credential':
        return const LoginWithEmailAndPasswordFailure(
            'Please enter valid credentials.');

      default:
        return const LoginWithEmailAndPasswordFailure('something went wrong default error returned');
    }
  }
}