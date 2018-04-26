class Category {
  final int id;
  final String name;
  final List<int> faculties;

  const Category(this.id, this.name, this.faculties);

  @override
  bool operator ==(Object other) => identical(this, other) || other is Category && runtimeType == other.runtimeType && id == other.id && name == other.name;

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
