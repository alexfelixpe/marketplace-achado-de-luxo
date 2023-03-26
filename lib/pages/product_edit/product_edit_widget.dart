import '/backend/api_requests/api_calls.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/pages/produto/produto_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'product_edit_model.dart';
export 'product_edit_model.dart';

class ProductEditWidget extends StatefulWidget {
  const ProductEditWidget({
    Key? key,
    this.produto,
  }) : super(key: key);

  final dynamic produto;

  @override
  _ProductEditWidgetState createState() => _ProductEditWidgetState();
}

class _ProductEditWidgetState extends State<ProductEditWidget> {
  late ProductEditModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductEditModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().prodImg1 = '';
        FFAppState().prodImg2 = '';
        FFAppState().prodImg3 = '';
        FFAppState().prodImg4 = '';
        FFAppState().prodImg5 = '';
        FFAppState().prodImg6 = '';
      });
      _model.apiProdResult = await ProdutosByIdCall.call(
        id: getJsonField(
          widget.produto,
          r'''$._id''',
        ).toString().toString(),
      );
      if ((_model.apiProdResult?.succeeded ?? true)) {
        setState(() {
          FFAppState().prodImg1 = getJsonField(
            widget.produto,
            r'''$.ImagemRemota[0]''',
          );
          FFAppState().prodImg2 = getJsonField(
            widget.produto,
            r'''$.ImagemRemota[1]''',
          );
          FFAppState().prodImg3 = getJsonField(
            widget.produto,
            r'''$.ImagemRemota[2]''',
          );
          FFAppState().prodImg4 = getJsonField(
            widget.produto,
            r'''$.ImagemRemota[3]''',
          );
          FFAppState().prodImg5 = getJsonField(
            widget.produto,
            r'''$.ImagemRemota[4]''',
          );
          FFAppState().prodImg6 = getJsonField(
            widget.produto,
            r'''$.ImagemRemota[5]''',
          );
        });
      }
    });

    _model.nomeProdController ??= TextEditingController(
        text: getJsonField(
      widget.produto,
      r'''$.Nome''',
    ).toString().toString());
    _model.descProdController ??= TextEditingController(
        text: getJsonField(
      widget.produto,
      r'''$.Descricao''',
    ).toString().toString());
    _model.quantidadeController ??= TextEditingController(
        text: getJsonField(
      widget.produto,
      r'''$.Quantidade''',
    ).toString().toString());
    _model.precoProdController ??= TextEditingController(
        text: functions.transformString(getJsonField(
      widget.produto,
      r'''$.Preco''',
    ).toString().toString()));
    _model.marcaProdController ??= TextEditingController(
        text: getJsonField(
      widget.produto,
      r'''$.Marca''',
    ).toString().toString());
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: NestedScrollView(
        headerSliverBuilder: (context, _) => [
          SliverAppBar(
            pinned: true,
            floating: true,
            snap: false,
            backgroundColor: Color(0x95886BC7),
            automaticallyImplyLeading: true,
            actions: [],
            elevation: 6.0,
          )
        ],
        body: Builder(
          builder: (context) {
            return SafeArea(
              child: GestureDetector(
                onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                child: FutureBuilder<ApiCallResponse>(
                  future: (_model.apiRequestCompleter ??=
                          Completer<ApiCallResponse>()
                            ..complete(ProdutosByIdCall.call(
                              id: getJsonField(
                                widget.produto,
                                r'''$.response._id''',
                              ).toString(),
                            )))
                      .future,
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            color: FlutterFlowTheme.of(context).primaryColor,
                          ),
                        ),
                      );
                    }
                    final columnProdutosByIdResponse = snapshot.data!;
                    return RefreshIndicator(
                      onRefresh: () async {
                        setState(() => _model.apiRequestCompleter = null);
                        await _model.waitForApiRequestCompleted();
                      },
                      child: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Form(
                              key: _model.formKey,
                              autovalidateMode: AutovalidateMode.always,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Stack(
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 10.0, 10.0, 10.0),
                                                child: InkWell(
                                                  onTap: () async {
                                                    final selectedMedia =
                                                        await selectMediaWithSourceBottomSheet(
                                                      context: context,
                                                      allowPhoto: true,
                                                    );
                                                    if (selectedMedia != null &&
                                                        selectedMedia.every((m) =>
                                                            validateFileFormat(
                                                                m.storagePath,
                                                                context))) {
                                                      setState(() => _model
                                                              .isDataUploading1 =
                                                          true);
                                                      var selectedUploadedFiles =
                                                          <FFUploadedFile>[];
                                                      var downloadUrls =
                                                          <String>[];
                                                      try {
                                                        showUploadMessage(
                                                          context,
                                                          'Enviando...',
                                                          showLoading: true,
                                                        );
                                                        selectedUploadedFiles =
                                                            selectedMedia
                                                                .map((m) =>
                                                                    FFUploadedFile(
                                                                      name: m
                                                                          .storagePath
                                                                          .split(
                                                                              '/')
                                                                          .last,
                                                                      bytes: m
                                                                          .bytes,
                                                                      height: m
                                                                          .dimensions
                                                                          ?.height,
                                                                      width: m
                                                                          .dimensions
                                                                          ?.width,
                                                                    ))
                                                                .toList();

                                                        downloadUrls =
                                                            (await Future.wait(
                                                          selectedMedia.map(
                                                            (m) async =>
                                                                await uploadData(
                                                                    m.storagePath,
                                                                    m.bytes),
                                                          ),
                                                        ))
                                                                .where((u) =>
                                                                    u != null)
                                                                .map((u) => u!)
                                                                .toList();
                                                      } finally {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .hideCurrentSnackBar();
                                                        _model.isDataUploading1 =
                                                            false;
                                                      }
                                                      if (selectedUploadedFiles
                                                                  .length ==
                                                              selectedMedia
                                                                  .length &&
                                                          downloadUrls.length ==
                                                              selectedMedia
                                                                  .length) {
                                                        setState(() {
                                                          _model.uploadedLocalFile1 =
                                                              selectedUploadedFiles
                                                                  .first;
                                                          _model.uploadedFileUrl1 =
                                                              downloadUrls
                                                                  .first;
                                                        });
                                                        showUploadMessage(
                                                            context,
                                                            'Sucesso!');
                                                      } else {
                                                        setState(() {});
                                                        showUploadMessage(
                                                            context,
                                                            'Falha ao enviar mídia.');
                                                        return;
                                                      }
                                                    }

                                                    _model.imgUpload1 =
                                                        await ImgGroup
                                                            .imageUploadCall
                                                            .call(
                                                      image: _model
                                                          .uploadedFileUrl1,
                                                    );
                                                    setState(() {
                                                      FFAppState().prodImg1 =
                                                          ImgGroup
                                                              .imageUploadCall
                                                              .imgUrl(
                                                        (_model.imgUpload1
                                                                ?.jsonBody ??
                                                            ''),
                                                      );
                                                    });

                                                    setState(() {});
                                                  },
                                                  child: Image.network(
                                                    valueOrDefault<String>(
                                                      FFAppState().prodImg1,
                                                      'https://picsum.photos/seed/12/600',
                                                    ),
                                                    width: 100.0,
                                                    height: 100.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    1.08, -1.02),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 10.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 40.0,
                                                  icon: Icon(
                                                    Icons.delete_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    size: 20.0,
                                                  ),
                                                  onPressed: () async {
                                                    setState(() {
                                                      FFAppState().prodImg1 =
                                                          '';
                                                    });
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          Stack(
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 10.0, 10.0, 10.0),
                                                child: InkWell(
                                                  onTap: () async {
                                                    final selectedMedia =
                                                        await selectMediaWithSourceBottomSheet(
                                                      context: context,
                                                      allowPhoto: true,
                                                    );
                                                    if (selectedMedia != null &&
                                                        selectedMedia.every((m) =>
                                                            validateFileFormat(
                                                                m.storagePath,
                                                                context))) {
                                                      setState(() => _model
                                                              .isDataUploading2 =
                                                          true);
                                                      var selectedUploadedFiles =
                                                          <FFUploadedFile>[];
                                                      var downloadUrls =
                                                          <String>[];
                                                      try {
                                                        showUploadMessage(
                                                          context,
                                                          'Enviando...',
                                                          showLoading: true,
                                                        );
                                                        selectedUploadedFiles =
                                                            selectedMedia
                                                                .map((m) =>
                                                                    FFUploadedFile(
                                                                      name: m
                                                                          .storagePath
                                                                          .split(
                                                                              '/')
                                                                          .last,
                                                                      bytes: m
                                                                          .bytes,
                                                                      height: m
                                                                          .dimensions
                                                                          ?.height,
                                                                      width: m
                                                                          .dimensions
                                                                          ?.width,
                                                                    ))
                                                                .toList();

                                                        downloadUrls =
                                                            (await Future.wait(
                                                          selectedMedia.map(
                                                            (m) async =>
                                                                await uploadData(
                                                                    m.storagePath,
                                                                    m.bytes),
                                                          ),
                                                        ))
                                                                .where((u) =>
                                                                    u != null)
                                                                .map((u) => u!)
                                                                .toList();
                                                      } finally {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .hideCurrentSnackBar();
                                                        _model.isDataUploading2 =
                                                            false;
                                                      }
                                                      if (selectedUploadedFiles
                                                                  .length ==
                                                              selectedMedia
                                                                  .length &&
                                                          downloadUrls.length ==
                                                              selectedMedia
                                                                  .length) {
                                                        setState(() {
                                                          _model.uploadedLocalFile2 =
                                                              selectedUploadedFiles
                                                                  .first;
                                                          _model.uploadedFileUrl2 =
                                                              downloadUrls
                                                                  .first;
                                                        });
                                                        showUploadMessage(
                                                            context,
                                                            'Sucesso!');
                                                      } else {
                                                        setState(() {});
                                                        showUploadMessage(
                                                            context,
                                                            'Falha ao enviar mídia.');
                                                        return;
                                                      }
                                                    }

                                                    _model.imgUpload2 =
                                                        await ImgGroup
                                                            .imageUploadCall
                                                            .call(
                                                      image: _model
                                                          .uploadedFileUrl2,
                                                    );
                                                    setState(() {
                                                      FFAppState().prodImg2 =
                                                          ImgGroup
                                                              .imageUploadCall
                                                              .imgUrl(
                                                        (_model.imgUpload3
                                                                ?.jsonBody ??
                                                            ''),
                                                      );
                                                    });

                                                    setState(() {});
                                                  },
                                                  child: Image.network(
                                                    valueOrDefault<String>(
                                                      FFAppState().prodImg2,
                                                      'https://picsum.photos/seed/12/600',
                                                    ),
                                                    width: 100.0,
                                                    height: 100.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    1.08, -1.02),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 10.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 40.0,
                                                  icon: Icon(
                                                    Icons.delete_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    size: 20.0,
                                                  ),
                                                  onPressed: () async {
                                                    setState(() {
                                                      FFAppState().prodImg2 =
                                                          '';
                                                    });
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Stack(
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 10.0, 10.0, 10.0),
                                                child: InkWell(
                                                  onTap: () async {
                                                    final selectedMedia =
                                                        await selectMediaWithSourceBottomSheet(
                                                      context: context,
                                                      allowPhoto: true,
                                                    );
                                                    if (selectedMedia != null &&
                                                        selectedMedia.every((m) =>
                                                            validateFileFormat(
                                                                m.storagePath,
                                                                context))) {
                                                      setState(() => _model
                                                              .isDataUploading3 =
                                                          true);
                                                      var selectedUploadedFiles =
                                                          <FFUploadedFile>[];
                                                      var downloadUrls =
                                                          <String>[];
                                                      try {
                                                        showUploadMessage(
                                                          context,
                                                          'Enviando...',
                                                          showLoading: true,
                                                        );
                                                        selectedUploadedFiles =
                                                            selectedMedia
                                                                .map((m) =>
                                                                    FFUploadedFile(
                                                                      name: m
                                                                          .storagePath
                                                                          .split(
                                                                              '/')
                                                                          .last,
                                                                      bytes: m
                                                                          .bytes,
                                                                      height: m
                                                                          .dimensions
                                                                          ?.height,
                                                                      width: m
                                                                          .dimensions
                                                                          ?.width,
                                                                    ))
                                                                .toList();

                                                        downloadUrls =
                                                            (await Future.wait(
                                                          selectedMedia.map(
                                                            (m) async =>
                                                                await uploadData(
                                                                    m.storagePath,
                                                                    m.bytes),
                                                          ),
                                                        ))
                                                                .where((u) =>
                                                                    u != null)
                                                                .map((u) => u!)
                                                                .toList();
                                                      } finally {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .hideCurrentSnackBar();
                                                        _model.isDataUploading3 =
                                                            false;
                                                      }
                                                      if (selectedUploadedFiles
                                                                  .length ==
                                                              selectedMedia
                                                                  .length &&
                                                          downloadUrls.length ==
                                                              selectedMedia
                                                                  .length) {
                                                        setState(() {
                                                          _model.uploadedLocalFile3 =
                                                              selectedUploadedFiles
                                                                  .first;
                                                          _model.uploadedFileUrl3 =
                                                              downloadUrls
                                                                  .first;
                                                        });
                                                        showUploadMessage(
                                                            context,
                                                            'Sucesso!');
                                                      } else {
                                                        setState(() {});
                                                        showUploadMessage(
                                                            context,
                                                            'Falha ao enviar mídia.');
                                                        return;
                                                      }
                                                    }

                                                    _model.imgUpload3 =
                                                        await ImgGroup
                                                            .imageUploadCall
                                                            .call(
                                                      image: _model
                                                          .uploadedFileUrl3,
                                                    );
                                                    setState(() {
                                                      FFAppState().prodImg3 =
                                                          ImgGroup
                                                              .imageUploadCall
                                                              .imgUrl(
                                                        (_model.imgUpload3
                                                                ?.jsonBody ??
                                                            ''),
                                                      );
                                                    });

                                                    setState(() {});
                                                  },
                                                  child: Image.network(
                                                    valueOrDefault<String>(
                                                      FFAppState().prodImg3,
                                                      'https://picsum.photos/seed/12/600',
                                                    ),
                                                    width: 100.0,
                                                    height: 100.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    1.08, -1.02),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 10.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 40.0,
                                                  icon: Icon(
                                                    Icons.delete_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    size: 20.0,
                                                  ),
                                                  onPressed: () async {
                                                    setState(() {
                                                      FFAppState().prodImg3 =
                                                          '';
                                                    });
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          Stack(
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 10.0, 10.0, 10.0),
                                                child: InkWell(
                                                  onTap: () async {
                                                    final selectedMedia =
                                                        await selectMediaWithSourceBottomSheet(
                                                      context: context,
                                                      allowPhoto: true,
                                                    );
                                                    if (selectedMedia != null &&
                                                        selectedMedia.every((m) =>
                                                            validateFileFormat(
                                                                m.storagePath,
                                                                context))) {
                                                      setState(() => _model
                                                              .isDataUploading4 =
                                                          true);
                                                      var selectedUploadedFiles =
                                                          <FFUploadedFile>[];
                                                      var downloadUrls =
                                                          <String>[];
                                                      try {
                                                        showUploadMessage(
                                                          context,
                                                          'Enviando...',
                                                          showLoading: true,
                                                        );
                                                        selectedUploadedFiles =
                                                            selectedMedia
                                                                .map((m) =>
                                                                    FFUploadedFile(
                                                                      name: m
                                                                          .storagePath
                                                                          .split(
                                                                              '/')
                                                                          .last,
                                                                      bytes: m
                                                                          .bytes,
                                                                      height: m
                                                                          .dimensions
                                                                          ?.height,
                                                                      width: m
                                                                          .dimensions
                                                                          ?.width,
                                                                    ))
                                                                .toList();

                                                        downloadUrls =
                                                            (await Future.wait(
                                                          selectedMedia.map(
                                                            (m) async =>
                                                                await uploadData(
                                                                    m.storagePath,
                                                                    m.bytes),
                                                          ),
                                                        ))
                                                                .where((u) =>
                                                                    u != null)
                                                                .map((u) => u!)
                                                                .toList();
                                                      } finally {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .hideCurrentSnackBar();
                                                        _model.isDataUploading4 =
                                                            false;
                                                      }
                                                      if (selectedUploadedFiles
                                                                  .length ==
                                                              selectedMedia
                                                                  .length &&
                                                          downloadUrls.length ==
                                                              selectedMedia
                                                                  .length) {
                                                        setState(() {
                                                          _model.uploadedLocalFile4 =
                                                              selectedUploadedFiles
                                                                  .first;
                                                          _model.uploadedFileUrl4 =
                                                              downloadUrls
                                                                  .first;
                                                        });
                                                        showUploadMessage(
                                                            context,
                                                            'Sucesso!');
                                                      } else {
                                                        setState(() {});
                                                        showUploadMessage(
                                                            context,
                                                            'Falha ao enviar mídia.');
                                                        return;
                                                      }
                                                    }

                                                    _model.imgUpload4 =
                                                        await ImgGroup
                                                            .imageUploadCall
                                                            .call(
                                                      image: _model
                                                          .uploadedFileUrl4,
                                                    );
                                                    setState(() {
                                                      FFAppState().prodImg4 =
                                                          ImgGroup
                                                              .imageUploadCall
                                                              .imgUrl(
                                                        (_model.imgUpload4
                                                                ?.jsonBody ??
                                                            ''),
                                                      );
                                                    });

                                                    setState(() {});
                                                  },
                                                  child: Image.network(
                                                    valueOrDefault<String>(
                                                      FFAppState().prodImg4,
                                                      'https://picsum.photos/seed/12/600',
                                                    ),
                                                    width: 100.0,
                                                    height: 100.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    1.08, -1.02),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 10.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 40.0,
                                                  icon: Icon(
                                                    Icons.delete_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    size: 20.0,
                                                  ),
                                                  onPressed: () async {
                                                    setState(() {
                                                      FFAppState().prodImg4 =
                                                          '';
                                                    });
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Stack(
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 10.0, 10.0, 10.0),
                                                child: InkWell(
                                                  onTap: () async {
                                                    final selectedMedia =
                                                        await selectMediaWithSourceBottomSheet(
                                                      context: context,
                                                      allowPhoto: true,
                                                    );
                                                    if (selectedMedia != null &&
                                                        selectedMedia.every((m) =>
                                                            validateFileFormat(
                                                                m.storagePath,
                                                                context))) {
                                                      setState(() => _model
                                                              .isDataUploading5 =
                                                          true);
                                                      var selectedUploadedFiles =
                                                          <FFUploadedFile>[];
                                                      var downloadUrls =
                                                          <String>[];
                                                      try {
                                                        showUploadMessage(
                                                          context,
                                                          'Enviando...',
                                                          showLoading: true,
                                                        );
                                                        selectedUploadedFiles =
                                                            selectedMedia
                                                                .map((m) =>
                                                                    FFUploadedFile(
                                                                      name: m
                                                                          .storagePath
                                                                          .split(
                                                                              '/')
                                                                          .last,
                                                                      bytes: m
                                                                          .bytes,
                                                                      height: m
                                                                          .dimensions
                                                                          ?.height,
                                                                      width: m
                                                                          .dimensions
                                                                          ?.width,
                                                                    ))
                                                                .toList();

                                                        downloadUrls =
                                                            (await Future.wait(
                                                          selectedMedia.map(
                                                            (m) async =>
                                                                await uploadData(
                                                                    m.storagePath,
                                                                    m.bytes),
                                                          ),
                                                        ))
                                                                .where((u) =>
                                                                    u != null)
                                                                .map((u) => u!)
                                                                .toList();
                                                      } finally {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .hideCurrentSnackBar();
                                                        _model.isDataUploading5 =
                                                            false;
                                                      }
                                                      if (selectedUploadedFiles
                                                                  .length ==
                                                              selectedMedia
                                                                  .length &&
                                                          downloadUrls.length ==
                                                              selectedMedia
                                                                  .length) {
                                                        setState(() {
                                                          _model.uploadedLocalFile5 =
                                                              selectedUploadedFiles
                                                                  .first;
                                                          _model.uploadedFileUrl5 =
                                                              downloadUrls
                                                                  .first;
                                                        });
                                                        showUploadMessage(
                                                            context,
                                                            'Sucesso!');
                                                      } else {
                                                        setState(() {});
                                                        showUploadMessage(
                                                            context,
                                                            'Falha ao enviar mídia.');
                                                        return;
                                                      }
                                                    }

                                                    _model.imgUpload5 =
                                                        await ImgGroup
                                                            .imageUploadCall
                                                            .call(
                                                      image: _model
                                                          .uploadedFileUrl5,
                                                    );
                                                    setState(() {
                                                      FFAppState().prodImg5 =
                                                          ImgGroup
                                                              .imageUploadCall
                                                              .imgUrl(
                                                        (_model.imgUpload5
                                                                ?.jsonBody ??
                                                            ''),
                                                      );
                                                    });

                                                    setState(() {});
                                                  },
                                                  child: Image.network(
                                                    valueOrDefault<String>(
                                                      FFAppState().prodImg5,
                                                      'https://picsum.photos/seed/12/600',
                                                    ),
                                                    width: 100.0,
                                                    height: 100.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    1.08, -1.02),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 10.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 40.0,
                                                  icon: Icon(
                                                    Icons.delete_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    size: 20.0,
                                                  ),
                                                  onPressed: () async {
                                                    setState(() {
                                                      FFAppState().prodImg5 =
                                                          '';
                                                    });
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          Stack(
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 10.0, 10.0, 10.0),
                                                child: InkWell(
                                                  onTap: () async {
                                                    final selectedMedia =
                                                        await selectMediaWithSourceBottomSheet(
                                                      context: context,
                                                      allowPhoto: true,
                                                    );
                                                    if (selectedMedia != null &&
                                                        selectedMedia.every((m) =>
                                                            validateFileFormat(
                                                                m.storagePath,
                                                                context))) {
                                                      setState(() => _model
                                                              .isDataUploading6 =
                                                          true);
                                                      var selectedUploadedFiles =
                                                          <FFUploadedFile>[];
                                                      var downloadUrls =
                                                          <String>[];
                                                      try {
                                                        showUploadMessage(
                                                          context,
                                                          'Enviando...',
                                                          showLoading: true,
                                                        );
                                                        selectedUploadedFiles =
                                                            selectedMedia
                                                                .map((m) =>
                                                                    FFUploadedFile(
                                                                      name: m
                                                                          .storagePath
                                                                          .split(
                                                                              '/')
                                                                          .last,
                                                                      bytes: m
                                                                          .bytes,
                                                                      height: m
                                                                          .dimensions
                                                                          ?.height,
                                                                      width: m
                                                                          .dimensions
                                                                          ?.width,
                                                                    ))
                                                                .toList();

                                                        downloadUrls =
                                                            (await Future.wait(
                                                          selectedMedia.map(
                                                            (m) async =>
                                                                await uploadData(
                                                                    m.storagePath,
                                                                    m.bytes),
                                                          ),
                                                        ))
                                                                .where((u) =>
                                                                    u != null)
                                                                .map((u) => u!)
                                                                .toList();
                                                      } finally {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .hideCurrentSnackBar();
                                                        _model.isDataUploading6 =
                                                            false;
                                                      }
                                                      if (selectedUploadedFiles
                                                                  .length ==
                                                              selectedMedia
                                                                  .length &&
                                                          downloadUrls.length ==
                                                              selectedMedia
                                                                  .length) {
                                                        setState(() {
                                                          _model.uploadedLocalFile6 =
                                                              selectedUploadedFiles
                                                                  .first;
                                                          _model.uploadedFileUrl6 =
                                                              downloadUrls
                                                                  .first;
                                                        });
                                                        showUploadMessage(
                                                            context,
                                                            'Sucesso!');
                                                      } else {
                                                        setState(() {});
                                                        showUploadMessage(
                                                            context,
                                                            'Falha ao enviar mídia.');
                                                        return;
                                                      }
                                                    }

                                                    _model.imgUpload6 =
                                                        await ImgGroup
                                                            .imageUploadCall
                                                            .call(
                                                      image: _model
                                                          .uploadedFileUrl6,
                                                    );
                                                    setState(() {
                                                      FFAppState().prodImg6 =
                                                          ImgGroup
                                                              .imageUploadCall
                                                              .imgUrl(
                                                        (_model.imgUpload6
                                                                ?.jsonBody ??
                                                            ''),
                                                      );
                                                    });

                                                    setState(() {});
                                                  },
                                                  child: Image.network(
                                                    valueOrDefault<String>(
                                                      FFAppState().prodImg6,
                                                      'https://picsum.photos/seed/12/600',
                                                    ),
                                                    width: 100.0,
                                                    height: 100.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    1.08, -1.02),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 10.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 40.0,
                                                  icon: Icon(
                                                    Icons.delete_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    size: 20.0,
                                                  ),
                                                  onPressed: () async {
                                                    setState(() {
                                                      FFAppState().prodImg6 =
                                                          '';
                                                    });
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 10.0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-0.8, 0.0),
                                            child: Text(
                                              'Nome',
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 20.0, 5.0),
                                            child: TextFormField(
                                              controller:
                                                  _model.nomeProdController,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.nomeProdController',
                                                Duration(milliseconds: 2000),
                                                () => setState(() {}),
                                              ),
                                              textCapitalization:
                                                  TextCapitalization.words,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText2,
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText2,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .grayIcon,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .gray600,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBtnText,
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(20.0, 24.0,
                                                            0.0, 24.0),
                                                suffixIcon: _model
                                                        .nomeProdController!
                                                        .text
                                                        .isNotEmpty
                                                    ? InkWell(
                                                        onTap: () async {
                                                          _model
                                                              .nomeProdController
                                                              ?.clear();
                                                          setState(() {});
                                                        },
                                                        child: Icon(
                                                          Icons.clear,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .noColor,
                                                          size: 22.0,
                                                        ),
                                                      )
                                                    : null,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                              maxLines: null,
                                              validator: _model
                                                  .nomeProdControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-0.8, 0.0),
                                            child: Text(
                                              'Descrição',
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 20.0, 5.0),
                                            child: TextFormField(
                                              controller:
                                                  _model.descProdController,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.descProdController',
                                                Duration(milliseconds: 2000),
                                                () => setState(() {}),
                                              ),
                                              autofillHints: [
                                                AutofillHints.name
                                              ],
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText2,
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText2,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .grayIcon,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBtnText,
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(20.0, 24.0,
                                                            0.0, 24.0),
                                                suffixIcon: _model
                                                        .descProdController!
                                                        .text
                                                        .isNotEmpty
                                                    ? InkWell(
                                                        onTap: () async {
                                                          _model
                                                              .descProdController
                                                              ?.clear();
                                                          setState(() {});
                                                        },
                                                        child: Icon(
                                                          Icons.clear,
                                                          color:
                                                              Color(0xFF757575),
                                                          size: 22.0,
                                                        ),
                                                      )
                                                    : null,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                              maxLines: null,
                                              validator: _model
                                                  .descProdControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-0.8, 0.0),
                                            child: Text(
                                              'Estoque',
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 20.0, 5.0),
                                            child: TextFormField(
                                              controller:
                                                  _model.quantidadeController,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.quantidadeController',
                                                Duration(milliseconds: 2000),
                                                () => setState(() {}),
                                              ),
                                              autofillHints: [
                                                AutofillHints.name
                                              ],
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText2,
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText2,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .grayIcon,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBtnText,
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(20.0, 24.0,
                                                            0.0, 24.0),
                                                suffixIcon: _model
                                                        .quantidadeController!
                                                        .text
                                                        .isNotEmpty
                                                    ? InkWell(
                                                        onTap: () async {
                                                          _model
                                                              .quantidadeController
                                                              ?.clear();
                                                          setState(() {});
                                                        },
                                                        child: Icon(
                                                          Icons.clear,
                                                          color:
                                                              Color(0xFF757575),
                                                          size: 22.0,
                                                        ),
                                                      )
                                                    : null,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                              maxLines: null,
                                              keyboardType:
                                                  TextInputType.number,
                                              validator: _model
                                                  .quantidadeControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-0.8, 0.0),
                                            child: Text(
                                              'Preço',
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 20.0, 5.0),
                                            child: TextFormField(
                                              controller:
                                                  _model.precoProdController,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.precoProdController',
                                                Duration(milliseconds: 2000),
                                                () => setState(() {}),
                                              ),
                                              autofillHints: [
                                                AutofillHints.name
                                              ],
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText2,
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText2,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .grayIcon,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBtnText,
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(20.0, 24.0,
                                                            0.0, 24.0),
                                                suffixIcon: _model
                                                        .precoProdController!
                                                        .text
                                                        .isNotEmpty
                                                    ? InkWell(
                                                        onTap: () async {
                                                          _model
                                                              .precoProdController
                                                              ?.clear();
                                                          setState(() {});
                                                        },
                                                        child: Icon(
                                                          Icons.clear,
                                                          color:
                                                              Color(0xFF757575),
                                                          size: 22.0,
                                                        ),
                                                      )
                                                    : null,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                              maxLines: null,
                                              keyboardType:
                                                  TextInputType.number,
                                              validator: _model
                                                  .precoProdControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-0.8, 0.0),
                                            child: Text(
                                              'Marca',
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 20.0, 5.0),
                                            child: TextFormField(
                                              controller:
                                                  _model.marcaProdController,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.marcaProdController',
                                                Duration(milliseconds: 2000),
                                                () => setState(() {}),
                                              ),
                                              autofillHints: [
                                                AutofillHints.name
                                              ],
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText2,
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText2,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .grayIcon,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBtnText,
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(20.0, 24.0,
                                                            0.0, 24.0),
                                                suffixIcon: _model
                                                        .marcaProdController!
                                                        .text
                                                        .isNotEmpty
                                                    ? InkWell(
                                                        onTap: () async {
                                                          _model
                                                              .marcaProdController
                                                              ?.clear();
                                                          setState(() {});
                                                        },
                                                        child: Icon(
                                                          Icons.clear,
                                                          color:
                                                              Color(0xFF757575),
                                                          size: 22.0,
                                                        ),
                                                      )
                                                    : null,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                              maxLines: null,
                                              validator: _model
                                                  .marcaProdControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-0.8, 0.0),
                                            child: Text(
                                              'Categoria',
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                          ),
                                          Wrap(
                                            spacing: 5.0,
                                            runSpacing: 0.0,
                                            alignment: WrapAlignment.start,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.start,
                                            direction: Axis.horizontal,
                                            runAlignment: WrapAlignment.start,
                                            verticalDirection:
                                                VerticalDirection.down,
                                            clipBehavior: Clip.none,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 20.0, 0.0),
                                                child: FutureBuilder<
                                                    ApiCallResponse>(
                                                  future: ListasGroup
                                                      .categoriasCall
                                                      .call(),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child:
                                                              CircularProgressIndicator(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    final categoriaProdCategoriasResponse =
                                                        snapshot.data!;
                                                    return FlutterFlowDropDown<
                                                        String>(
                                                      controller: _model
                                                              .categoriaProdController ??=
                                                          FormFieldController<
                                                              String>(
                                                        _model.categoriaProdValue ??=
                                                            getJsonField(
                                                          widget.produto,
                                                          r'''$.Categoria[0]''',
                                                        ).toString(),
                                                      ),
                                                      options: (ListasGroup
                                                              .categoriasCall
                                                              .categoria(
                                                        categoriaProdCategoriasResponse
                                                            .jsonBody,
                                                      ) as List)
                                                          .map<String>((s) =>
                                                              s.toString())
                                                          .toList()!
                                                          .toList(),
                                                      onChanged: (val) =>
                                                          setState(() => _model
                                                                  .categoriaProdValue =
                                                              val),
                                                      width: double.infinity,
                                                      height: 50.0,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                      hintText: 'Selecione...',
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBtnText,
                                                      elevation: 2.0,
                                                      borderColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .grayIcon,
                                                      borderWidth: 2.0,
                                                      borderRadius: 8.0,
                                                      margin:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  4.0,
                                                                  12.0,
                                                                  4.0),
                                                      hidesUnderline: true,
                                                      isSearchable: false,
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-0.8, 0.0),
                                            child: Text(
                                              'Cor',
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 20.0, 0.0),
                                            child:
                                                FutureBuilder<ApiCallResponse>(
                                              future:
                                                  ListasGroup.coresCall.call(),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final corProdCoresResponse =
                                                    snapshot.data!;
                                                return FlutterFlowDropDown<
                                                    String>(
                                                  controller: _model
                                                          .corProdController ??=
                                                      FormFieldController<
                                                          String>(
                                                    _model.corProdValue ??=
                                                        getJsonField(
                                                      widget.produto,
                                                      r'''$.Cor''',
                                                    ).toString(),
                                                  ),
                                                  options: (ListasGroup
                                                          .coresCall
                                                          .cor(
                                                    corProdCoresResponse
                                                        .jsonBody,
                                                  ) as List)
                                                      .map<String>(
                                                          (s) => s.toString())
                                                      .toList()!
                                                      .toList(),
                                                  onChanged: (val) => setState(
                                                      () => _model
                                                          .corProdValue = val),
                                                  width: double.infinity,
                                                  height: 50.0,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyText1,
                                                  hintText: 'Selecione...',
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBtnText,
                                                  elevation: 2.0,
                                                  borderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .grayIcon,
                                                  borderWidth: 2.0,
                                                  borderRadius: 8.0,
                                                  margin: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 4.0, 12.0, 4.0),
                                                  hidesUnderline: true,
                                                  isSearchable: false,
                                                );
                                              },
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-0.8, 0.0),
                                            child: Text(
                                              'Tamanho',
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 20.0, 0.0),
                                            child:
                                                FutureBuilder<ApiCallResponse>(
                                              future: ListasGroup.tamanhosCall
                                                  .call(),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final tamanhoProdTamanhosResponse =
                                                    snapshot.data!;
                                                return FlutterFlowDropDown<
                                                    String>(
                                                  controller: _model
                                                          .tamanhoProdController ??=
                                                      FormFieldController<
                                                          String>(
                                                    _model.tamanhoProdValue ??=
                                                        getJsonField(
                                                      widget.produto,
                                                      r'''$.Tamanho[0]''',
                                                    ).toString(),
                                                  ),
                                                  options: (ListasGroup
                                                          .tamanhosCall
                                                          .tamanho(
                                                    tamanhoProdTamanhosResponse
                                                        .jsonBody,
                                                  ) as List)
                                                      .map<String>(
                                                          (s) => s.toString())
                                                      .toList()!
                                                      .toList(),
                                                  onChanged: (val) => setState(
                                                      () => _model
                                                              .tamanhoProdValue =
                                                          val),
                                                  width: double.infinity,
                                                  height: 50.0,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyText1,
                                                  hintText: 'Selecione...',
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBtnText,
                                                  elevation: 2.0,
                                                  borderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .grayIcon,
                                                  borderWidth: 2.0,
                                                  borderRadius: 8.0,
                                                  margin: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 4.0, 12.0, 4.0),
                                                  hidesUnderline: true,
                                                  isSearchable: false,
                                                );
                                              },
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.05),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  _model.apiResultProdUpdate =
                                                      await ProdutoGroup
                                                          .updateCall
                                                          .call(
                                                    nome: _model
                                                        .nomeProdController
                                                        .text,
                                                    descricao: _model
                                                        .descProdController
                                                        .text,
                                                    quantidade: int.tryParse(
                                                        _model
                                                            .quantidadeController
                                                            .text),
                                                    categoria: _model
                                                        .categoriaProdValue,
                                                    id: getJsonField(
                                                      widget.produto,
                                                      r'''$._id''',
                                                    ).toString(),
                                                    marca: _model
                                                        .marcaProdController
                                                        .text,
                                                    cor: _model.corProdValue,
                                                    tamanho:
                                                        _model.tamanhoProdValue,
                                                    imagem1:
                                                        FFAppState().prodImg1,
                                                    imagem2:
                                                        FFAppState().prodImg2,
                                                    imagem3:
                                                        FFAppState().prodImg3,
                                                    imagem4:
                                                        FFAppState().prodImg4,
                                                    imagem5:
                                                        FFAppState().prodImg5,
                                                    imagem6:
                                                        FFAppState().prodImg6,
                                                  );
                                                  if ((_model
                                                          .apiResultProdUpdate
                                                          ?.succeeded ??
                                                      true)) {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title:
                                                              Text('Sucesso!'),
                                                          content: Text(
                                                              'Produto atualizado com sucesso!'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                    _model.apiResultUpdatedProd =
                                                        await ProdutosByIdCall
                                                            .call(
                                                      id: getJsonField(
                                                        widget.produto,
                                                        r'''$._id''',
                                                      ).toString(),
                                                    );
                                                    if ((_model
                                                            .apiResultUpdatedProd
                                                            ?.succeeded ??
                                                        true)) {
                                                      setState(() {
                                                        FFAppState().prodImg1 =
                                                            '';
                                                        FFAppState().prodImg2 =
                                                            '';
                                                        FFAppState().prodImg3 =
                                                            '';
                                                        FFAppState().prodImg4 =
                                                            '';
                                                        FFAppState().prodImg5 =
                                                            '';
                                                        FFAppState().prodImg6 =
                                                            '';
                                                      });
                                                      await Navigator.push(
                                                        context,
                                                        PageTransition(
                                                          type:
                                                              PageTransitionType
                                                                  .fade,
                                                          duration: Duration(
                                                              milliseconds:
                                                                  300),
                                                          reverseDuration:
                                                              Duration(
                                                                  milliseconds:
                                                                      300),
                                                          child: ProdutoWidget(
                                                            produto:
                                                                ProdutosByIdCall
                                                                    .allFields(
                                                              (_model.apiResultUpdatedProd
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                  } else {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text('Erro!'),
                                                          content: Text(
                                                              'Tente novamente em alguns instantes...'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  }

                                                  setState(() {});
                                                },
                                                text: 'Salvar',
                                                options: FFButtonOptions(
                                                  width: 340.0,
                                                  height: 50.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color: Colors.white,
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                  elevation: 2.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.05),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  Navigator.pop(context);
                                                },
                                                text: 'Cancelar',
                                                options: FFButtonOptions(
                                                  width: 340.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color: Colors.white,
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                  elevation: 2.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
