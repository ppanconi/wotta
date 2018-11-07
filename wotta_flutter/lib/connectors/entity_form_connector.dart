
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_built_redux/flutter_built_redux.dart';
import 'package:wotta_core/wotta_core.dart';

class EntityFormConnector extends StoreConnector<WottaAppState, WottaActions, EntityEditingStatus> {

  final GlobalKey<FormState> formKey;
  final Widget formBody;
  final VoidCallback confirmCallack;

  EntityFormConnector(this.formKey, this.formBody, this.confirmCallack);

  @override
  Widget build(BuildContext context, EntityEditingStatus state, WottaActions actions) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            state.entity.isSaved() ? "Editing Workout" : "Create new " + state.entity.typeName(),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            onChanged: () {
              actions.updateEntityEditingStatus(state.toBuilder().build());
            },
            autovalidate: true,
            child: formBody
          ),
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: state.entity.isSaved() ? 'Save changes' : 'Add Workout',
          child: Icon(state.entity.isSaved() ? Icons.check : Icons.add),
          onPressed: () {
            if (formKey.currentState.validate()) {
              confirmCallack();
            } else {
//            _formKey.currentState.reset();
            }
          },
        )
    );
  }

  @override
  EntityEditingStatus connect(WottaAppState state) {
    return state.currentEditingStatus;
  }

}