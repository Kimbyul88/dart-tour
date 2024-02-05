//중괄호로 required 하기
String sayHello1({
  required String name,
  required int age,
  required String country,
}) {
  return "name:$name, age:$age, country:$country";
}

//중괄호로 initialization하기
String sayHello2({
  String name = "Anonymous",
  int age = 99,
  String country = "Earth",
}) {
  return "name:$name, age:$age, country:$country";
}

//대괄호로 nullsafety, 초기화까지 하기
String sayHello3(String name, int age, [String? country = "earth"]) {
  return "name:$name, age:$age, country:$country";
}

//? ?? ??=
String capitalizeString1(String? name) =>
    name != null ? name.toUpperCase() : "ANON1";
String capitalizeString2(String? name) => name?.toUpperCase() ?? "ANON2";
String capitalizeString3(String? name) {
  name ??= "ANON3";
  return name;
}

void main() {
  print(sayHello1(name: "star", age: 23, country: "korea"));
  print(sayHello2(age: 23));
  print(sayHello3("byul", 23));
  print(capitalizeString1(null));
  print(capitalizeString2(null));
  print(capitalizeString3(null));
}
