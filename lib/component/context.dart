part of '../codux.dart';

final _contextQueue = Queue<BuildContext>();

BuildContext requireContext() => _contextQueue.last;
