import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/chat/chat_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chat_list_model.dart';
export 'chat_list_model.dart';

class ChatListWidget extends StatefulWidget {
  const ChatListWidget({Key? key}) : super(key: key);

  @override
  _ChatListWidgetState createState() => _ChatListWidgetState();
}

class _ChatListWidgetState extends State<ChatListWidget> {
  late ChatListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatListModel());

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
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Papo Livre',
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: 'Poppins',
                color: FlutterFlowTheme.of(context).primaryColor,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4.0,
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                  child: AutoSizeText(
                    'Fale com seus clientes!',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.of(context).secondaryColor,
                          fontSize: 18.0,
                        ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: FutureBuilder<ApiCallResponse>(
                        future: ChatGroup.listaDeChatsVendedorCall.call(
                          userID: FFAppState().userid,
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
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                              ),
                            );
                          }
                          final listViewListaDeChatsVendedorResponse =
                              snapshot.data!;
                          return Builder(
                            builder: (context) {
                              final chatList =
                                  ChatGroup.listaDeChatsVendedorCall
                                          .chatList(
                                            listViewListaDeChatsVendedorResponse
                                                .jsonBody,
                                          )
                                          ?.toList() ??
                                      [];
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                itemCount: chatList.length,
                                itemBuilder: (context, chatListIndex) {
                                  final chatListItem = chatList[chatListIndex];
                                  return Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 5.0),
                                        child: FutureBuilder<ApiCallResponse>(
                                          future: UsersByIdCall.call(
                                            id: getJsonField(
                                              chatListItem,
                                              r'''$.Cliente''',
                                            ).toString(),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 40.0,
                                                  height: 40.0,
                                                  child: SpinKitFadingFour(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    size: 40.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            final textVendedorUsersByIdResponse =
                                                snapshot.data!;
                                            return InkWell(
                                              onTap: () async {
                                                await Navigator.push(
                                                  context,
                                                  PageTransition(
                                                    type:
                                                        PageTransitionType.fade,
                                                    duration: Duration(
                                                        milliseconds: 300),
                                                    reverseDuration: Duration(
                                                        milliseconds: 300),
                                                    child: ChatWidget(
                                                      vendedorID: getJsonField(
                                                        chatListItem,
                                                        r'''$.Vendedor''',
                                                      ).toString(),
                                                      clienteID: getJsonField(
                                                        chatListItem,
                                                        r'''$.Cliente''',
                                                      ).toString(),
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: AutoSizeText(
                                                getJsonField(
                                                  textVendedorUsersByIdResponse
                                                      .jsonBody,
                                                  r'''$.response.Nome''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 16.0,
                                                        ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
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
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                  child: AutoSizeText(
                    'Fale com seus vendedores!',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.of(context).secondaryColor,
                          fontSize: 18.0,
                        ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: FutureBuilder<ApiCallResponse>(
                        future: ChatGroup.listaDeChatsClienteCall.call(
                          userID: FFAppState().userid,
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
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                              ),
                            );
                          }
                          final listViewListaDeChatsClienteResponse =
                              snapshot.data!;
                          return Builder(
                            builder: (context) {
                              final chatList = ChatGroup.listaDeChatsClienteCall
                                      .chatList(
                                        listViewListaDeChatsClienteResponse
                                            .jsonBody,
                                      )
                                      ?.toList() ??
                                  [];
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                itemCount: chatList.length,
                                itemBuilder: (context, chatListIndex) {
                                  final chatListItem = chatList[chatListIndex];
                                  return Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 5.0),
                                        child: FutureBuilder<ApiCallResponse>(
                                          future: UsersByIdCall.call(
                                            id: getJsonField(
                                              chatListItem,
                                              r'''$.Vendedor''',
                                            ).toString(),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 40.0,
                                                  height: 40.0,
                                                  child: SpinKitFadingFour(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    size: 40.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            final textVendedorUsersByIdResponse =
                                                snapshot.data!;
                                            return InkWell(
                                              onTap: () async {
                                                await Navigator.push(
                                                  context,
                                                  PageTransition(
                                                    type:
                                                        PageTransitionType.fade,
                                                    duration: Duration(
                                                        milliseconds: 300),
                                                    reverseDuration: Duration(
                                                        milliseconds: 300),
                                                    child: ChatWidget(
                                                      vendedorID: getJsonField(
                                                        chatListItem,
                                                        r'''$.Vendedor''',
                                                      ).toString(),
                                                      clienteID:
                                                          FFAppState().userid,
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: AutoSizeText(
                                                getJsonField(
                                                  textVendedorUsersByIdResponse
                                                      .jsonBody,
                                                  r'''$.response.Nome''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 16.0,
                                                        ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          );
                        },
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
  }
}
