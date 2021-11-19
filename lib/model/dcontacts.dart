
class NContacts{
  NContacts(this.other_name,this.other_mobile,this.last_time);
  String? other_name  ;
  String? other_mobile;
  String? last_time   ;

  @override
  String toString() {
    return 'NContacts{other_name: $other_name, other_mobile: $other_mobile, last_time: $last_time}';
  }
}