import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final listenProvider = StateProvider<int>((ref) => 0);