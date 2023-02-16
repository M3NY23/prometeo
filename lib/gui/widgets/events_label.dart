import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prometeo/domain/blocs/process/process_bloc.dart';
import 'package:prometeo/gui/util/icon_kyes.dart';

class EventsLabel extends StatelessWidget {
  const EventsLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 210),
      child: BlocBuilder<ProcessBloc, ProcessState>(builder: (context, state) {
        return Row(
          children: [
            if (state.useProgressIndicator)
              const Padding(
                padding: EdgeInsets.only(right: 5),
                child: SizedBox(
                    height: 12,
                    width: 12,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    )),
              ),
            if ((state.iconKey ?? "").isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(right: 3),
                child: IconKeys.icons[state.iconKey]!,
              ),
            Text(state.label)
          ],
        );
      }),
    );
  }
}
