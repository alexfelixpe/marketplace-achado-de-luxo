import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/login/login_widget.dart';
import '/pages/produto/produto_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'explore_model.dart';
export 'explore_model.dart';

class ExploreWidget extends StatefulWidget {
  const ExploreWidget({Key? key}) : super(key: key);

  @override
  _ExploreWidgetState createState() => _ExploreWidgetState();
}

class _ExploreWidgetState extends State<ExploreWidget> {
  late ExploreModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExploreModel());

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

    _model.textController ??= TextEditingController();
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
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 70.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryColor,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5.0,
                      color: Color(0x27000000),
                      offset: Offset(0.0, 3.0),
                    )
                  ],
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 12.0, 16.0, 12.0),
                      child: TextFormField(
                        controller: _model.textController,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.textController',
                          Duration(milliseconds: 2000),
                          () => setState(() {}),
                        ),
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Busca',
                          labelStyle: FlutterFlowTheme.of(context).bodyText2,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          filled: true,
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          prefixIcon: Icon(
                            Icons.search_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1,
                        validator:
                            _model.textControllerValidator.asValidator(context),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 80.0,
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: FutureBuilder<ApiCallResponse>(
                            future: CorCall.call(),
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
                              final choiceChipsCorResponse = snapshot.data!;
                              return FlutterFlowChoiceChips(
                                options: (CorCall.nome(
                                  choiceChipsCorResponse.jsonBody,
                                ) as List)
                                    .map<String>((s) => s.toString())
                                    .toList()!
                                    .map((label) => ChipData(label))
                                    .toList(),
                                onChanged: (val) => setState(
                                    () => _model.choiceChipsValue = val?.first),
                                selectedChipStyle: ChipStyle(
                                  backgroundColor: Color(0xFF323B45),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                      ),
                                  iconColor: Colors.white,
                                  iconSize: 16.0,
                                  elevation: 4.0,
                                ),
                                unselectedChipStyle: ChipStyle(
                                  backgroundColor: Colors.white,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyText2
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF323B45),
                                      ),
                                  iconColor: Color(0xFF323B45),
                                  iconSize: 16.0,
                                  elevation: 4.0,
                                ),
                                chipSpacing: 5.0,
                                multiselect: false,
                                alignment: WrapAlignment.spaceEvenly,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 44.0),
                child: FutureBuilder<ApiCallResponse>(
                  future: ProdutosBuscaCall.call(
                    constraints:
                        '%5B%7B%22key%22%3A%22is_marketplace%22%2C%22constraint_type%22%3A%22equals%22%2C%22value%22%3A%22true%22%7D%2C%7B%22key%22%3A%22Status%22%2C%22constraint_type%22%3A%22equals%22%2C%22value%22%3A%221638810592650x910538349165423400%22%7D%2C%7B%22key%22%3A%22Quantidade%22%2C%22constraint_type%22%3A%22greater%20than%22%2C%22value%22%3A%220%22%7D%2C%7B%22key%22%3A%22is_featured%22%2C%22constraint_type%22%3A%22equals%22%2C%22value%22%3A%22true%22%7D%2C%7B%22key%22%3A%22Nome%22%2C%22constraint_type%22%3A%22text%20contains%22%2C%20%22value%22%3A%22${_model.textController.text}%22%7D%2C%7B%22key%22%3A%22Cor%22%2C%22constraint_type%22%3A%22text%20contains%22%2C%20%22value%22%3A%22${_model.choiceChipsValue}%22%7D%2C%7B%22key%22%3A%22Marca%22%2C%22constraint_type%22%3A%22text%20contains%22%2C%20%22value%22%3A%22farm%22%7D%5D',
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
                    final wrapProdutosBuscaResponse = snapshot.data!;
                    return Builder(
                      builder: (context) {
                        final novdades = ProdutosBuscaCall.allFields(
                          wrapProdutosBuscaResponse.jsonBody,
                        ).toList().take(50).toList();
                        return Wrap(
                          spacing: 2.0,
                          runSpacing: 2.0,
                          alignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          direction: Axis.horizontal,
                          runAlignment: WrapAlignment.start,
                          verticalDirection: VerticalDirection.down,
                          clipBehavior: Clip.none,
                          children:
                              List.generate(novdades.length, (novdadesIndex) {
                            final novdadesItem = novdades[novdadesIndex];
                            return InkWell(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    duration: Duration(milliseconds: 300),
                                    reverseDuration:
                                        Duration(milliseconds: 300),
                                    child: ProdutoWidget(
                                      produto: novdadesItem,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.45,
                                height: 280.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x230E151B),
                                      offset: Offset(0.0, 2.0),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(2.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4.0, 4.0, 4.0, 4.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        child: Image.network(
                                          functions.imageCompress(getJsonField(
                                            novdadesItem,
                                            r'''$.ImagemRemota[0]''',
                                          ).toString())!,
                                          width: 170.0,
                                          height: 170.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 12.0, 0.0, 0.0),
                                        child: AutoSizeText(
                                          getJsonField(
                                            novdadesItem,
                                            r'''$.Marca''',
                                          ).toString(),
                                          maxLines: 1,
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle1,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          getJsonField(
                                            novdadesItem,
                                            r'''$.Nome''',
                                          ).toString().maybeHandleOverflow(
                                              maxChars: 16),
                                          maxLines: 1,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText2,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'R\$ ${getJsonField(
                                            novdadesItem,
                                            r'''$.Preco''',
                                          ).toString()}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText2
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryColor,
                                                fontSize: 18.0,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
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
