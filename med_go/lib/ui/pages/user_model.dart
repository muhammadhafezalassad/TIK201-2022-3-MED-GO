class UserModel {
  String? uid;
  String? nama;
  String? nohp;
  String? alamat;
  String? email;

  UserModel({
    this.uid, this.nama, this.nohp, this.alamat, this.email 
  });
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      nama: map['nama'],
      nohp: map['nohp'],
      alamat: map['alamat'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'nama': nama,
      'nohp': nohp,
      'alamat': alamat,
    };
  }
}