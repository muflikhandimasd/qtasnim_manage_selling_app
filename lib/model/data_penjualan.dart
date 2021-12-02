class DataPenjualan {
  final int? id;
  final String? nama_barang;
  final int? stok;
  final int? jumlah_terjual;
  final String? jenis_barang;
  final DateTime? tanggal_transaksi;

  DataPenjualan({
    required this.id,
    required this.nama_barang,
    required this.stok,
    required this.jumlah_terjual,
    required this.jenis_barang,
    required this.tanggal_transaksi,
  });

  factory DataPenjualan.fromJson(Map<String, dynamic> json) {
    return DataPenjualan(
      id: json['id'],
      nama_barang: json['nama_barang'],
      stok: json['stok'],
      jumlah_terjual: json['jumlah_terjual'],
      jenis_barang: json['jenis_barang'],
      tanggal_transaksi: DateTime.parse(json['tanggal_transaksi']),
    );
  }
}
