import 'package:flutter/material.dart';
import 'package:flyrics/models/state/app_state.dart';
import 'package:flyrics/selectors/artwork.dart';
import 'package:flyrics/utils/ux.dart';

Color resolvePlaceholderBgColor(AppState state) =>
    getArtworkColorByIndex(state, 1) ?? UX.primaryDarkColor;

Color resolvePlaceholderFgColor(AppState state) =>
    getArtworkColorByIndex(state, 0) ?? UX.primaryColor;
