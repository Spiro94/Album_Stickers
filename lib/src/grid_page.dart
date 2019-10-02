import 'package:flutter/material.dart';

class GridPage extends StatefulWidget {
  GridPage({Key key}) : super(key: key);

  _GridPageState createState() => _GridPageState();
}

class _GridPageState extends State<GridPage> {
  // bool _clicked = false;
  final int cantidadTotal = 255;
  List<int> lista = new List();

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grid'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              top: 15.0,
              right: 10.0,
              left: 10.0,
            ),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Center(
                        child: Text('Cantidad obtenidos: ${lista.length}'),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                            'Cantidad faltantes: ${cantidadTotal - lista.length}'),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 5.0,
                ),
                RaisedButton(
                  child: Text('Guardar cambios'),
                  onPressed: () {},
                )
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          _crearGrilla(),
        ],
      ),
    );
  }

  Widget _crearGrilla() {
    return Expanded(
      child: GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisCount: 6,
        // Generate 100 widgets that display their index in the List.
        children: List.generate(cantidadTotal + 1, (index) {
          return GridTile(
            // footer: Text('footer'),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                color: lista.contains(index) ? Colors.redAccent : Colors.grey,
                onPressed: () {
                  setState(() {
                    if (lista.contains(index)) {
                      lista.remove(index);
                    } else {
                      lista.add(index);
                    }
                  });
                },
                child: Text(
                  '$index',
                  style: TextStyle(fontSize: 13.0),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
