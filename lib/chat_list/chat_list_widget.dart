import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
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
          FFAppState().userid,
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: 'Poppins',
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4.0,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
          child: RefreshIndicator(
            onRefresh: () async {
              setState(() => _model.pagingController?.refresh());
              await _model.waitForOnePage();
            },
            child: PagedListView<ApiPagingParams, dynamic>(
              pagingController: () {
                if (_model.pagingController != null) {
                  return _model.pagingController!;
                }

                _model.pagingController = PagingController(
                  firstPageKey: ApiPagingParams(
                    nextPageNumber: 0,
                    numItems: 0,
                    lastResponse: null,
                  ),
                );
                _model.pagingController!
                    .addPageRequestListener((nextPageMarker) {
                  ChatGroup.listaDeChatsCall
                      .call(
                    userID: FFAppState().userid,
                  )
                      .then((listViewListaDeChatsResponse) {
                    final pageItems =
                        listViewListaDeChatsResponse.jsonBody.toList() as List;
                    final newNumItems =
                        nextPageMarker.numItems + pageItems.length;
                    _model.pagingController!.appendPage(
                      pageItems,
                      (pageItems.length > 0)
                          ? ApiPagingParams(
                              nextPageNumber: nextPageMarker.nextPageNumber + 1,
                              numItems: newNumItems,
                              lastResponse: listViewListaDeChatsResponse,
                            )
                          : null,
                    );
                  });
                });
                return _model.pagingController!;
              }(),
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              builderDelegate: PagedChildBuilderDelegate<dynamic>(
                // Customize what your widget looks like when it's loading the first page.
                firstPageProgressIndicatorBuilder: (_) => Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      color: FlutterFlowTheme.of(context).primaryColor,
                    ),
                  ),
                ),

                itemBuilder: (context, _, chatListIndex) {
                  final chatListItem =
                      _model.pagingController!.itemList![chatListIndex];
                  return Text(
                    getJsonField(
                      chatListItem,
                      r'''$.response._id''',
                    ).toString(),
                    style: FlutterFlowTheme.of(context).bodyText1,
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
