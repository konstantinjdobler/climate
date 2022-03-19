class Project {
  final String id;
  final String name;
  final String image;

  const Project({
    this.name,
    this.image,
    this.id,
  });
}

List<Project> projectMocks = [
  const Project(
    id: '1q231',
    name: 'Plant for the Planet',
    image: 'assets/projects/plant.png',
  ),
  const Project(
    id: '1q232311',
    name: 'Climate Trade',
    image: 'assets/projects/climate_trade.jpeg',
  ),
  const Project(
    id: '1q2311',
    name: 'WWF',
    image: 'assets/projects/wwf.jpeg',
  ),
];
