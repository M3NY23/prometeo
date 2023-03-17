import 'package:flutter/material.dart';
import 'package:prometeo/gui/themes/app_theme.dart';

class ExpandableSideBar extends StatefulWidget {
  final List<SideBarItem> items;
  final Duration? duration;
  final double expandedWidht;
  final double collapsedWidht;
  final bool expand;
  final double elevation;
  final int? selected;
  const ExpandableSideBar(
      {this.items = const [],
      super.key,
      this.duration,
      this.expandedWidht = 200,
      this.collapsedWidht = 80,
      this.elevation = 1,
      this.expand = false,
      this.selected});

  @override
  State<ExpandableSideBar> createState() => _ExpandableSideBarState();
}

class _ExpandableSideBarState extends State<ExpandableSideBar> {
  late int _selectedIndex = widget.selected ?? 0;
  late bool _isExpanded = widget.expand;
  late double _width =
      _isExpanded ? widget.expandedWidht : widget.collapsedWidht;

  _expand() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _width = widget.expandedWidht;
      } else {
        _width = widget.collapsedWidht;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.none,
      child: AnimatedContainer(
        decoration: const BoxDecoration(color: AppTheme.fifthColor),
        duration: widget.duration ?? const Duration(milliseconds: 200),
        width: _width,
        child: Column(
          children: [
            for (int i = 0; i < widget.items.length; i++)
              SideBarTile(
                label: widget.items[i].label,
                icon: widget.items[i].icon,
                isSelected: i == _selectedIndex,
                onTap: () {
                  setState(() {
                    _selectedIndex = i;
                  });
                  if (widget.items[i].onTap != null) {
                    widget.items[i].onTap!();
                  }
                },
              ),
            const Expanded(
              child: SizedBox(),
            ),
            InkWell(
                onTap: _expand,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(_isExpanded
                                ? Icons.arrow_back_ios
                                : Icons.arrow_forward_ios),
                          ),
                        ],
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

class SideBarItem {
  final String label;
  final Icon icon;
  final Function()? onTap;
  SideBarItem({
    required this.label,
    required this.icon,
    this.onTap,
  });
}

class SideBarTile extends StatelessWidget {
  final String label;
  final Icon icon;
  final Function()? onTap;
  final bool isSelected;
  const SideBarTile(
      {super.key,
      required this.label,
      required this.icon,
      this.onTap,
      this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 70),
      child: Tooltip(
        message: label,
        child: Theme(
            data: isSelected
                ? AppTheme.selectedListTileTheme
                : AppTheme.darkTheme,
            child: SizedBox(
              child: MaterialButton(
                  onPressed: onTap,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        icon,
                        Text(
                          label,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  )),
            )
            // child: ListTile(
            //   leading: icon,
            //   onTap: onTap,
            //   title: Text(
            //     label,
            //     maxLines: 1,
            //     overflow: TextOverflow.ellipsis,
            //   ),
            // ),
            ),
      ),
    );
  }
}
