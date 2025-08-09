/// Authentication platform enum
enum AuthenticationStrategy {
  /// Firebase login
  firebase('Firebase'),

  /// Superbase login
  superbase('Supabase'),

  /// Rest API login
  restApi('REST API'),

  /// GraphQL login
  graphql('GraphQL');

  const AuthenticationStrategy(this.label);

  /// label for the login platform
  final String label;
}
