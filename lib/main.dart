import 'package:flutter/material.dart';
import 'package:qtasnim_manage_selling_app/data/data_penjualan_source.dart';
import 'package:qtasnim_manage_selling_app/services/api_services.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

void main() {
  runApp(const MyApp());
}

String? codeDialog;
String? valueText;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  TextEditingController _textFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Qtasnim App'),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Tambah Data Penjualan'),
                    content: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Nama Barang'),
                            SizedBox(height: 4),
                            TextField(
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                hintText: 'Buku',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(9),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    9,
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.purple,
                                  ),
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  valueText = value;
                                });
                              },
                              controller: _textFieldController,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Stok'),
                            SizedBox(height: 4),
                            TextField(
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                hintText: '100',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(9),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    9,
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.purple,
                                  ),
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  valueText = value;
                                });
                              },
                              controller: _textFieldController,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Jumlah Terjual'),
                            SizedBox(height: 4),
                            TextField(
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                hintText: '3000',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(9),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    9,
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.purple,
                                  ),
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  valueText = value;
                                });
                              },
                              controller: _textFieldController,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Tanggal Transaksi'),
                            SizedBox(height: 4),
                            TextField(
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(9),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    9,
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.purple,
                                  ),
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  valueText = value;
                                });
                              },
                              controller: _textFieldController,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Jenis Barang'),
                            SizedBox(height: 4),
                            TextField(
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                hintText: 'Konsumsi',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(9),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    9,
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.purple,
                                  ),
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  valueText = value;
                                });
                              },
                              controller: _textFieldController,
                            ),
                          ],
                        )
                      ],
                    ),
                    actions: <Widget>[
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.red),
                        ),
                        child: Text('CANCEL',
                            style: TextStyle(color: Colors.white)),
                        onPressed: () {
                          setState(() {
                            Navigator.pop(context);
                          });
                        },
                      ),
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green),
                        ),
                        child:
                            Text('OK', style: TextStyle(color: Colors.white)),
                        onPressed: () {
                          setState(() {
                            codeDialog = valueText;
                            Navigator.pop(context);
                          });
                        },
                      ),
                    ],
                  );
                });
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.lightGreen,
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
                    allowEditing: true,
                    selectionMode: SelectionMode.single,
                    navigationMode: GridNavigationMode.row,
                  )
                : const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
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
