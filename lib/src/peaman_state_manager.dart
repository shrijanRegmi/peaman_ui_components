import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class PStateProvider<T> {
  static MultiProvider multi({
    Key? key,
    required List<SingleChildWidget> providers,
    TransitionBuilder? builder,
    Widget? child,
  }) {
    return MultiProvider(
      key: key,
      providers: providers,
      builder: builder,
      child: child,
    );
  }

  static ChangeNotifierProvider changeNotifier<T extends ChangeNotifier>({
    Key? key,
    required Create<T> create,
    bool? lazy,
    TransitionBuilder? builder,
    Widget? child,
  }) {
    return ChangeNotifierProvider<T>(
      key: key,
      create: create,
      lazy: lazy,
      builder: builder,
      child: child,
    );
  }

  static ChangeNotifierProvider valueChangeNotifier<T extends ChangeNotifier>({
    Key? key,
    required T value,
    TransitionBuilder? builder,
    Widget? child,
  }) {
    return ChangeNotifierProvider<T>.value(
      key: key,
      builder: builder,
      value: value,
      child: child,
    );
  }

  static StreamProvider stream<T>({
    Key? key,
    required Create<Stream<T>?> create,
    required T initialData,
    ErrorBuilder<T>? catchError,
    UpdateShouldNotify<T>? updateShouldNotify,
    bool? lazy,
    TransitionBuilder? builder,
    Widget? child,
  }) {
    return StreamProvider<T>(
      key: key,
      create: create,
      initialData: initialData,
      catchError: catchError,
      updateShouldNotify: updateShouldNotify,
      lazy: lazy,
      builder: builder,
      child: child,
    );
  }

  static StreamProvider valueStream<T>({
    Key? key,
    required Stream<T>? value,
    required T initialData,
    ErrorBuilder<T>? catchError,
    UpdateShouldNotify<T>? updateShouldNotify,
    bool? lazy,
    TransitionBuilder? builder,
    Widget? child,
  }) {
    return StreamProvider<T>.value(
      key: key,
      value: value,
      initialData: initialData,
      catchError: catchError,
      updateShouldNotify: updateShouldNotify,
      lazy: lazy,
      builder: builder,
      child: child,
    );
  }

  static FutureProvider future<T>({
    Key? key,
    required Create<Future<T>?> create,
    required T initialData,
    ErrorBuilder<T>? catchError,
    UpdateShouldNotify<T>? updateShouldNotify,
    bool? lazy,
    TransitionBuilder? builder,
    Widget? child,
  }) {
    return FutureProvider<T>(
      key: key,
      create: create,
      initialData: initialData,
      catchError: catchError,
      updateShouldNotify: updateShouldNotify,
      lazy: lazy,
      builder: builder,
      child: child,
    );
  }

  static FutureProvider valueFuture<T>({
    Key? key,
    required Future<T>? value,
    required T initialData,
    ErrorBuilder<T>? catchError,
    UpdateShouldNotify<T>? updateShouldNotify,
    TransitionBuilder? builder,
    Widget? child,
  }) {
    return FutureProvider<T>.value(
      key: key,
      value: value,
      initialData: initialData,
      catchError: catchError,
      updateShouldNotify: updateShouldNotify,
      builder: builder,
    );
  }

  static Consumer consumer<T>({
    Key? key,
    required Widget Function(
      BuildContext context,
      T value,
      Widget? child,
    )
        builder,
    Widget? child,
  }) {
    return Consumer<T>(
      key: key,
      builder: builder,
      child: child,
    );
  }
}

extension WatchContext on BuildContext {
  T pwatch<T>() {
    return Provider.of<T>(this);
  }
}

extension ReadContext on BuildContext {
  T pread<T>() {
    return Provider.of<T>(this, listen: false);
  }
}
