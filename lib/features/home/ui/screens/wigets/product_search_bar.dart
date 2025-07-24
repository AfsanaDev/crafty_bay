
import 'package:flutter/material.dart';

class productSearchBar extends StatelessWidget {
  const productSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: TextInputAction.search,
      onSubmitted: (String? value){
        //todo: search the product
      },
      decoration: InputDecoration(
        
        hintText: 'Search',
        prefixIcon: Icon(Icons.search),
        fillColor: Colors.grey.shade300,
        filled: true,
        border:  OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),focusedBorder:  OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
            
      ),
    );
  }
}

