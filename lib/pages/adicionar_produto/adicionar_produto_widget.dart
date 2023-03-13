import '/backend/api_requests/api_calls.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/categoria/categoria_widget.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_media.dart';
import '/main.dart';
import '/pages/login/login_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'adicionar_produto_model.dart';
export 'adicionar_produto_model.dart';

class AdicionarProdutoWidget extends StatefulWidget {
  const AdicionarProdutoWidget({Key? key}) : super(key: key);

  @override
  _AdicionarProdutoWidgetState createState() => _AdicionarProdutoWidgetState();
}

class _AdicionarProdutoWidgetState extends State<AdicionarProdutoWidget> {
  late AdicionarProdutoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdicionarProdutoModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (!FFAppState().logged) {
        await Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.rightToLeft,
            duration: Duration(milliseconds: 300),
            reverseDuration: Duration(milliseconds: 300),
            child: LoginWidget(),
          ),
        );
      }
    });

    _model.nomedoprodutoController ??= TextEditingController();
    _model.descricaoController ??= TextEditingController();
    _model.precoController ??= TextEditingController();
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
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            alignment: AlignmentDirectional(0.0, -1.0),
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Image.network(
                  valueOrDefault<String>(
                    ImgGroup.imageUploadCall.imgUrl(
                      (_model.apiImageUploadResult?.jsonBody ?? ''),
                    ),
                    'https://picsum.photos/seed/403/600',
                  ),
                  width: double.infinity,
                  height: 500.0,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 100.0, 0.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 300.0, 0.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            height: 450.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4.0,
                                  color: Color(0x320E151B),
                                  offset: Offset(0.0, -2.0),
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
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 10.0),
                                            child: Autocomplete<String>(
                                              initialValue: TextEditingValue(),
                                              optionsBuilder:
                                                  (textEditingValue) {
                                                if (textEditingValue.text ==
                                                    '') {
                                                  return const Iterable<
                                                      String>.empty();
                                                }
                                                return ['Option 1']
                                                    .where((option) {
                                                  final lowercaseOption =
                                                      option.toLowerCase();
                                                  return lowercaseOption
                                                      .contains(textEditingValue
                                                          .text
                                                          .toLowerCase());
                                                });
                                              },
                                              optionsViewBuilder: (context,
                                                  onSelected, options) {
                                                return AutocompleteOptionsList(
                                                  textFieldKey:
                                                      _model.nomedoprodutoKey,
                                                  textController: _model
                                                      .nomedoprodutoController!,
                                                  options: options.toList(),
                                                  onSelected: onSelected,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyText1,
                                                  textHighlightStyle:
                                                      TextStyle(),
                                                  elevation: 4.0,
                                                  optionBackgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                  optionHighlightColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  maxHeight: 200.0,
                                                );
                                              },
                                              onSelected: (String selection) {
                                                setState(() => _model
                                                        .nomedoprodutoSelectedOption =
                                                    selection);
                                                FocusScope.of(context)
                                                    .unfocus();
                                              },
                                              fieldViewBuilder: (
                                                context,
                                                textEditingController,
                                                focusNode,
                                                onEditingComplete,
                                              ) {
                                                _model.nomedoprodutoController =
                                                    textEditingController;
                                                return TextFormField(
                                                  key: _model.nomedoprodutoKey,
                                                  controller:
                                                      textEditingController,
                                                  focusNode: focusNode,
                                                  onEditingComplete:
                                                      onEditingComplete,
                                                  textCapitalization:
                                                      TextCapitalization.words,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    hintText:
                                                        'Nome  do produto...',
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .title1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                        ),
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                    focusedBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                    errorBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                    focusedErrorBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .title1,
                                                  validator: _model
                                                      .nomedoprodutoControllerValidator
                                                      .asValidator(context),
                                                  inputFormatters: [
                                                    FilteringTextInputFormatter
                                                        .allow(RegExp(
                                                            '[a-zA-Z0-9]'))
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: TextFormField(
                                            controller:
                                                _model.descricaoController,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.descricaoController',
                                              Duration(milliseconds: 2000),
                                              () => setState(() {}),
                                            ),
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              hintText: 'Descrição...',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                            maxLines: 7,
                                            keyboardType:
                                                TextInputType.multiline,
                                            validator: _model
                                                .descricaoControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 5.0, 0.0),
                                          child: Container(
                                            width: 160.0,
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                              shape: BoxShape.rectangle,
                                              border: Border.all(
                                                color: Color(0xFF9E9E9E),
                                                width: 1.0,
                                              ),
                                            ),
                                            child: FlutterFlowCountController(
                                              decrementIconBuilder: (enabled) =>
                                                  FaIcon(
                                                FontAwesomeIcons.minus,
                                                color: enabled
                                                    ? Color(0xDD000000)
                                                    : Color(0xFFEEEEEE),
                                                size: 20.0,
                                              ),
                                              incrementIconBuilder: (enabled) =>
                                                  FaIcon(
                                                FontAwesomeIcons.plus,
                                                color: enabled
                                                    ? Colors.blue
                                                    : Color(0xFFEEEEEE),
                                                size: 20.0,
                                              ),
                                              countBuilder: (count) => Text(
                                                count.toString(),
                                                style: GoogleFonts.getFont(
                                                  'Roboto',
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16.0,
                                                ),
                                              ),
                                              count: _model
                                                  .countControllerValue ??= 1,
                                              updateCount: (count) => setState(
                                                  () => _model
                                                          .countControllerValue =
                                                      count),
                                              stepSize: 1,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 10.0),
                                            child: Autocomplete<String>(
                                              initialValue: TextEditingValue(),
                                              optionsBuilder:
                                                  (textEditingValue) {
                                                if (textEditingValue.text ==
                                                    '') {
                                                  return const Iterable<
                                                      String>.empty();
                                                }
                                                return ['Option 1']
                                                    .where((option) {
                                                  final lowercaseOption =
                                                      option.toLowerCase();
                                                  return lowercaseOption
                                                      .contains(textEditingValue
                                                          .text
                                                          .toLowerCase());
                                                });
                                              },
                                              optionsViewBuilder: (context,
                                                  onSelected, options) {
                                                return AutocompleteOptionsList(
                                                  textFieldKey: _model.precoKey,
                                                  textController:
                                                      _model.precoController!,
                                                  options: options.toList(),
                                                  onSelected: onSelected,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyText1,
                                                  textHighlightStyle:
                                                      TextStyle(),
                                                  elevation: 4.0,
                                                  optionBackgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                  optionHighlightColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  maxHeight: 200.0,
                                                );
                                              },
                                              onSelected: (String selection) {
                                                setState(() =>
                                                    _model.precoSelectedOption =
                                                        selection);
                                                FocusScope.of(context)
                                                    .unfocus();
                                              },
                                              fieldViewBuilder: (
                                                context,
                                                textEditingController,
                                                focusNode,
                                                onEditingComplete,
                                              ) {
                                                _model.precoController =
                                                    textEditingController;
                                                return TextFormField(
                                                  key: _model.precoKey,
                                                  controller:
                                                      textEditingController,
                                                  focusNode: focusNode,
                                                  onEditingComplete:
                                                      onEditingComplete,
                                                  textCapitalization:
                                                      TextCapitalization.none,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText: 'Preço',
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                    focusedBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                    errorBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                    focusedErrorBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                    prefixIcon: Icon(
                                                      Icons.money_outlined,
                                                    ),
                                                    suffixIcon: Icon(
                                                      Icons.threesixty_rounded,
                                                      color: Color(0xFF757575),
                                                      size: 22.0,
                                                    ),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 22.0,
                                                      ),
                                                  textAlign: TextAlign.end,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  validator: _model
                                                      .precoControllerValidator
                                                      .asValidator(context),
                                                  inputFormatters: [
                                                    _model.precoMask
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  40.0, 10.0, 40.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              FFAppState().update(() {
                                                FFAppState().prodNome = _model
                                                    .nomedoprodutoController
                                                    .text;
                                                FFAppState().prodDescricao =
                                                    _model.descricaoController
                                                        .text;
                                              });
                                              FFAppState().update(() {
                                                FFAppState().prodPreco =
                                                    double.parse(_model
                                                        .precoController.text);
                                              });
                                              FFAppState().update(() {
                                                FFAppState().prodQtd = _model
                                                    .countControllerValue!;
                                              });
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                context: context,
                                                builder: (context) {
                                                  return Padding(
                                                    padding:
                                                        MediaQuery.of(context)
                                                            .viewInsets,
                                                    child: CategoriaWidget(),
                                                  );
                                                },
                                              ).then(
                                                  (value) => setState(() {}));
                                            },
                                            text: 'Continuar',
                                            options: FFButtonOptions(
                                              width: 130.0,
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Color(0xFF886BC7),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                      ),
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.92, -0.99),
                child: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 60.0,
                  fillColor: Color(0x5557636C),
                  icon: Icon(
                    Icons.close_rounded,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        duration: Duration(milliseconds: 300),
                        reverseDuration: Duration(milliseconds: 300),
                        child: NavBarPage(initialPage: 'Feed'),
                      ),
                    );
                  },
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.11, -0.57),
                child: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 200.0,
                  icon: Icon(
                    Icons.photo_camera,
                    color: Color(0xB9262D34),
                    size: 200.0,
                  ),
                  showLoadingIndicator: true,
                  onPressed: () async {
                    final selectedMedia = await selectMedia(
                      mediaSource: MediaSource.photoGallery,
                      multiImage: false,
                    );
                    if (selectedMedia != null &&
                        selectedMedia.every((m) =>
                            validateFileFormat(m.storagePath, context))) {
                      setState(() => _model.isMediaUploading = true);
                      var selectedUploadedFiles = <FFUploadedFile>[];
                      var downloadUrls = <String>[];
                      try {
                        showUploadMessage(
                          context,
                          'Enviando...',
                          showLoading: true,
                        );
                        selectedUploadedFiles = selectedMedia
                            .map((m) => FFUploadedFile(
                                  name: m.storagePath.split('/').last,
                                  bytes: m.bytes,
                                  height: m.dimensions?.height,
                                  width: m.dimensions?.width,
                                ))
                            .toList();

                        downloadUrls = (await Future.wait(
                          selectedMedia.map(
                            (m) async =>
                                await uploadData(m.storagePath, m.bytes),
                          ),
                        ))
                            .where((u) => u != null)
                            .map((u) => u!)
                            .toList();
                      } finally {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        _model.isMediaUploading = false;
                      }
                      if (selectedUploadedFiles.length ==
                              selectedMedia.length &&
                          downloadUrls.length == selectedMedia.length) {
                        setState(() {
                          _model.uploadedLocalFile =
                              selectedUploadedFiles.first;
                          _model.uploadedFileUrl = downloadUrls.first;
                        });
                        showUploadMessage(context, 'Sucesso!');
                      } else {
                        setState(() {});
                        showUploadMessage(context, 'Falha ao enviar mídia.');
                        return;
                      }
                    }

                    _model.apiImageUploadResult =
                        await ImgGroup.imageUploadCall.call(
                      image: _model.uploadedFileUrl,
                    );
                    if ((_model.apiImageUploadResult?.succeeded ?? true)) {
                      setState(() {
                        FFAppState().prodImg1 = ImgGroup.imageUploadCall.imgUrl(
                          (_model.apiImageUploadResult?.jsonBody ?? ''),
                        );
                      });
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Imagem enviada com sucesso!',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          duration: Duration(milliseconds: 4000),
                          backgroundColor:
                              FlutterFlowTheme.of(context).tertiary400,
                        ),
                      );
                    } else {
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: Text('Mensagem'),
                            content: Text('Tente mais tarde.'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext),
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
    );
  }
}
