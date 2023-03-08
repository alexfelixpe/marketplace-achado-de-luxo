import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
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
        child: FutureBuilder<ApiCallResponse>(
          future: ChatGroup.listaDeChatsCall.call(
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
                    color: FlutterFlowTheme.of(context).primaryColor,
                  ),
                ),
              );
            }
            final containerListaDeChatsResponse = snapshot.data!;
            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Builder(
                builder: (context) {
                  final chatList = getJsonField(
                    containerListaDeChatsResponse.jsonBody,
                    r'''$.response.chatlist''',
                  ).toList();
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    itemCount: chatList.length,
                    itemBuilder: (context, chatListIndex) {
                      final chatListItem = chatList[chatListIndex];
                      return Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          AutoSizeText(
                            getJsonField(
                              chatListItem,
                              r'''$.response.chatlist[:].Vendedor''',
                            ).toString(),
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
