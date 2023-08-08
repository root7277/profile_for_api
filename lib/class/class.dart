class Model {
  final String firstName;
  final String lastName;
  final String email;
  final String imageU;

  Model({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.imageU,
  });

  factory Model.fromJson(Map json){
    return Model(
      firstName: json['results'][0]['name']['first'], 
      lastName: json['results'][0]['name']['last'], 
      email: json['results'][0]['email'],
      imageU: json['results'][0]['picture']['large']
    );
  }
}