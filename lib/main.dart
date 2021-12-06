import 'package:flutter/material.dart';
import 'package:qtasnim_manage_selling_app/data/data_penjualan_source.dart';
import 'package:qtasnim_manage_selling_app/services/api_services.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Qtasnim App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Qtasnim App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Qtasnim App'),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: getDataPenjualanSource(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return snapshot.hasData
                ? SfDataGrid(
                    columnWidthMode: ColumnWidthMode.auto,
                    source: snapshot.data,
                    columns: getColumns(),
                    allowSorting: true,
                  )
                : const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 5,
                    ),
                  );
          },
        ),
      ),
    );
  }

  Future<DataPenjualanGridSource> getDataPenjualanSource() async {
    var dataPenjualanList = await generateDataPenjualanList();
    return DataPenjualanGridSource(dataPenjualanList);
  }

  List<GridColumn> getColumns() {
    return <GridColumn>[
      GridColumn(
        visible: false,
        columnName: 'id',
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          child: const Text(
            'No',
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
        ),
      ),
      GridColumn(
        columnName: 'nama_barang',
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          child: const Text(
            'Nama\nBarang',
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
        ),
      ),
      GridColumn(
        columnName: 'stok',
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          child: const Text(
            'Stok',
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
        ),
      ),
      GridColumn(
        columnName: 'jumlah_terjual',
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          child: const Text(
            'Jumlah\nTerjual',
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
        ),
      ),
      GridColumn(
        columnName: 'tanggal_transaksi',
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          child: const Text(
            'Tanggal\nTransaksi',
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
        ),
      ),
      GridColumn(
        columnName: 'jenis_barang',
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          child: const Text(
            "Jenis\nBarang",
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
        ),
      ),
    ];
  }
}
