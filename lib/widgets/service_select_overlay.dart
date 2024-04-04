import 'package:flutter/material.dart';
import 'package:reunirts/extensions/int_exten.dart';
import 'package:reunirts/widgets/service_item.dart';
import '../responsive/responsive_text.dart';
import '../responsive/size_responsive.dart';

class ServiceSelectOverlay extends StatefulWidget {
  const ServiceSelectOverlay({super.key});

  @override
  State<ServiceSelectOverlay> createState() => _ServiceSelectOverlayState();
}

class _ServiceSelectOverlayState extends State<ServiceSelectOverlay> {
  late ValueNotifier<String?> selected;

  OverlayEntry? overlayEntry;

  var items = [
        "Dental Braces", "Dental Crown", "Tooth Extraction","Root Canal", "Whitening", "Tooth Straightening"
      ];

  @override
  void initState() {
    selected = ValueNotifier(null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return PopScope(
      onPopInvoked: (v){
        if(overlayEntry!=null){
          if(overlayEntry?.mounted ?? false){
            overlayEntry?.remove();
          }
        }
      },
      child: SizedBox(
        height: MediaQuery.of(context).size.height >= 800 ? 55 : SizeResponsive.get(context, 44),
        child: InkWell(
          onTap: () => _showDoctorList(context),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color(0x1AFFFFFF),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selected.value ?? "Choose Services",
                  style: TextStyle(
                    fontFamily: "Metroplis",
                    fontSize: ResponsiveText.get(context, 16),
                    height: 1,
                    fontWeight: FontWeight.w600,
                    color: selected.value!=null ? Colors.white : const Color(0x4DFFFFFF),
                  ),
                ),
                const Icon(
                  Icons.keyboard_arrow_down,
                  color: Color(0x4DFFFFFF),
                  size: 24,
                ),
              ],
            ),
          ),
        ),
      ),
    );
    }
  void _showDoctorList(BuildContext context) {
    final RenderBox textField = context.findRenderObject() as RenderBox;
    final overlay = Overlay.of(context).context;

    final RenderBox overlayBox = overlay.findRenderObject() as RenderBox;
    final top = textField.localToGlobal(Offset.zero, ancestor: overlayBox).dy + textField.size.height;

    overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          GestureDetector(
            onTap: () {
              overlayEntry?.remove(); // Close the overlay when tapped outside
            },
            child: Container(
              color: Colors.transparent, // Make the GestureDetector transparent to catch taps
            ),
          ),
          Positioned(
            top: top,
            left: 30,
            right: 30,
            bottom: (MediaQuery.of(context).size.height - (top+260))<=0 
              ? null
              : (MediaQuery.of(context).size.height - (top+260)),
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular( context.width()<300 ? 28: 30),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFFCF2FD),
                  borderRadius: BorderRadius.circular(30)
                ),
                constraints: const BoxConstraints(
                  maxHeight: 260
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: ListView.separated(
                  itemCount: items.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return InkWell(
                      onTap: (){
                        setState(() {
                          selected.value = item;
                        });
                        Future.delayed(const Duration(milliseconds: 400), (){
                          overlayEntry?.remove();
                        });
                      },
                      child: ValueListenableBuilder(
                        valueListenable: selected,
                        builder: (_, val, __) {
                          return ServiceItem(isSelected: selected.value==item, name: item);
                        }
                      ),
                    );
                  },
                  separatorBuilder: (_, idx){
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      child: Divider(color: idx!=5 ? const Color(0x80F5D3E7) : Colors.transparent, height: 1),  
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );

    Overlay.of(context).insert(overlayEntry!);
  }



}
