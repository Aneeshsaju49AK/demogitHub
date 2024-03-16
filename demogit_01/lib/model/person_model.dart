class Person {
  final int id;
  final String name;
  final int age;
  final String place;
  final int mobileNumber;
  final String email;
  final String? profilePicturePath;

  Person({
    required this.id,
    required this.name,
    required this.age,
    required this.place,
    required this.mobileNumber,
    required this.email,
    this.profilePicturePath,
  });
}
