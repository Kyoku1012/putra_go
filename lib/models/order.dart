class Order {
  final String email;
  final String name;
  final String time;
  final String route;
  final String start;
  final int pax;
  final String price;

  Order({
    required this.name,
    required this.email,
    required this.time,
    required this.route,
    required this.start,
    required this.pax,
    required this.price,
  });
}

// Example list of orders
List<Order> orders = [
  Order(
    name: 'Miki',
    email: 'abc@gmail.com',
    time: '24-1-1 07:40 AM',
    route: 'Within UPM',
    start: 'FSKTM',
    pax: 2,
    price: '5',
  ),

  Order(
    name: 'Aqil',
    email:'2323@upm.com',
    time: '24-1-2 08:40 AM',
    route: 'Within UPM',
    start: 'K17',
    pax: 2,
    price: '5',
  ),
  // Add more orders here
];
