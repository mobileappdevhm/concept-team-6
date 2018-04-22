class Course{
  String _title;
  String _lecturer;
  String _description;
  num _courseID;
  DateTime _begin;
  DateTime _end;
  bool bookmarked;

  Course(String title, String lecturer, String description, DateTime begin, DateTime end){
    this._title = title;
    this._lecturer = lecturer;
    this._description = description;
    this._begin = begin;
    this._end = end;
    this._courseID = this.hashCode;
  }

  num getID(){
    return _courseID;
  }
}