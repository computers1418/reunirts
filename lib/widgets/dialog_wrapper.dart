import 'package:flutter/material.dart';
import 'package:reunirts/extensions/int_exten.dart';
import 'package:reunirts/utils/data.dart';
import 'package:reunirts/widgets/circle_container.dart';
import 'package:reunirts/widgets/city_list.dart';
import 'package:reunirts/widgets/confirmed_info.dart';
import 'package:reunirts/widgets/dialog_bottom.dart';
import 'package:reunirts/widgets/dialog_fields.dart';
import 'package:reunirts/widgets/dialog_header.dart';
import 'package:reunirts/widgets/otp_field.dart';

class DialogWrapper extends StatefulWidget {
  const DialogWrapper({super.key});

  @override
  State<DialogWrapper> createState() => _DialogWrapperState();
}

class _DialogWrapperState extends State<DialogWrapper> {

  late ValueNotifier notifier;

  @override
  void initState() {
    notifier = ValueNotifier(0);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    var max = context.height()>=800;

    return ValueListenableBuilder(
      valueListenable: notifier,
      builder: (_, val, __) {
        return CircleContainer(
          child: Column(
            children: [
              
              DialogHeader(
                icon: '${dialogs[val]['icon']}', title: '${dialogs[val]['title']}', subtitle: dialogs[val]['subtitle']),
              max ? 6.vgap(context) : const SizedBox.shrink(),
              val==0 
              ? SizedBox(
                height: max ? 170 : 140,
                child: const CityList(),
              ) : val==1
              ? const DialogFields() 
              : val==2
              ? const OtpField() 
              : val==3
              ? const ConfirmedInfo()
              : const SizedBox.shrink(),
              max ? 6.vgap(context) : const SizedBox.shrink(),
              DialogBottom(
                btnText: '${dialogs[val]['btntext']}', 
                child: dialogs[val]['child']!=null,
                onClick: (){
                  if(val<3){
                    notifier.value = val+1;
                  }else{
                    Navigator.pop(context);
                    Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
                  }
                }
              )
              
            ],
          ),
        );
      }
    );
  }
}