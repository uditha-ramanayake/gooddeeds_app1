class UserModel {
  final String id;
  final String name;
  final String email;
  final String role;
  final int points;
  final String profileImage;
  final String bio;
  final List<String> followers;
  final List<String> following;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.role = 'volunteer',
    this.points = 0,
    this.profileImage = '',
    this.bio = '',
    this.followers = const [],
    this.following = const [],
  });

  factory UserModel.fromMap(String id, Map<String, dynamic> data) {
    return UserModel(
      id: id,
      name: data['name']?.toString() ?? '',
      email: data['email']?.toString() ?? '',
      role: data['role']?.toString() ?? 'volunteer',
      points: (data['points'] as num?)?.toInt() ?? 0,
      profileImage: data['profileImage']?.toString() ?? '',
      bio: data['bio']?.toString() ?? '',
      followers:
          (data['followers'] as List?)?.map((e) => e.toString()).toList() ??
              const [],
      following:
          (data['following'] as List?)?.map((e) => e.toString()).toList() ??
              const [],
    );
  }

  factory UserModel.fromFirestore(dynamic doc) {
    return UserModel.fromMap(doc.id, doc.data() as Map<String, dynamic>);
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'role': role,
      'points': points,
      'profileImage': profileImage,
      'bio': bio,
      'followers': followers,
      'following': following,
    };
  }

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? role,
    int? points,
    String? profileImage,
    String? bio,
    List<String>? followers,
    List<String>? following,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      role: role ?? this.role,
      points: points ?? this.points,
      profileImage: profileImage ?? this.profileImage,
      bio: bio ?? this.bio,
      followers: followers ?? this.followers,
      following: following ?? this.following,
    );
  }
}

