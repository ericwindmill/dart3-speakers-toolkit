sealed class User {
  final String username;
  final String location;

  User(this.username, this.location);
}

class NormalUser extends User {
  NormalUser(super.username, super.location);
}

class AdminUser extends User {
  AdminUser(super.username, super.location);
}

class PaidUser extends User {
  PaidUser(super.username, super.location);
}
