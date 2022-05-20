class ObatModel {
  String? nama;
  String? namaobat;
  String? stock;

  ObatModel({
    this.nama, this.namaobat, this.stock 
  });
  factory ObatModel.fromMap(map) {
    return ObatModel(
      nama: map['nama'],
      namaobat: map['namaobat'],
      stock: map['stock'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nama': nama,
      'namaobat': namaobat,
      'stock': stock,
    };
  }
}