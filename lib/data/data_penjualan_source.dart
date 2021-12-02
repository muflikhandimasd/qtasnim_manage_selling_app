import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:qtasnim_manage_selling_app/model/data_penjualan.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class DataPenjualanGridSource extends DataGridSource {
  DataPenjualanGridSource(this.dataPenjualanList) {
    buildDataGridRow();
  }
  late List<DataGridRow> dataGridRows;
  late List<DataPenjualan> dataPenjualanList;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(cells: [
      Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(8),
        child: Text(
          row.getCells()[0].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(8),
        child: Text(
          row.getCells()[1].value,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(8),
        child: Text(
          row.getCells()[2].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(8),
        child: Text(
          row.getCells()[3].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(8),
        child: Text(
          DateFormat('dd-MM-yyyy').format(row.getCells()[4].value).toString(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(8),
        child: Text(
          row.getCells()[5].value,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ]);
  }

  @override
  List<DataGridRow> get rows => dataGridRows;

  void buildDataGridRow() {
    dataGridRows = dataPenjualanList.map<DataGridRow>((dataGridRow) {
      return DataGridRow(cells: [
        DataGridCell(columnName: 'id', value: dataGridRow.id),
        DataGridCell<String>(
            columnName: 'nama_barang', value: dataGridRow.nama_barang),
        DataGridCell<int>(columnName: 'stok', value: dataGridRow.stok),
        DataGridCell<int>(
            columnName: 'jumlah_terjual', value: dataGridRow.jumlah_terjual),
        DataGridCell<DateTime>(
            columnName: 'tanggal_transaksi',
            value: dataGridRow.tanggal_transaksi),
        DataGridCell<String>(
            columnName: 'jenis_barang', value: dataGridRow.jenis_barang),
      ]);
    }).toList(growable: false);
  }
}
