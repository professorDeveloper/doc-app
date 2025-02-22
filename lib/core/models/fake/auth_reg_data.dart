class AuthLocalData{
  String name;
  String surname;
  String jsshr;
  String borndate;
  String hometown;
  String gender;

  AuthLocalData({required this.name,required this.surname,required this.jsshr,required this.borndate,required this.hometown,required this.gender});

  @override
  String toString() {
    return 'AuthLocalData{name: $name, surname: $surname, jsshr: $jsshr, borndate: $borndate, hometown: $hometown, gender: $gender}';
  }
}
