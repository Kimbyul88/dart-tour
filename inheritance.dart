class Human {
  final String name;
  Human(this.name);
  void sayHello() {
    print("my name is $name");
  }
}

mixin Pet {
  bool hasPet = true;
  void myPet() {
    print("I have pet!");
  }
}

class Adult extends Human with Pet {
  int age;
  String status;
  Adult({required String name, required this.age})
      : this.status = "Adult",
        super(name);
  @override
  void sayHello() {
    super.sayHello();
    print("my age is $age and I'm $status");
    super.myPet();
  }
}

void main() {
  var person1 = Adult(
    name: "MJ",
    age: 30,
  );
  // var person2 =
  person1.sayHello();
  if (person1.hasPet) {
    print("I like animals");
  }
}
