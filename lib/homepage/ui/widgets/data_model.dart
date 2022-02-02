class Data {
  final String category;
  final String client;
  final String colors;
  final String description;
  final String stock;
  final String status;
  final String createdOn;
  final String id;
  final String itemName;
  final String price;
  final String sizes;
  final String video;
  final String promoDescription;
  final String promoId;
  final String promoValue;
  final String promoItemId;
  final String promoDate;
  final String promoStatus;
  final String likes;
  final String likes2;
  final String gallery;
  final String urlImage;

  const Data({
    required this.category,
    required this.client,
    required this.colors,
    required this.description,
    required this.stock,
    required this.status,
    required this.createdOn,
    required this.id,
    required this.itemName,
    required this.price,
    required this.sizes,
    required this.video,
    required this.promoDescription,
    required this.promoId,
    required this.promoValue,
    required this.promoItemId,
    required this.promoDate,
    required this.promoStatus,
    required this.likes,
    required this.likes2,
    required this.gallery,
    required this.urlImage,
  });

  static Data fromJson(json) => Data(
        category: json['categoria'],
        client: json['cliente'],
        colors: json['colores'],
        description: json['descripcion'],
        stock: json['disponible'],
        status: json['estado'],
        createdOn: json['fecha_creacion'],
        id: json['id'],
        itemName: json['nombre'],
        price: json['precio'],
        sizes: json['tallas'],
        video: json['video'],
        promoDescription: json['descripcion_promo'],
        promoId: json['id_promocion'],
        promoValue: json['valor_promo'],
        promoItemId: json['id_producto_promo'],
        promoDate: json['fecha_promo'],
        promoStatus: json['estado_promo'],
        likes: json['likes'],
        likes2: json['megusta'],
        gallery: json['galeria'],
        urlImage: json['imagen'],
      );
}
