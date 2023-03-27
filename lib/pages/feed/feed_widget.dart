import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main.dart';
import '/pages/adicionar_produto/adicionar_produto_widget.dart';
import '/pages/chat/chat_widget.dart';
import '/pages/login/login_widget.dart';
import '/pages/produto/produto_widget.dart';
import '/pages/profile/profile_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'feed_model.dart';
export 'feed_model.dart';

class FeedWidget extends StatefulWidget {
  const FeedWidget({Key? key}) : super(key: key);

  @override
  _FeedWidgetState createState() => _FeedWidgetState();
}

class _FeedWidgetState extends State<FeedWidget> with TickerProviderStateMixin {
  late FeedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  final animationsMap = {
    'iconButtonOnActionTriggerAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        ScaleEffect(
          curve: Curves.bounceOut,
          delay: 370.ms,
          duration: 280.ms,
          begin: 1.0,
          end: 1.5,
        ),
        BlurEffect(
          curve: Curves.easeInOut,
          delay: 650.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 4.0,
        ),
      ],
    ),
    'iconButtonOnActionTriggerAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        ScaleEffect(
          curve: Curves.bounceOut,
          delay: 370.ms,
          duration: 280.ms,
          begin: 1.0,
          end: 1.5,
        ),
        BlurEffect(
          curve: Curves.easeInOut,
          delay: 650.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 4.0,
        ),
      ],
    ),
    'textOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(-67.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(-72.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(-63.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FeedModel());

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

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 5.0, 0.0, 5.0),
                          child: Image.network(
                            'https://i.ibb.co/3NMtq69/Logo-Horizontal.jpg',
                            width: MediaQuery.of(context).size.width * 0.8,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      FlutterFlowIconButton(
                        borderColor: FlutterFlowTheme.of(context).noColor,
                        borderRadius: 5.0,
                        borderWidth: 2.0,
                        buttonSize: 40.0,
                        icon: Icon(
                          Icons.add,
                          color: Color(0xFF886BC7),
                          size: 20.0,
                        ),
                        onPressed: () async {
                          await Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.fade,
                              duration: Duration(milliseconds: 200),
                              reverseDuration: Duration(milliseconds: 200),
                              child: AdicionarProdutoWidget(),
                            ),
                          );
                        },
                      ),
                      FlutterFlowIconButton(
                        borderColor: FlutterFlowTheme.of(context).noColor,
                        borderRadius: 20.0,
                        borderWidth: 2.0,
                        buttonSize: 40.0,
                        icon: Icon(
                          Icons.search,
                          color: Color(0xFF886BC7),
                          size: 20.0,
                        ),
                        onPressed: () async {
                          await Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.fade,
                              duration: Duration(milliseconds: 200),
                              reverseDuration: Duration(milliseconds: 200),
                              child: NavBarPage(initialPage: 'Explore'),
                            ),
                          );
                        },
                      ),
                      FlutterFlowIconButton(
                        borderColor: FlutterFlowTheme.of(context).noColor,
                        borderRadius: 20.0,
                        borderWidth: 2.0,
                        buttonSize: 40.0,
                        icon: Icon(
                          Icons.person,
                          color: Color(0xFF886BC7),
                          size: 20.0,
                        ),
                        onPressed: () async {
                          _model.apiResultvg9 = await UsersByIdCall.call(
                            id: FFAppState().userid,
                          );
                          if ((_model.apiResultvg9?.succeeded ?? true)) {
                            await Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.fade,
                                duration: Duration(milliseconds: 300),
                                reverseDuration: Duration(milliseconds: 300),
                                child: ProfileWidget(
                                  user: getJsonField(
                                    (_model.apiResultvg9?.jsonBody ?? ''),
                                    r'''$''',
                                  ),
                                ),
                              ),
                            );
                          }

                          setState(() {});
                        },
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderColor: FlutterFlowTheme.of(context).noColor,
                          borderRadius: 20.0,
                          borderWidth: 2.0,
                          buttonSize: 40.0,
                          icon: Icon(
                            Icons.chat,
                            color: Color(0xFF886BC7),
                            size: 20.0,
                          ),
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.fade,
                                duration: Duration(milliseconds: 200),
                                reverseDuration: Duration(milliseconds: 200),
                                child: NavBarPage(initialPage: 'ChatList'),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: FutureBuilder<ApiCallResponse>(
                  future: (_model.apiRequestCompleter1 ??=
                          Completer<ApiCallResponse>()
                            ..complete(ProdutosNovidadesCall.call()))
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
                    final listViewProdutosNovidadesResponse = snapshot.data!;
                    return Builder(
                      builder: (context) {
                        final produtos = ProdutosNovidadesCall.allFields(
                              listViewProdutosNovidadesResponse.jsonBody,
                            )?.toList() ??
                            [];
                        return RefreshIndicator(
                          onRefresh: () async {
                            setState(() => _model.apiRequestCompleter1 = null);
                            await _model.waitForApiRequestCompleted1();
                          },
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            primary: false,
                            scrollDirection: Axis.vertical,
                            itemCount: produtos.length,
                            itemBuilder: (context, produtosIndex) {
                              final produtosItem = produtos[produtosIndex];
                              return SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    FutureBuilder<ApiCallResponse>(
                                      future: UsersByIdCall.call(
                                        id: getJsonField(
                                          produtosItem,
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                              ),
                                            ),
                                          );
                                        }
                                        final rowProfilePicUsersByIdResponse =
                                            snapshot.data!;
                                        return InkWell(
                                          onTap: () async {
                                            await Navigator.push(
                                              context,
                                              PageTransition(
                                                type: PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 300),
                                                reverseDuration:
                                                    Duration(milliseconds: 300),
                                                child: ProfileWidget(
                                                  user:
                                                      rowProfilePicUsersByIdResponse
                                                          .jsonBody,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        2.0, 2.0, 2.0, 2.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          60.0),
                                                  child: CachedNetworkImage(
                                                    imageUrl:
                                                        valueOrDefault<String>(
                                                      UsersByIdCall.foto(
                                                        rowProfilePicUsersByIdResponse
                                                            .jsonBody,
                                                      ),
                                                      'https://conteudo.imguol.com.br/blogs/174/files/2018/05/iStock-648229868-1024x909.jpg',
                                                    ),
                                                    width: 35.0,
                                                    height: 35.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                UsersByIdCall.slug(
                                                  rowProfilePicUsersByIdResponse
                                                      .jsonBody,
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.58,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFEEEEEE),
                                            ),
                                            child: AnimatedContainer(
                                              duration:
                                                  Duration(milliseconds: 100),
                                              curve: Curves.easeIn,
                                              width: double.infinity,
                                              height: double.infinity,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Row(
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
                                                                        produtosItem,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              height: double
                                                                  .infinity,
                                                              child: custom_widgets
                                                                  .ImageSlider(
                                                                width: double
                                                                    .infinity,
                                                                height: double
                                                                    .infinity,
                                                                imageUrls:
                                                                    (getJsonField(
                                                                  produtosItem,
                                                                  r'''$..ImagemRemota''',
                                                                ) as List)
                                                                        .map<String>((s) =>
                                                                            s.toString())
                                                                        .toList()!
                                                                        .toList(),
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
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 5.0),
                                      child: FutureBuilder<ApiCallResponse>(
                                        future: (_model.apiRequestCompleter2 ??=
                                                Completer<ApiCallResponse>()
                                                  ..complete(UsersByIdCall.call(
                                                    id: FFAppState().userid,
                                                  )))
                                            .future,
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
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
                                          final rowLikesUsersByIdResponse =
                                              snapshot.data!;
                                          return Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: 100.0,
                                                height: 50.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    FlutterFlowIconButton(
                                                      borderColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .noColor,
                                                      borderRadius: 30.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 50.0,
                                                      icon: Icon(
                                                        Icons.favorite,
                                                        color: FFAppState()
                                                                .likedProds
                                                                .contains(
                                                                    getJsonField(
                                                                  produtosItem,
                                                                  r'''$._id''',
                                                                ))
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .customColor3
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                        size: 30.0,
                                                      ),
                                                      onPressed: () async {
                                                        if (!FFAppState()
                                                            .likedProds
                                                            .contains(
                                                                getJsonField(
                                                              produtosItem,
                                                              r'''$._id''',
                                                            ))) {
                                                          _model.apiResulttpe =
                                                              await DoLikeCall
                                                                  .call(
                                                            produtoId:
                                                                getJsonField(
                                                              produtosItem,
                                                              r'''$._id''',
                                                            ).toString(),
                                                            userId: FFAppState()
                                                                .userid,
                                                          );
                                                          setState(() => _model
                                                                  .apiRequestCompleter2 =
                                                              null);
                                                          await _model
                                                              .waitForApiRequestCompleted2();
                                                          setState(() => _model
                                                                  .apiRequestCompleter1 =
                                                              null);
                                                          await _model
                                                              .waitForApiRequestCompleted1();
                                                          setState(() {
                                                            FFAppState()
                                                                .addToLikedProds(
                                                                    getJsonField(
                                                              produtosItem,
                                                              r'''$._id''',
                                                            ).toString());
                                                          });
                                                        } else {
                                                          _model.apiResulttpe1 =
                                                              await DislikeCall
                                                                  .call(
                                                            produtoId:
                                                                getJsonField(
                                                              produtosItem,
                                                              r'''$._id''',
                                                            ).toString(),
                                                            userId: FFAppState()
                                                                .userid,
                                                          );
                                                          setState(() => _model
                                                                  .apiRequestCompleter2 =
                                                              null);
                                                          await _model
                                                              .waitForApiRequestCompleted2();
                                                          setState(() => _model
                                                                  .apiRequestCompleter1 =
                                                              null);
                                                          await _model
                                                              .waitForApiRequestCompleted1();
                                                          setState(() {
                                                            FFAppState()
                                                                .removeFromLikedProds(
                                                                    getJsonField(
                                                              produtosItem,
                                                              r'''$._id''',
                                                            ).toString());
                                                          });
                                                        }

                                                        setState(() {});
                                                      },
                                                    ).animateOnActionTrigger(
                                                      animationsMap[
                                                          'iconButtonOnActionTriggerAnimation1']!,
                                                    ),
                                                    FlutterFlowIconButton(
                                                      borderColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .noColor,
                                                      borderRadius: 30.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 50.0,
                                                      icon: Icon(
                                                        Icons
                                                            .chat_bubble_outline_outlined,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 30.0,
                                                      ),
                                                      onPressed: () async {
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
                                                            child: ChatWidget(
                                                              vendedorID:
                                                                  getJsonField(
                                                                produtosItem,
                                                                r'''$.Vendedor''',
                                                              ).toString(),
                                                              clienteID:
                                                                  FFAppState()
                                                                      .userid,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).animateOnActionTrigger(
                                                      animationsMap[
                                                          'iconButtonOnActionTriggerAnimation2']!,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 10.0, 0.0),
                                                child: Text(
                                                  '${getJsonField(
                                                    produtosItem,
                                                    r'''$.Like''',
                                                  ).toString()}${getJsonField(
                                                        produtosItem,
                                                        r'''$.Like''',
                                                      ) > 1 ? ' curtidas' : ' curtida'}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 5.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                1.0,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 5.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      getJsonField(
                                                        produtosItem,
                                                        r'''$.Marca''',
                                                      ).toString(),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyText1
                                                          .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            color: Color(
                                                                0xFF886BC7),
                                                            fontSize: 22.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ).animateOnPageLoad(
                                                        animationsMap[
                                                            'textOnPageLoadAnimation1']!),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 2.0, 5.0, 2.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      getJsonField(
                                                        produtosItem,
                                                        r'''$.Nome''',
                                                      ).toString(),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 20.0,
                                                              ),
                                                    ).animateOnPageLoad(
                                                        animationsMap[
                                                            'textOnPageLoadAnimation2']!),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 5.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      'R\$ ${functions.transformString(getJsonField(
                                                        produtosItem,
                                                        r'''$.Preco''',
                                                      ).toString())}',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Color(
                                                                    0xFF165550),
                                                                fontSize: 18.0,
                                                              ),
                                                    ).animateOnPageLoad(
                                                        animationsMap[
                                                            'textOnPageLoadAnimation3']!),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 5.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  5.0,
                                                                  0.0,
                                                                  20.0),
                                                      child: Text(
                                                        getJsonField(
                                                          produtosItem,
                                                          r'''$.Descricao''',
                                                        )
                                                            .toString()
                                                            .maybeHandleOverflow(
                                                              maxChars: 100,
                                                              replacement: '…',
                                                            ),
                                                        maxLines: 4,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .textColor,
                                                                  fontSize:
                                                                      12.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
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
                                  ],
                                ),
                              );
                            },
                          ),
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
    );
  }
}
