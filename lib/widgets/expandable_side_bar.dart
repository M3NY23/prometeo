import 'package:flutter/material.dart';

class ExpandableSideBar extends StatefulWidget {
  final List<SideBarTile>? items;
  final Duration? duration;
  final double expandedWidht;
  final double collapsedWidht;
  final bool expand;
  final double elevation;
  const ExpandableSideBar(
      {this.items,
      super.key,
      this.duration,
      this.expandedWidht = 200,
      this.collapsedWidht = 60,
      this.elevation = 1,
      this.expand = false});

  @override
  State<ExpandableSideBar> createState() => _ExpandableSideBarState();
}

class _ExpandableSideBarState extends State<ExpandableSideBar> {
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
        decoration: const BoxDecoration(
            border: Border(right: BorderSide(color: Colors.white))),
        duration: widget.duration ?? const Duration(milliseconds: 500),
        width: _width,
        child: Column(
          children: [
            if (widget.items != null) ...widget.items!,
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

class SideBarTile extends StatelessWidget {
  final String label;
  final Icon icon;
  final Function()? onTap;
  const SideBarTile(
      {super.key, required this.label, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 60),
      child: Tooltip(
        message: label,
        child: ListTile(
          leading: icon,
          onTap: onTap,
          title: Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
