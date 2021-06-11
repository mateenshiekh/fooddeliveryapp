class MenuItem {
  String type;
  int count;
  double rate;

  MenuItem({this.count, this.type, this.rate});

  Map<String, dynamic> toJson() {
    var map = Map<String, dynamic>();
    map['type'] = type;
    map['count'] = count;
    map['unitRate'] = rate;
    return map;
  }
}

class Order {
  String userId;
  String name;
  String address;
  String mobileNumber;
  String email;
  String instruction;
  List<MenuItem> orderItems;
  double total;
  double charges;
  double totalAmount;

  Order(
      {this.email,
      this.userId,
      this.address,
      this.totalAmount,
      this.instruction,
      this.mobileNumber,
      this.name,
      this.orderItems,
      this.total,
      this.charges});

  Order.fromJson(Map<String, dynamic> json) {}

  Map<String, dynamic> toJson() {
    var map = Map<String, dynamic>();
    map['userId'] = userId;
    map['name'] = name;
    map['address'] = address;
    map['mobileNumber'] = mobileNumber;
    map['email'] = email;
    map['instruction'] = instruction;
    map['total'] = total;
    map['totalAmount'] = totalAmount;
    map['charges'] = charges;
    map['orderItems'] =
        orderItems.map<Map<String, dynamic>>((e) => e.toJson()).toList();

    return map;
  }
}
