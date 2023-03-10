import '/backend/api_requests/api_calls.dart';
import '/components/genero_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_media.dart';
import '/produto/produto_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'imagens_model.dart';
export 'imagens_model.dart';

class ImagensWidget extends StatefulWidget {
  const ImagensWidget({Key? key}) : super(key: key);

  @override
  _ImagensWidgetState createState() => _ImagensWidgetState();
}

class _ImagensWidgetState extends State<ImagensWidget> {
  late ImagensModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ImagensModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
      child: Container(
        width: double.infinity,
        height: 500.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 7.0,
              color: Color(0x32171717),
              offset: Offset(0.0, -4.0),
            )
          ],
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 60.0,
                  height: 4.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).lineColor,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          'Escolha até 4 imagens adicionais',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context).subtitle1,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Wrap(
                          spacing: 0.0,
                          runSpacing: 0.0,
                          alignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          direction: Axis.horizontal,
                          runAlignment: WrapAlignment.start,
                          verticalDirection: VerticalDirection.down,
                          clipBehavior: Clip.none,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 5.0, 5.0, 5.0),
                              child: InkWell(
                                onTap: () async {
                                  FFAppState().update(() {
                                    FFAppState().prodCondicao = 'Usado';
                                  });
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.of(context).viewInsets,
                                        child: GeneroWidget(),
                                      );
                                    },
                                  ).then((value) => setState(() {}));
                                },
                                child: Container(
                                  width: 103.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEEEEEE),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Stack(
                                    children: [
                                      Image.network(
                                        ImgbbGroup.imageUploadCall.uImageUrl(
                                                  (_model.apiImageUploadResult2
                                                          ?.jsonBody ??
                                                      ''),
                                                ) !=
                                                null
                                            ? ImgbbGroup.imageUploadCall
                                                .uImageUrl(
                                                (_model.apiImageUploadResult2
                                                        ?.jsonBody ??
                                                    ''),
                                              )
                                            : 'https://picsum.photos/seed/285/600',
                                        width: 100.0,
                                        height: 100.0,
                                        fit: BoxFit.cover,
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-0.18, -0.14),
                                        child: FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30.0,
                                          borderWidth: 1.0,
                                          buttonSize: 60.0,
                                          fillColor: Color(0x3E57636C),
                                          icon: Icon(
                                            Icons.camera_alt,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            size: 30.0,
                                          ),
                                          onPressed: () async {
                                            final selectedMedia =
                                                await selectMedia(
                                              mediaSource:
                                                  MediaSource.photoGallery,
                                              multiImage: false,
                                            );
                                            if (selectedMedia != null &&
                                                selectedMedia.every((m) =>
                                                    validateFileFormat(
                                                        m.storagePath,
                                                        context))) {
                                              setState(() => _model
                                                  .isMediaUploading1 = true);
                                              var selectedUploadedFiles =
                                                  <FFUploadedFile>[];

                                              try {
                                                selectedUploadedFiles =
                                                    selectedMedia
                                                        .map((m) =>
                                                            FFUploadedFile(
                                                              name: m
                                                                  .storagePath
                                                                  .split('/')
                                                                  .last,
                                                              bytes: m.bytes,
                                                              height: m
                                                                  .dimensions
                                                                  ?.height,
                                                              width: m
                                                                  .dimensions
                                                                  ?.width,
                                                            ))
                                                        .toList();
                                              } finally {
                                                _model.isMediaUploading1 =
                                                    false;
                                              }
                                              if (selectedUploadedFiles
                                                      .length ==
                                                  selectedMedia.length) {
                                                setState(() {
                                                  _model.uploadedLocalFile1 =
                                                      selectedUploadedFiles
                                                          .first;
                                                });
                                              } else {
                                                setState(() {});
                                                return;
                                              }
                                            }

                                            _model.apiImageUploadResult2 =
                                                await ImgbbGroup.imageUploadCall
                                                    .call(
                                              image: _model.uploadedLocalFile1,
                                            );
                                            if ((_model.apiImageUploadResult2
                                                    ?.succeeded ??
                                                true)) {
                                              setState(() {
                                                FFAppState().prodImg2 =
                                                    ImgbbGroup.imageUploadCall
                                                        .uImageUrl(
                                                  (_model.apiImageUploadResult2
                                                          ?.jsonBody ??
                                                      ''),
                                                );
                                              });
                                              ScaffoldMessenger.of(context)
                                                  .clearSnackBars();
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Imagem enviada com sucesso!',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .tertiary400,
                                                ),
                                              );
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: Text('Erro'),
                                                    content: Text(
                                                        'Função temporariamente indisponível. Tente em alguns instantes.'),
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
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 5.0, 5.0, 5.0),
                              child: InkWell(
                                onTap: () async {
                                  FFAppState().update(() {
                                    FFAppState().prodCondicao = 'Usado';
                                  });
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.of(context).viewInsets,
                                        child: GeneroWidget(),
                                      );
                                    },
                                  ).then((value) => setState(() {}));
                                },
                                child: Container(
                                  width: 103.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEEEEEE),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Stack(
                                    children: [
                                      Image.network(
                                        ImgbbGroup.imageUploadCall.uImageUrl(
                                                  (_model.apiImageUploadResult3
                                                          ?.jsonBody ??
                                                      ''),
                                                ) !=
                                                null
                                            ? ImgbbGroup.imageUploadCall
                                                .uImageUrl(
                                                (_model.apiImageUploadResult2
                                                        ?.jsonBody ??
                                                    ''),
                                              )
                                            : 'https://picsum.photos/seed/285/600',
                                        width: 100.0,
                                        height: 100.0,
                                        fit: BoxFit.cover,
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-0.18, -0.14),
                                        child: FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30.0,
                                          borderWidth: 1.0,
                                          buttonSize: 60.0,
                                          fillColor: Color(0x3E57636C),
                                          icon: Icon(
                                            Icons.camera_alt,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            size: 30.0,
                                          ),
                                          onPressed: () async {
                                            final selectedMedia =
                                                await selectMedia(
                                              mediaSource:
                                                  MediaSource.photoGallery,
                                              multiImage: false,
                                            );
                                            if (selectedMedia != null &&
                                                selectedMedia.every((m) =>
                                                    validateFileFormat(
                                                        m.storagePath,
                                                        context))) {
                                              setState(() => _model
                                                  .isMediaUploading2 = true);
                                              var selectedUploadedFiles =
                                                  <FFUploadedFile>[];

                                              try {
                                                selectedUploadedFiles =
                                                    selectedMedia
                                                        .map((m) =>
                                                            FFUploadedFile(
                                                              name: m
                                                                  .storagePath
                                                                  .split('/')
                                                                  .last,
                                                              bytes: m.bytes,
                                                              height: m
                                                                  .dimensions
                                                                  ?.height,
                                                              width: m
                                                                  .dimensions
                                                                  ?.width,
                                                            ))
                                                        .toList();
                                              } finally {
                                                _model.isMediaUploading2 =
                                                    false;
                                              }
                                              if (selectedUploadedFiles
                                                      .length ==
                                                  selectedMedia.length) {
                                                setState(() {
                                                  _model.uploadedLocalFile2 =
                                                      selectedUploadedFiles
                                                          .first;
                                                });
                                              } else {
                                                setState(() {});
                                                return;
                                              }
                                            }

                                            _model.apiImageUploadResult3 =
                                                await ImgbbGroup.imageUploadCall
                                                    .call(
                                              image: _model.uploadedLocalFile2,
                                            );
                                            if ((_model.apiImageUploadResult3
                                                    ?.succeeded ??
                                                true)) {
                                              setState(() {
                                                FFAppState().prodImg3 =
                                                    ImgbbGroup.imageUploadCall
                                                        .uImageUrl(
                                                  (_model.apiImageUploadResult3
                                                          ?.jsonBody ??
                                                      ''),
                                                );
                                              });
                                              ScaffoldMessenger.of(context)
                                                  .clearSnackBars();
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Imagem enviada com sucesso',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .tertiary400,
                                                ),
                                              );
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: Text('Mensagem'),
                                                    content: Text(
                                                        'Nos desculpe :-( Tente novamente mais tarde...'),
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
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 5.0, 5.0, 5.0),
                              child: InkWell(
                                onTap: () async {
                                  FFAppState().update(() {
                                    FFAppState().prodCondicao = 'Usado';
                                  });
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.of(context).viewInsets,
                                        child: GeneroWidget(),
                                      );
                                    },
                                  ).then((value) => setState(() {}));
                                },
                                child: Container(
                                  width: 103.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEEEEEE),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Stack(
                                    children: [
                                      Image.network(
                                        ImgbbGroup.imageUploadCall.uImageUrl(
                                                  (_model.apiImageUploadResult4
                                                          ?.jsonBody ??
                                                      ''),
                                                ) !=
                                                null
                                            ? ImgbbGroup.imageUploadCall
                                                .uImageUrl(
                                                (_model.apiImageUploadResult2
                                                        ?.jsonBody ??
                                                    ''),
                                              )
                                            : 'https://picsum.photos/seed/285/600',
                                        width: 100.0,
                                        height: 100.0,
                                        fit: BoxFit.cover,
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-0.18, -0.14),
                                        child: FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30.0,
                                          borderWidth: 1.0,
                                          buttonSize: 60.0,
                                          fillColor: Color(0x3E57636C),
                                          icon: Icon(
                                            Icons.camera_alt,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            size: 30.0,
                                          ),
                                          onPressed: () async {
                                            final selectedMedia =
                                                await selectMedia(
                                              mediaSource:
                                                  MediaSource.photoGallery,
                                              multiImage: false,
                                            );
                                            if (selectedMedia != null &&
                                                selectedMedia.every((m) =>
                                                    validateFileFormat(
                                                        m.storagePath,
                                                        context))) {
                                              setState(() => _model
                                                  .isMediaUploading3 = true);
                                              var selectedUploadedFiles =
                                                  <FFUploadedFile>[];

                                              try {
                                                selectedUploadedFiles =
                                                    selectedMedia
                                                        .map((m) =>
                                                            FFUploadedFile(
                                                              name: m
                                                                  .storagePath
                                                                  .split('/')
                                                                  .last,
                                                              bytes: m.bytes,
                                                              height: m
                                                                  .dimensions
                                                                  ?.height,
                                                              width: m
                                                                  .dimensions
                                                                  ?.width,
                                                            ))
                                                        .toList();
                                              } finally {
                                                _model.isMediaUploading3 =
                                                    false;
                                              }
                                              if (selectedUploadedFiles
                                                      .length ==
                                                  selectedMedia.length) {
                                                setState(() {
                                                  _model.uploadedLocalFile3 =
                                                      selectedUploadedFiles
                                                          .first;
                                                });
                                              } else {
                                                setState(() {});
                                                return;
                                              }
                                            }

                                            _model.apiImageUploadResult4 =
                                                await ImgbbGroup.imageUploadCall
                                                    .call(
                                              image: _model.uploadedLocalFile2,
                                            );
                                            if ((_model.apiImageUploadResult4
                                                    ?.succeeded ??
                                                true)) {
                                              setState(() {
                                                FFAppState().prodImg4 =
                                                    ImgbbGroup.imageUploadCall
                                                        .uImageUrl(
                                                  (_model.apiImageUploadResult4
                                                          ?.jsonBody ??
                                                      ''),
                                                );
                                              });
                                              ScaffoldMessenger.of(context)
                                                  .clearSnackBars();
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Imagem enviada com sucesso',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .tertiary400,
                                                ),
                                              );
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: Text('Mensagem'),
                                                    content: Text(
                                                        'Nos desculpe :-( Tente novamente mais tarde...'),
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
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 5.0, 5.0, 5.0),
                              child: InkWell(
                                onTap: () async {
                                  FFAppState().update(() {
                                    FFAppState().prodCondicao = 'Usado';
                                  });
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.of(context).viewInsets,
                                        child: GeneroWidget(),
                                      );
                                    },
                                  ).then((value) => setState(() {}));
                                },
                                child: Container(
                                  width: 103.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEEEEEE),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Stack(
                                    children: [
                                      Image.network(
                                        ImgbbGroup.imageUploadCall.uImageUrl(
                                                  (_model.apiImageUploadResult5
                                                          ?.jsonBody ??
                                                      ''),
                                                ) !=
                                                null
                                            ? ImgbbGroup.imageUploadCall
                                                .uImageUrl(
                                                (_model.apiImageUploadResult2
                                                        ?.jsonBody ??
                                                    ''),
                                              )
                                            : 'https://picsum.photos/seed/285/600',
                                        width: 100.0,
                                        height: 100.0,
                                        fit: BoxFit.cover,
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-0.18, -0.14),
                                        child: FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30.0,
                                          borderWidth: 1.0,
                                          buttonSize: 60.0,
                                          fillColor: Color(0x3E57636C),
                                          icon: Icon(
                                            Icons.camera_alt,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            size: 30.0,
                                          ),
                                          onPressed: () async {
                                            final selectedMedia =
                                                await selectMedia(
                                              mediaSource:
                                                  MediaSource.photoGallery,
                                              multiImage: false,
                                            );
                                            if (selectedMedia != null &&
                                                selectedMedia.every((m) =>
                                                    validateFileFormat(
                                                        m.storagePath,
                                                        context))) {
                                              setState(() => _model
                                                  .isMediaUploading4 = true);
                                              var selectedUploadedFiles =
                                                  <FFUploadedFile>[];

                                              try {
                                                selectedUploadedFiles =
                                                    selectedMedia
                                                        .map((m) =>
                                                            FFUploadedFile(
                                                              name: m
                                                                  .storagePath
                                                                  .split('/')
                                                                  .last,
                                                              bytes: m.bytes,
                                                              height: m
                                                                  .dimensions
                                                                  ?.height,
                                                              width: m
                                                                  .dimensions
                                                                  ?.width,
                                                            ))
                                                        .toList();
                                              } finally {
                                                _model.isMediaUploading4 =
                                                    false;
                                              }
                                              if (selectedUploadedFiles
                                                      .length ==
                                                  selectedMedia.length) {
                                                setState(() {
                                                  _model.uploadedLocalFile4 =
                                                      selectedUploadedFiles
                                                          .first;
                                                });
                                              } else {
                                                setState(() {});
                                                return;
                                              }
                                            }

                                            _model.apiImageUploadResult5 =
                                                await ImgbbGroup.imageUploadCall
                                                    .call(
                                              image: _model.uploadedLocalFile4,
                                            );
                                            if ((_model.apiImageUploadResult5
                                                    ?.succeeded ??
                                                true)) {
                                              setState(() {
                                                FFAppState().prodImg5 =
                                                    FFAppState().prodImg5;
                                              });
                                              ScaffoldMessenger.of(context)
                                                  .clearSnackBars();
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Imagem enviada com sucesso',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .tertiary400,
                                                ),
                                              );
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: Text('Mensagem'),
                                                    content: Text(
                                                        'Nos desculpe :-( Tente novamente mais tarde...'),
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
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      _model.produtoCadastrado = await CriarProdutoCall.call(
                        nome: FFAppState().prodNome,
                        descricao: FFAppState().prodDescricao,
                        quantidade: FFAppState().prodQtd,
                        preco: FFAppState().prodPreco,
                        categoria: FFAppState().prodCategoria,
                        tamanho: FFAppState().prodTamanho,
                        genero: FFAppState().prodGenero,
                        marca: FFAppState().prodMarca,
                        vendedorId: FFAppState().userid,
                        condicao: FFAppState().prodCondicao,
                        cor: FFAppState().prodCor,
                        imagem2: FFAppState().prodImg2,
                        imagem3: FFAppState().prodImg3,
                        imagem4: FFAppState().prodImg4,
                        imagem5: FFAppState().prodImg5,
                        imagem1: FFAppState().prodImg1,
                      );
                      if ((_model.produtoCadastrado?.succeeded ?? true)) {
                        _model.produto = await ProdutosByIdCall.call(
                          id: CriarProdutoCall.id(
                            (_model.produtoCadastrado?.jsonBody ?? ''),
                          ).toString(),
                        );
                        await Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            duration: Duration(milliseconds: 300),
                            reverseDuration: Duration(milliseconds: 300),
                            child: ProdutoWidget(
                              produto: ProdutosByIdCall.allFields(
                                (_model.produto?.jsonBody ?? ''),
                              ),
                            ),
                          ),
                        );
                      }

                      setState(() {});
                    },
                    text: 'Salvar',
                    options: FFButtonOptions(
                      width: 250.0,
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Color(0xFF886BC7),
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
