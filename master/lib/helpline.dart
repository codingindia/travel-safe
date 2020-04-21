import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

int counter = 0;

class HelplineNumbers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Helpline Numbers'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 10,
              width: 10,
            ),
            Text(
              'Some useful helpline numbers: ',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20.0,
              ),
            ),
            SizedBox(
              height: 10,
              width: 10,
            ),
            myWidget(),
          ],
        ),
      ),
    );
  }
}

Widget myWidget() {
  return Container(
    height: 400,
    width: 400,
    child: DataTable(
      onSelectAll: (b) {},
      sortAscending: true,
      columns: <DataColumn>[
        DataColumn(
          label: Text(
            'Department',
            style: TextStyle(fontSize: 25),
          ),
        ),
        DataColumn(
          label: Text(
            'Number',
            style: TextStyle(fontSize: 25),
          ),
        ),
      ],
      rows: items
          .map(
            (itemRow) => DataRow(
          cells: [
            DataCell(
              Text(
                itemRow.itemDepartment,
                style: TextStyle(fontSize: 20),
              ),
              showEditIcon: false,
              placeholder: false,
            ),
            DataCell(
              Text(
                itemRow.itemNumber,
                style: TextStyle(fontSize: 20),
              ),
              showEditIcon: false,
              placeholder: false,
//              onTap: () {
//                _launchCaller(itemRow.itemNumber);
//              },
            ),
          ],
        ),
      )
          .toList(),
    ),
  );
}

class ItemInfo {
  String itemDepartment;
  String itemNumber;

  ItemInfo({
    this.itemDepartment,
    this.itemNumber,
  });
}

var items = <ItemInfo>[
  ItemInfo(
    itemDepartment: 'PCR',
    itemNumber: '100',
  ),
  ItemInfo(
    itemDepartment: 'Eyes and Ears',
    itemNumber: '1090',
  ),
  ItemInfo(
    itemDepartment: 'Women in distress',
    itemNumber: '1091',
  ),
  ItemInfo(
    itemDepartment: 'Special Cell',
    itemNumber: '1093',
  ),
  ItemInfo(
    itemDepartment: 'Missing person',
    itemNumber: '1094',
  ),
  ItemInfo(
    itemDepartment: 'Traffic',
    itemNumber: '1095',
  ),
  ItemInfo(
    itemDepartment: 'Vigilance',
    itemNumber: '1064',
  )
];
