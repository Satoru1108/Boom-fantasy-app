import 'package:flutter/material.dart';

class FilterButton extends StatefulWidget {
  final String title;
  final int? count;
  final bool? isActive;
  const FilterButton({super.key, required this.title, this.count, this.isActive});

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: widget.isActive != null && widget.isActive == true ? Color.fromARGB(255, 91, 204, 248) : Colors.white),
          color: widget.isActive != null && widget.isActive == true ? Color.fromARGB(255, 53, 141, 175) :  const Color.fromARGB(255, 75, 73, 73),
          borderRadius: BorderRadius.all(Radius.circular(50))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text( 
            widget.title,
            style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            widget.count != null ? Container(
              margin: EdgeInsets.only(left: 5),
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 126, 126, 126),
                  borderRadius: BorderRadius.all(Radius.circular(20))
              
                ),
                child: Center(
                  child: Text(
                    widget.count.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15
                    ),
                  ),
                ),
          
            ) : Text('')
          ]
        ),
      ),
    );
  }
}
