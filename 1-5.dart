typedef MapDict = Map<String, String>;

class Dictionary {
  List<MapDict> arr = [];
  Dictonary() {
    // arr = [];
  }

  void add(String a, String b) {
    MapDict voca = {"term": a, "definition": b};
    arr.add(voca);
    print("{$a : $b} added.");
  }

  void get(String term) {
    var def;
    arr.forEach((voca) => {
          if (voca["term"] == term) {def = voca["definition"]}
        });
    print("Definition of $term : $def");
  }

  void delete(String term) {
    arr.removeWhere((voca) => voca["term"] == term);
    print("$term deleted.");
  }

  void update(String a, String b) {
    MapDict newVoca = {"term": a, "definition": b};
    arr.forEach((oldVoca) => {
          if (oldVoca["term"] == newVoca["term"])
            {if (b != null) oldVoca["definition"] = b}
        });
    print("{$a : $b} updated.");
  }

  void showAll() {
    print("--------Dictionary--------");
    arr.forEach((voca) => print(voca));
    print("--------------------------");
  }

  void count() {
    var count = arr.length;
    print("whole length is $count.");
  }

  void upsert(String a, String b) {
    var isExist = arr.any((voca) => a == voca["term"]);
    if (isExist) {
      print("the word exists, so update");
      update(a, b);
    } else {
      print("the word doesn't exist, so add");
      add(a, b);
    }
  }

  void exists(String term) {
    var isExist = arr.any((voca) => term == voca["term"]);
    print(isExist ? "$term exists." : "$term doesn't exist.");
  }

  void bulkAdd(List<MapDict> newArr) {
    newArr.forEach((voca) => arr.add(voca));
    print("bulk-add complete");
  }

  void bulkDelete(List<String> delArr) {
    delArr.forEach(
        (delTerm) => {arr.removeWhere((voca) => delTerm == voca["term"])});
    print("bulk-delete complete");
  }
}

void main() {
  var d = Dictionary();
  d.add("사자", "Lion");
  d.add("호랑이", "타이거");
  d.add("고양이", "캣");
  d.showAll();
  d.get("사자");
  d.delete("사자");
  d.showAll();
  d.update("호랑이", "Tiger");
  d.showAll();
  d.count();
  d.upsert("고양이", "cat");
  d.showAll();
  d.upsert("상어", "shark");
  d.showAll();
  d.exists("사자");
  d.bulkAdd([
    {"term": "김치", "definition": "대박이네~"},
    {"term": "아파트", "definition": "비싸네~"}
  ]);
  d.showAll();
  d.bulkDelete(["김치", "아파트"]);
  d.showAll();
}
