import 'package:flutter/material.dart';
import 'package:masrofnaa/ui/shared/export.dart';

class UpdateMasrof extends StatefulWidget {
  UpdateMasrof({
    @required this.masrof,
    @required this.appBarTitle,
    @required this.myTable,
    @required this.tableTitle,
  });
  final Masrofna masrof;
  final String appBarTitle;
  final String myTable;
  final String tableTitle;
  @override
  _UpdateMasrofState createState() => _UpdateMasrofState();
}

class _UpdateMasrofState extends State<UpdateMasrof> {
  final _productController = TextEditingController();
  final _priceController = TextEditingController();
  final _noItemsController = TextEditingController();

  DBHelper helper;

  @override
  void initState() {
    super.initState();
    helper = DBHelper();
    _productController.text = widget.masrof.product;
    _productController.addListener(() {
      _productController.value = _productController.value.copyWith(
        text: _productController.text,
        selection: TextSelection.fromPosition(
          TextPosition(
            offset: _productController.text.length,
          ),
        ),
      );
    });
    _priceController.text = widget.masrof.price.toString();
    _priceController.addListener(() {
      _priceController.value = _priceController.value.copyWith(
        text: _priceController.text,
        selection: TextSelection.fromPosition(
          TextPosition(
            offset: _priceController.text.length,
          ),
        ),
      );
    });
    _noItemsController.text = widget.masrof.noItems.toString();
    _noItemsController.addListener(() {
      _noItemsController.value = _noItemsController.value.copyWith(
        text: _noItemsController.text,
        selection: TextSelection.fromPosition(
          TextPosition(
            offset: _noItemsController.text.length,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'تعديل المنتج',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black54,
              fontFamily: 'GE',
            ),
          ),
          leading: Text(''),
          backgroundColor: Colors.white,
          elevation: 3,
          actions: [
            Align(
              alignment: Alignment.center,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_forward,
                  color: Colors.black54,
                ),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _productController,
                  textAlign: TextAlign.right,
                  decoration: kInputDecoration,
                  style: TextStyle(
                    fontFamily: 'GE',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _priceController,
                  style: TextStyle(fontFamily: 'Montserrat'),
                  textAlign: TextAlign.right,
                  decoration: kInputDecoration,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _noItemsController,
                  style: TextStyle(fontFamily: 'Montserrat'),
                  textAlign: TextAlign.right,
                  inputFormatters: [],
                  decoration: kInputDecoration,
                ),
                SizedBox(
                  height: 20,
                ),
                FlatButton(
                  color: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1000),
                  ),
                  onPressed: () async {
                    setState(() {
                      final updateMyCourses = Masrofna({
                        'id': widget.masrof.id,
                        'product': _productController.text,
                        'price': double.parse(_priceController.text),
                        'noItems': double.parse(_noItemsController.text),
                      });
                      helper.updateMasrof(updateMyCourses, widget.myTable);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ViewMasrofna(
                                  appBarTitle: widget.appBarTitle,
                                  myTable: widget.myTable,
                                  tableTitle: widget.tableTitle,
                                )),
                      );
                    });
                  },
                  child: Text(
                    'تعديل',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontFamily: 'GE',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
