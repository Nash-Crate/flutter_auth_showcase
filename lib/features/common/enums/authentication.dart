/// Authentication platform enum
enum AuthenticationStrategy {
  /// Firebase login
  firebase('Firebase'),

  /// Superbase login
  superbase('Supabase', hasImplemented: false),

  /// Rest API login
  restApi('REST API', hasImplemented: false),

  /// GraphQL login
  graphql('GraphQL', hasImplemented: false);

  const AuthenticationStrategy(this.label, {this.hasImplemented = true});

  /// label for the login platform
  final String label;

  /// Whether the authentication strategy is implemented
  final bool hasImplemented;
}
