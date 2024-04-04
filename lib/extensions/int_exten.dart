import 'package:flutter/material.dart';
import 'package:reunirts/responsive/size_responsive.dart';

extension SizeExtension on int{

  vgap(BuildContext context)=>SizedBox(height: SizeResponsive.get(context, this));
  hgap(BuildContext context)=>SizedBox(width: SizeResponsive.get(context, this));

}


extension ContextCustomExtension on BuildContext{

  height()=>MediaQuery.of(this).size.height;
  width()=>MediaQuery.of(this).size.width;
  aspect()=>MediaQuery.of(this).size.width/MediaQuery.of(this).size.height;


}