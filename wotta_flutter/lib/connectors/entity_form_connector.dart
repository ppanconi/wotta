import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_built_redux/flutter_built_redux.dart';
import 'package:wotta_core/wotta_core.dart';

class EntityFormConnector
    extends StoreConnector<WottaAppState, WottaActions, Entity> {
  final GlobalKey<FormState> formKey;
  final Widget formBody;
  final VoidCallback confirmCallack;

  EntityFormConnector({this.formKey, this.formBody, this.confirmCallack});

  @override
  Widget build(
      BuildContext context, Entity entity, WottaActions actions) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          entity.isSaved()
              ? "Editing Workout"
              : "Create new " + entity.typeName(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
            key: formKey,
            onChanged: () {
              print("Form changed ${new DateTime.now().millisecondsSinceEpoch}");
              actions.updateEntityEditingStatus(EntityEditingStatus((b) => b
               ..entity = entity
              ..inputIsValid = formKey.currentState.validate()));
            },
            autovalidate: true,
            child: formBody),
      ),
      floatingActionButton: StoreConnection<WottaAppState, WottaActions, EntityEditingStatus>(
        builder: (context, state, actions) {
          return FloatingActionButton(
            tooltip: state.entity.isSaved() ? 'Save changes' : 'Add Workout',
            child: Icon(state.entity.isSaved() ? Icons.check : Icons.add),
            onPressed: state.inputIsValid ? () {
              if (formKey.currentState.validate()) {
                confirmCallack();
              } else {
                //            _formKey.currentState.reset();
              }
            } : null,
          );
        },
        connect: (state) => state.currentEditingStatus,
      ),
    );
  }

  @override
  Entity connect(WottaAppState state) {
    return state.currentEditingStatus.entity;
  }
}
