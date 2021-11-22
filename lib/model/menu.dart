

class MenuItem{
  final int index;
final int menuCode;
final String menuName;
 bool isSelected;
 String? bankCode;
 String? imageUri;


  MenuItem(this.index,this.menuCode,this.menuName,{this.isSelected=false,this.imageUri,this.bankCode});

@override
  String toString() {
    return 'MenuItem{menuCode: $menuCode, menuName: $menuName, isSelected: $isSelected}';
  }
}