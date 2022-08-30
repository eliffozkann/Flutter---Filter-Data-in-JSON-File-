class Hayvanlar {
  final String? isim, image, turu, aciklama;

  Hayvanlar({this.isim, this.image, this.turu, this.aciklama});

  factory Hayvanlar.fromJson(Map<String, dynamic> json) => Hayvanlar(
        isim: json["isim"],
        image: json["image"],
        turu: json["turu"],
        aciklama: json["aciklama"],
      );

  Map<String, dynamic> toJson() => {
        "isim": isim,
        "image": image,
        "turu": turu,
        "aciklama": aciklama,
      };
}
