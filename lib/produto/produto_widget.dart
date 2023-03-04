import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/login/login_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'produto_model.dart';
export 'produto_model.dart';

class ProdutoWidget extends StatefulWidget {
  const ProdutoWidget({
    Key? key,
    this.produto,
  }) : super(key: key);

  final dynamic produto;

  @override
  _ProdutoWidgetState createState() => _ProdutoWidgetState();
}

class _ProdutoWidgetState extends State<ProdutoWidget> {
  late ProdutoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProdutoModel());

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

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Stack(
                          alignment: AlignmentDirectional(0.0, -1.0),
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.85),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 470.0, 0.0, 0.0),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 1.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 3.0,
                                        color: Color(0x430F1113),
                                        offset: Offset(0.0, -2.0),
                                      )
                                    ],
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0),
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 5.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                child: AutoSizeText(
                                                  getJsonField(
                                                    widget.produto,
                                                    r'''$.Nome''',
                                                  ).toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .title2
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            Color(0xFF3C3462),
                                                        fontSize: 26.0,
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
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height * 0.58,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEEEEEE),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (getJsonField(
                                          widget.produto,
                                          r'''$..ImagemRemota[0]''',
                                        ) !=
                                        null)
                                      Expanded(
                                        child: Builder(
                                          builder: (context) {
                                            final imagens = getJsonField(
                                              widget.produto,
                                              r'''$..ImagemRemota''',
                                            ).toList();
                                            return GridView.builder(
                                              padding: EdgeInsets.zero,
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 1,
                                                crossAxisSpacing: 10.0,
                                                mainAxisSpacing: 10.0,
                                                childAspectRatio: 1.2,
                                              ),
                                              scrollDirection: Axis.horizontal,
                                              itemCount: imagens.length,
                                              itemBuilder:
                                                  (context, imagensIndex) {
                                                final imagensItem =
                                                    imagens[imagensIndex];
                                                return Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Image.network(
                                                        functions.imageCompress(
                                                            getJsonField(
                                                          imagensItem,
                                                          r'''$''',
                                                        ).toString())!,
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            1.0,
                                                        height: double.infinity,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    if (getJsonField(
                                          widget.produto,
                                          r'''$..ImagemFirebase[0]''',
                                        ) !=
                                        null)
                                      Expanded(
                                        child: Builder(
                                          builder: (context) {
                                            final imagens = getJsonField(
                                              widget.produto,
                                              r'''$..ImagemRemota''',
                                            ).toList();
                                            return GridView.builder(
                                              padding: EdgeInsets.zero,
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 1,
                                                crossAxisSpacing: 10.0,
                                                mainAxisSpacing: 10.0,
                                                childAspectRatio: 1.2,
                                              ),
                                              scrollDirection: Axis.horizontal,
                                              itemCount: imagens.length,
                                              itemBuilder:
                                                  (context, imagensIndex) {
                                                final imagensItem =
                                                    imagens[imagensIndex];
                                                return Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Image.network(
                                                        getJsonField(
                                                          imagensItem,
                                                          r'''$''',
                                                        ),
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            1.0,
                                                        height: double.infinity,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 34.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 0.0, 0.0),
                                      child: FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 30.0,
                                        buttonSize: 48.0,
                                        fillColor: Color(0x7F00000F),
                                        icon: Icon(
                                          Icons.arrow_back_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .grayIcon,
                                          size: 30.0,
                                        ),
                                        onPressed: () async {
                                          Navigator.pop(context);
                                        },
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
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 1.0,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                      child: AutoSizeText(
                        'R\$ ${functions.transformString(getJsonField(
                          widget.produto,
                          r'''$..Preco''',
                        ).toString())}',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              color:
                                  FlutterFlowTheme.of(context).secondaryColor,
                              fontSize: 18.0,
                            ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                      child: InkWell(
                        onTap: () async {
                          scaffoldKey.currentState!.openEndDrawer();
                        },
                        child: AutoSizeText(
                          getJsonField(
                            widget.produto,
                            r'''$.Descricao''',
                          ).toString(),
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
              child: Container(
                width: 160.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25.0),
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: Color(0xFF9E9E9E),
                    width: 1.0,
                  ),
                ),
                child: FlutterFlowCountController(
                  decrementIconBuilder: (enabled) => FaIcon(
                    FontAwesomeIcons.minus,
                    color: enabled ? Color(0xDD000000) : Color(0xFFEEEEEE),
                    size: 20.0,
                  ),
                  incrementIconBuilder: (enabled) => FaIcon(
                    FontAwesomeIcons.plus,
                    color: enabled ? Colors.blue : Color(0xFFEEEEEE),
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
                  count: _model.countControllerValue ??= 1,
                  updateCount: (count) =>
                      setState(() => _model.countControllerValue = count),
                  stepSize: 1,
                  minimum: 1,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(30.0, 5.0, 30.0, 30.0),
              child: FutureBuilder<ApiCallResponse>(
                future: UsersByIdCall.call(
                  id: getJsonField(
                    widget.produto,
                    r'''$.Vendedor''',
                  ).toString(),
                ),
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
                  final buttonUsersByIdResponse = snapshot.data!;
                  return FFButtonWidget(
                    onPressed: () async {
                      _model.apiResulthdk =
                          await MegaApiGroup.enviarMensagemCall.call(
                        jid: '5511964591802@s.whatsapp.net',
                        body:
                            'O cliente XXXXX está interessado no produto XXXXXX Entre em contato agora mesmo pelo WhatsApp XXXXXX',
                      );
                      if ((_model.apiResulthdk?.succeeded ?? true)) {
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: Text('Sucesso!'),
                              content: Text(
                                  'O vendedor recebeu sua mensagem e entrará em contato assim que possível.k'),
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
                      } else {
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: Text('Erro'),
                              content: Text(
                                  'Sinto muito pelo ocorrido. Infelizmente, não foi possível enviar sua mensagem neste momento. Por favor, tente novamente em alguns instantes.'),
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
                    text: 'Está disponível?',
                    icon: FaIcon(
                      FontAwesomeIcons.whatsapp,
                    ),
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).tertiary400,
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
