import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/chat/chat_widget.dart';
import '/pages/produto/produto_widget.dart';
import '/pages/profile_edit/profile_edit_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profile_model.dart';
export 'profile_model.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({
    Key? key,
    this.user,
  }) : super(key: key);

  final dynamic user;

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  late ProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileModel());

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

    return FutureBuilder<ApiCallResponse>(
      future: ProdutosNovidadesPorVendedorCall.call(
        constraints:
            '%5B%7B%22key%22%3A%22is_marketplace%22%2C%22constraint_type%22%3A%22equals%22%2C%22value%22%3A%22true%22%7D%2C%7B%22key%22%3A%22Status%22%2C%22constraint_type%22%3A%22equals%22%2C%22value%22%3A%221638810592650x910538349165423400%22%7D%2C%7B%22key%22%3A%22Quantidade%22%2C%22constraint_type%22%3A%22greater%20than%22%2C%22value%22%3A%220%22%7D%2C%7B%22key%22%3A%22Vendedor%22%2C%22constraint_type%22%3A%22equals%22%2C%22value%22%3A%22${getJsonField(
          widget.user,
          r'''$.response._id''',
        ).toString()}%22%7D%5D',
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
        final profileProdutosNovidadesPorVendedorResponse = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(45.0),
            child: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
              automaticallyImplyLeading: false,
              leading: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 60.0,
                    fillColor: Color(0x00886BC7),
                    icon: Icon(
                      Icons.arrow_back_outlined,
                      color: FlutterFlowTheme.of(context).primaryColor,
                      size: 30.0,
                    ),
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    getJsonField(
                      widget.user,
                      r'''$.response.Slug''',
                    ).toString(),
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                ],
              ),
              actions: [],
              flexibleSpace: FlexibleSpaceBar(
                title: Align(
                  alignment: AlignmentDirectional(1.0, 0.0),
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 60.0,
                    icon: FaIcon(
                      FontAwesomeIcons.solidBell,
                      color: FlutterFlowTheme.of(context).primaryColor,
                      size: 30.0,
                    ),
                    onPressed: () {
                      print('IconButton pressed ...');
                    },
                  ),
                ),
                centerTitle: true,
                expandedTitleScale: 1.0,
              ),
              elevation: 0.0,
            ),
          ),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FutureBuilder<ApiCallResponse>(
                      future: (_model.apiRequestCompleter1 ??= Completer<
                              ApiCallResponse>()
                            ..complete(FollowUnfollowGroup.followersCall.call(
                              vendedorID: getJsonField(
                                widget.user,
                                r'''$.response._id''',
                              ).toString(),
                              clienteID: FFAppState().userid,
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
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                              ),
                            ),
                          );
                        }
                        final containerFollowersResponse = snapshot.data!;
                        return Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 5.0,
                                color: Color(0x230F1113),
                                offset: Offset(0.0, 2.0),
                              )
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 5.0, 5.0, 5.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 80.0,
                                          height: 80.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .lineColor,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    2.0, 2.0, 2.0, 2.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(60.0),
                                              child: Image.network(
                                                valueOrDefault<String>(
                                                  getJsonField(
                                                    widget.user,
                                                    r'''$.response.Foto''',
                                                  ),
                                                  'https://conteudo.imguol.com.br/blogs/174/files/2018/05/iStock-648229868-1024x909.jpg',
                                                ),
                                                width: 80.0,
                                                height: 80.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 10.0, 10.0, 2.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  5.0,
                                                                  5.0,
                                                                  5.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            functions
                                                                .somaQuantidade(
                                                                    ProdutosNovidadesPorVendedorCall
                                                                        .qtd1(
                                                                      profileProdutosNovidadesPorVendedorResponse
                                                                          .jsonBody,
                                                                    ),
                                                                    ProdutosNovidadesPorVendedorCall
                                                                        .qtd2(
                                                                      profileProdutosNovidadesPorVendedorResponse
                                                                          .jsonBody,
                                                                    ))
                                                                .toString(),
                                                            textAlign: TextAlign
                                                                .center,
                                                            maxLines: 1,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontSize:
                                                                      18.0,
                                                                ),
                                                          ),
                                                          Text(
                                                            'Desapegos',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  5.0,
                                                                  5.0,
                                                                  5.0),
                                                      child: FutureBuilder<
                                                          ApiCallResponse>(
                                                        future: FollowUnfollowGroup
                                                            .followersCountCall
                                                            .call(
                                                          vendedorID:
                                                              getJsonField(
                                                            widget.user,
                                                            r'''$.response._id''',
                                                          ).toString(),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50.0,
                                                                height: 50.0,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          final columnFollowersCountResponse =
                                                              snapshot.data!;
                                                          return Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                FollowUnfollowGroup
                                                                    .followersCountCall
                                                                    .qtdSeguidores(
                                                                      columnFollowersCountResponse
                                                                          .jsonBody,
                                                                    )
                                                                    .toString(),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                maxLines: 1,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          18.0,
                                                                    ),
                                                              ),
                                                              Text(
                                                                'Seguidores',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1,
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 5.0, 5.0, 5.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      if (getJsonField(
                                                            widget.user,
                                                            r'''$.response._id''',
                                                          ) !=
                                                          FFAppState().userid)
                                                        Expanded(
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -0.75, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          10.0,
                                                                          10.0,
                                                                          10.0),
                                                              child:
                                                                  FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  _model.apiResultw9i =
                                                                      await FollowUnfollowGroup
                                                                          .followCall
                                                                          .call(
                                                                    vendedorID:
                                                                        getJsonField(
                                                                      widget
                                                                          .user,
                                                                      r'''$.response._id''',
                                                                    ).toString(),
                                                                    seguidorID:
                                                                        FFAppState()
                                                                            .userid,
                                                                  );
                                                                  if (FollowUnfollowGroup
                                                                      .followersCall
                                                                      .seguidor(
                                                                    containerFollowersResponse
                                                                        .jsonBody,
                                                                  )) {
                                                                    setState(() =>
                                                                        _model.apiRequestCompleter1 =
                                                                            null);
                                                                    await _model
                                                                        .waitForApiRequestCompleted1();
                                                                    setState(
                                                                        () {});
                                                                  } else {
                                                                    setState(() =>
                                                                        _model.apiRequestCompleter1 =
                                                                            null);
                                                                    await _model
                                                                        .waitForApiRequestCompleted1();
                                                                    setState(
                                                                        () {});
                                                                  }

                                                                  setState(
                                                                      () {});
                                                                },
                                                                text: FollowUnfollowGroup
                                                                        .followersCall
                                                                        .seguidor(
                                                                  containerFollowersResponse
                                                                      .jsonBody,
                                                                )
                                                                    ? 'Seguindo'
                                                                    : 'Seguir',
                                                                options:
                                                                    FFButtonOptions(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 30.0,
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  iconPadding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: FollowUnfollowGroup
                                                                          .followersCall
                                                                          .seguidor(
                                                                    containerFollowersResponse
                                                                        .jsonBody,
                                                                  )
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .white
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryColor,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .subtitle2
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: FollowUnfollowGroup.followersCall.seguidor(
                                                                          containerFollowersResponse
                                                                              .jsonBody,
                                                                        )
                                                                            ? FlutterFlowTheme.of(context).primaryColor
                                                                            : FlutterFlowTheme.of(context).white,
                                                                      ),
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      if (getJsonField(
                                                            widget.user,
                                                            r'''$.response._id''',
                                                          ) !=
                                                          FFAppState().userid)
                                                        Expanded(
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -0.75, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          10.0,
                                                                          10.0,
                                                                          10.0),
                                                              child:
                                                                  FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  await Navigator
                                                                      .push(
                                                                    context,
                                                                    PageTransition(
                                                                      type: PageTransitionType
                                                                          .fade,
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              300),
                                                                      reverseDuration:
                                                                          Duration(
                                                                              milliseconds: 300),
                                                                      child:
                                                                          ChatWidget(
                                                                        vendedorID:
                                                                            getJsonField(
                                                                          widget
                                                                              .user,
                                                                          r'''$.response._id''',
                                                                        ).toString(),
                                                                        clienteID:
                                                                            FFAppState().userid,
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                                text:
                                                                    'Mensagem',
                                                                options:
                                                                    FFButtonOptions(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 30.0,
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  iconPadding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .subtitle2
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      if (getJsonField(
                                                            widget.user,
                                                            r'''$.response._id''',
                                                          ) ==
                                                          FFAppState().userid)
                                                        Expanded(
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -0.75, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          10.0,
                                                                          10.0,
                                                                          10.0),
                                                              child:
                                                                  FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  await Navigator
                                                                      .push(
                                                                    context,
                                                                    PageTransition(
                                                                      type: PageTransitionType
                                                                          .fade,
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              300),
                                                                      reverseDuration:
                                                                          Duration(
                                                                              milliseconds: 300),
                                                                      child:
                                                                          ProfileEditWidget(
                                                                        user: widget
                                                                            .user,
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                                text: 'Editar',
                                                                options:
                                                                    FFButtonOptions(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 30.0,
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  iconPadding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .subtitle2
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
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
                                        Container(
                                          height: 32.0,
                                          constraints: BoxConstraints(
                                            maxHeight: 32.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryColor,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 4.0,
                                                color: Color(0x32171717),
                                                offset: Offset(0.0, 2.0),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              getJsonField(
                                                widget.user,
                                                r'''$.response.Nome''',
                                              ).toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              getJsonField(
                                                widget.user,
                                                r'''$.response.Bio''',
                                              ).toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
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
                                    5.0, 5.0, 5.0, 5.0),
                                child: FutureBuilder<ApiCallResponse>(
                                  future: (_model.apiRequestCompleter2 ??=
                                          Completer<ApiCallResponse>()
                                            ..complete(
                                                ProdutosNovidadesPorVendedorCall
                                                    .call(
                                              constraints:
                                                  '%5B%7B%22key%22%3A%22is_marketplace%22%2C%22constraint_type%22%3A%22equals%22%2C%22value%22%3A%22true%22%7D%2C%7B%22key%22%3A%22Status%22%2C%22constraint_type%22%3A%22equals%22%2C%22value%22%3A%221638810592650x910538349165423400%22%7D%2C%7B%22key%22%3A%22Quantidade%22%2C%22constraint_type%22%3A%22greater%20than%22%2C%22value%22%3A%220%22%7D%2C%7B%22key%22%3A%22Vendedor%22%2C%22constraint_type%22%3A%22equals%22%2C%22value%22%3A%22${getJsonField(
                                                widget.user,
                                                r'''$.response._id''',
                                              ).toString()}%22%7D%5D',
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
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                          ),
                                        ),
                                      );
                                    }
                                    final listViewProdutosNovidadesPorVendedorResponse =
                                        snapshot.data!;
                                    return RefreshIndicator(
                                      onRefresh: () async {
                                        setState(() =>
                                            _model.apiRequestCompleter2 = null);
                                        await _model
                                            .waitForApiRequestCompleted2();
                                      },
                                      child: ListView(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        children: [
                                          Builder(
                                            builder: (context) {
                                              final gridListProdutos =
                                                  ProdutosNovidadesPorVendedorCall
                                                          .allFields(
                                                        listViewProdutosNovidadesPorVendedorResponse
                                                            .jsonBody,
                                                      )?.toList() ??
                                                      [];
                                              return GridView.builder(
                                                padding: EdgeInsets.zero,
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2,
                                                  crossAxisSpacing: 10.0,
                                                  mainAxisSpacing: 10.0,
                                                  childAspectRatio: 1.0,
                                                ),
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    gridListProdutos.length,
                                                itemBuilder: (context,
                                                    gridListProdutosIndex) {
                                                  final gridListProdutosItem =
                                                      gridListProdutos[
                                                          gridListProdutosIndex];
                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: InkWell(
                                                          onTap: () async {
                                                            await Navigator
                                                                .push(
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
                                                                child:
                                                                    ProdutoWidget(
                                                                  produto:
                                                                      gridListProdutosItem,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                          child:
                                                              CachedNetworkImage(
                                                            imageUrl: functions
                                                                .imageCompress(
                                                                    getJsonField(
                                                              gridListProdutosItem,
                                                              r'''$.ImagemRemota[0]''',
                                                            ).toString())!,
                                                            width:
                                                                double.infinity,
                                                            height:
                                                                double.infinity,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
