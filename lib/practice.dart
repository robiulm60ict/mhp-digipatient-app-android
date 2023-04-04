void main(){

  num a = 10;
  int b = 10;
  List<num> numb = [1,2,3,4,10,10];
  numb = numb.where((element) => element == b).toList();
  print(numb );

}