import 'package:flutter/material.dart';
import 'package:reunirts/extensions/int_exten.dart';
import 'package:reunirts/widgets/doctor_item.dart';
import '../responsive/responsive_text.dart';
import '../responsive/size_responsive.dart';

class DoctorsSelectOverlay extends StatefulWidget {
  final VoidCallback onSelect;
  const DoctorsSelectOverlay({super.key, required this.onSelect});

  @override
  State<DoctorsSelectOverlay> createState() => _DoctorsSelectOverlayState();
}

class _DoctorsSelectOverlayState extends State<DoctorsSelectOverlay> {
  late ValueNotifier<String?> selected;
    OverlayEntry? overlayEntry;

      var items = [
      {"name": "Dr. David Russ", "loc": "K.T Nagar"},
      {"name": "Dr. Veronica Ray", "loc": "K.T Nagar"},
      {"name": "Dr. Mark Rooney", "loc": "K.T Nagar"},
      {"name": "Dr. Anna Bailey", "loc": "K.T Nagar"},
      {"name": "Dr. Rob Rhodes", "loc": "K.T Nagar"}
    ];

  @override
  void initState() {
    selected = ValueNotifier(null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return PopScope(
      canPop: true,
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
                  selected.value ?? "Choose Doctor",
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
            bottom: 20,
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular( context.width()<300 ? 28: 30),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFFCF2FD),
                  borderRadius: BorderRadius.circular(30)
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: ListView.builder(
                  itemCount: items.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return GestureDetector(
                      onTap: (){
                        setState(() {
                          selected.value = item["name"];
                        });
                        Future.delayed(const Duration(milliseconds: 400), (){
                          overlayEntry?.remove();
                        });
                      },
                      child: ValueListenableBuilder(
                        valueListenable: selected,
                        builder: (_, val, __) {
                          return DoctorItem(
                            onSelect: () {
                              overlayEntry?.remove();
                              widget.onSelect();
                            },
                            selected: item["name"] == selected.value,
                            data: item,
                          );
                        }
                      ),
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
