import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

enum _Type {
  singleStream,
  multiStream,
  singleFuture,
  multiFuture,
}

class PeamanUserFetcher extends StatefulWidget {
  final _Type type;

  final Stream<PeamanUser>? userStream;
  final Stream<List<PeamanUser>>? usersStream;
  final Future<PeamanUser>? userFuture;
  final Future<List<PeamanUser>>? usersFuture;
  final Widget Function(PeamanUser)? singleBuilder;
  final Widget Function(List<PeamanUser>)? multiBuilder;

  final Widget? loadingWidget;
  final Widget? emptyWidget;

  const PeamanUserFetcher.singleStream({
    Key? key,
    required this.userStream,
    required this.singleBuilder,
    this.loadingWidget,
    this.emptyWidget,
  })  : type = _Type.singleStream,
        usersStream = null,
        multiBuilder = null,
        userFuture = null,
        usersFuture = null,
        super(key: key);

  const PeamanUserFetcher.multiStream({
    Key? key,
    required this.usersStream,
    required this.multiBuilder,
    this.loadingWidget,
    this.emptyWidget,
  })  : type = _Type.multiStream,
        userStream = null,
        singleBuilder = null,
        userFuture = null,
        usersFuture = null,
        super(key: key);

  const PeamanUserFetcher.singleFuture({
    Key? key,
    required this.userFuture,
    required this.singleBuilder,
    this.loadingWidget,
    this.emptyWidget,
  })  : type = _Type.singleFuture,
        userStream = null,
        usersStream = null,
        usersFuture = null,
        multiBuilder = null,
        super(key: key);

  const PeamanUserFetcher.multiFuture({
    Key? key,
    required this.usersFuture,
    required this.multiBuilder,
    this.loadingWidget,
    this.emptyWidget,
  })  : type = _Type.multiFuture,
        userStream = null,
        usersStream = null,
        userFuture = null,
        singleBuilder = null,
        super(key: key);

  @override
  State<PeamanUserFetcher> createState() => _PeamanUserFetcherState();
}

class _PeamanUserFetcherState extends State<PeamanUserFetcher> {
  Stream<PeamanUser>? _userStream;
  Stream<List<PeamanUser>>? _usersStream;
  Future<PeamanUser>? _userFuture;
  Future<List<PeamanUser>>? _usersFuture;

  @override
  void initState() {
    super.initState();
    _userStream = widget.userStream;
    _usersStream = widget.usersStream;
    _userFuture = widget.userFuture;
    _usersFuture = widget.usersFuture;
  }

  @override
  void didUpdateWidget(covariant PeamanUserFetcher oldWidget) {
    setState(() {
      _userStream = widget.userStream;
      _usersStream = widget.usersStream;
      _userFuture = widget.userFuture;
      _usersFuture = widget.usersFuture;
    });
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return widget.type == _Type.singleStream
        ? _singleStreamBuilder()
        : widget.type == _Type.multiStream
            ? _multiStreamBuilder()
            : widget.type == _Type.singleFuture
                ? _singleFutureBuilder()
                : _multiFutureBuilder();
  }

  Widget _singleStreamBuilder() {
    return StreamBuilder<PeamanUser>(
      stream: _userStream,
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.waiting) {
          return widget.loadingWidget ?? const SizedBox();
        }

        if (snap.hasData) {
          final user = snap.data;

          if (user != null) {
            return widget.singleBuilder?.call(user) ?? const SizedBox();
          }
        }

        return widget.emptyWidget ?? const SizedBox();
      },
    );
  }

  Widget _multiStreamBuilder() {
    return StreamBuilder<List<PeamanUser>>(
      stream: _usersStream,
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.waiting) {
          return widget.loadingWidget ?? const SizedBox();
        }

        if (snap.hasData) {
          final users = snap.data;

          if (users != null) {
            return widget.multiBuilder?.call(users) ?? Container();
          }
        }

        return widget.emptyWidget ?? const SizedBox();
      },
    );
  }

  Widget _singleFutureBuilder() {
    return FutureBuilder<PeamanUser>(
      future: _userFuture,
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.waiting) {
          return widget.loadingWidget ?? const SizedBox();
        }

        if (snap.hasData) {
          final user = snap.data;

          if (user != null) {
            return widget.singleBuilder?.call(user) ?? Container();
          }
        }

        return widget.emptyWidget ?? const SizedBox();
      },
    );
  }

  Widget _multiFutureBuilder() {
    return FutureBuilder<List<PeamanUser>>(
      future: _usersFuture,
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.waiting) {
          return widget.loadingWidget ?? const SizedBox();
        }

        if (snap.hasData) {
          final users = snap.data;

          if (users != null) {
            return widget.multiBuilder?.call(users) ?? Container();
          }
        }

        return widget.emptyWidget ?? const SizedBox();
      },
    );
  }
}
