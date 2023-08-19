void main(){
  String string = '0-1-nova1d-1-nova2-1-nova3u-1-nova4-1-nova54-1-nova6-1-nova7-1-nova8-0-nova9-1-nova10-1-nova11-1-nova12-1-nova13-0-nova14-0-asdf';
  
  var x = RegExp(r'\S(0|1)\-(\w+)').allMatches(string);
  List<Map<String,dynamic>> lll = [];
  for (var element in x) {
    lll.add(
      {
        "status":element.group(1),
        "name":element.group(2),
      }
    );
  }
  print(lll);
}