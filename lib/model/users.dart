import 'projects.dart' show projectMocks, Project;

class User {
  final String id;
  final String name;
  final String image;
  List<Project> supportedProjects;
  final String city;
  final String country;
  final String address;
  final String role;

  User({
    this.id,
    this.name,
    this.image,
    this.supportedProjects,
    this.address,
    this.city,
    this.country,
    this.role = "Developer",
  });
}

List<User> userMocks = [
  User(
      id: '1',
      name: 'Konstantin',
      image: 'assets/kkjdprofile.jpg',
      address: 'Stahnsdorfer Str. 12',
      city: 'Potsdam',
      country: 'Germany',
      role: "Working student",
      supportedProjects: projectMocks),
  User(
      id: '2',
      name: 'Rebecca',
      image: 'assets/rebecca.jpg',
      address: 'Charlottenweg 23a',
      city: 'Cuxhaven',
      country: 'Germany',
      role: "Fullstack Engineer",
      supportedProjects: projectMocks),
  User(
      id: '3',
      name: 'Hendrik',
      image: 'assets/hendrik.jpg',
      role: "Accountant",
      supportedProjects: projectMocks),
  User(
      id: '4',
      name: 'Mehdi',
      image: 'assets/mehdi.jpg',
      role: "Fullstack Engineer",
      supportedProjects: projectMocks),
  User(
      id: '5',
      name: 'Pascal',
      image: 'assets/pascal.jpg',
      role: "Database Engineer",
      supportedProjects: projectMocks),
  User(
      id: '6',
      name: 'Fritz',
      image: 'assets/fritz.jpg',
      role: "Project Lead",
      supportedProjects: projectMocks),
  User(
      id: '7',
      name: 'Phil',
      image: 'assets/phil.jpg',
      role: "UX Designer",
      supportedProjects: projectMocks),
  User(
      id: '8',
      name: 'Sap',
      image: 'assets/sap.png',
      role: "Corporate Challenge",
      supportedProjects: projectMocks),
];
