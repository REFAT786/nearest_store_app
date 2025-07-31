class StoreModel {
  final int id;
  final String name;
  final String title;
  final String slug;
  final double lat;
  final double lng;
  final int isDelivery;
  final String address;
  final String polygon;
  final String storePhone;
  final String stockholderPhone;
  final String storeEmail;
  final String stockholderEmail;
  final String open;
  final String close;
  final String deliveryOpen;
  final String deliveryClose;
  final int deliveryCharge;
  final int status;
  final String createdAt;
  final String updatedAt;

  // Distance field to store calculated distance
  double distance = 0.0;

  StoreModel({
    required this.id,
    required this.name,
    required this.title,
    required this.slug,
    required this.lat,
    required this.lng,
    required this.isDelivery,
    required this.address,
    required this.polygon,
    required this.storePhone,
    required this.stockholderPhone,
    required this.storeEmail,
    required this.stockholderEmail,
    required this.open,
    required this.close,
    required this.deliveryOpen,
    required this.deliveryClose,
    required this.deliveryCharge,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) {
    return StoreModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      title: json['title'] ?? '',
      slug: json['slug'] ?? '',
      lat: double.tryParse(json['lat'].toString()) ?? 0.0,
      lng: double.tryParse(json['lng'].toString()) ?? 0.0,
      isDelivery: json['is_delivery'] ?? 0,
      address: json['address'] ?? '',
      polygon: json['polygon'] ?? '',
      storePhone: json['store_phone'] ?? '',
      stockholderPhone: json['stockholder_phone'] ?? '',
      storeEmail: json['store_email'] ?? '',
      stockholderEmail: json['stockholder_email'] ?? '',
      open: json['open'] ?? '',
      close: json['close'] ?? '',
      deliveryOpen: json['delivery_open'] ?? '',
      deliveryClose: json['delivery_close'] ?? '',
      deliveryCharge: json['delivery_charge'] ?? 0,
      status: json['status'] ?? 0,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'title': title,
      'slug': slug,
      'lat': lat.toString(),
      'lng': lng.toString(),
      'is_delivery': isDelivery,
      'address': address,
      'polygon': polygon,
      'store_phone': storePhone,
      'stockholder_phone': stockholderPhone,
      'store_email': storeEmail,
      'stockholder_email': stockholderEmail,
      'open': open,
      'close': close,
      'delivery_open': deliveryOpen,
      'delivery_close': deliveryClose,
      'delivery_charge': deliveryCharge,
      'status': status,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}