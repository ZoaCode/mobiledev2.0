import 'package:kab1_dart_excercise/kab1_dart_excercise.dart' as kab1_dart_excercise;
enum Status{
  none, running,stopped,paused
}


class Book{
  String author;
  String title;
  String description;
  Publisher publisher;

  Book({this.author, this.title,this.description,this.publisher});

  Book.fromMap(Map<String, dynamic> data){
    author = data['author'];
    title =data['title'];
    description = data['description'];
    publisher = data['publisher'];
  }
  Map<String,dynamic>toMap(){
    return {
      'author':author,
      'title':title,
      'description':description,
      'publisher':publisher
    };
  }
  String toString(){
    return '{${author},${title},${publisher}}';
  }
}
enum Publisher{Wrox, McGraw,Pearson}
void main() {
  // print(Status.values);
  // Status.values.forEach((v)=>print('value:$v,index:${v.index}'));
  // print('running:${Status.running},${Status.running.index}');
  // print('running index: ${Status.values[1]}');

  
  // var mjobs = {'name':'Johnny','occupation':'gardener'};
  // print(mjobs);

  // var mfruits = {1:'Apple',2:'Orange',3:'Grape'};
  // print(mfruits);

  // print('There are ${mfruits.length} elements in the map.');

  // mjobs['age'] = '42';
  // print(mjobs);

  // mfruits[3] = 'Banana';
  // print(mfruits);

  // print(mfruits.containsKey(3));
  // print(mfruits.containsValue('Grape'));


  // mfruits.forEach((key, value) { 
  //   print('{key:$key,value:$value}');
  // });

  // for(var key in mfruits.keys){print(key);}
  // for(var value in mfruits.values){print(value);}

  // mfruits.remove(1);
  // print(mfruits);

  // mjobs.clear();


  var bookList = <Book>[];

  var b1 = Book(
    author:'Marco',
    title: 'Flutter App Development',
    description: 'A book on flutter',
    publisher: Publisher.Wrox  
  );
  bookList.add(b1);
  var b2 = Book.fromMap({
    'Author':'Wayne',
    'title':'Dart Programming',
    'description':'A book on Dart',
    'publisher':Publisher.values[1]
  });

  bookList.add(b2);

  print('bookList: $bookList');


  var bookMap1 = b1.toMap();
  bookMap1.forEach((key,value){
    print('Book1:Key = $key,Value = $value');
  });

  var bookMap2 = b2.toMap();
  bookMap2.forEach((key,value){
    print('Book2:Key = $key,Value = $value');
  });

  print('Book2\'s publisher is ' + bookList[1].publisher.toString());

  print('Book2\'s publisher is ' + bookList[1].publisher.toString().split('.').last);

}

