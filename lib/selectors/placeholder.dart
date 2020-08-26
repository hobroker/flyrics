import 'package:flutter/material.dart';
import 'package:flyrics/models/state/app_state.dart';
import 'package:flyrics/selectors/artwork.dart';

Color getPlaceholderBgColor(AppState state) => getArtworkColorByIndex(state, 1);

Color getPlaceholderFgColor(AppState state) => getArtworkColorByIndex(state, 0);
