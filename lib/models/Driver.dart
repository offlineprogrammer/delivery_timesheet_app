/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, file_names, unnecessary_new, prefer_if_null_operators, prefer_const_constructors, slash_for_doc_comments, annotate_overrides, non_constant_identifier_names, unnecessary_string_interpolations, prefer_adjacent_string_concatenation, unnecessary_const, dead_code

import 'ModelProvider.dart';
import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Driver type in your schema. */
@immutable
class Driver extends Model {
  static const classType = const _DriverModelType();
  final String id;
  final String? _driver_name;
  final List<Delivery>? _Deliveries;
  final String? _driver_number;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String? get driver_name {
    return _driver_name;
  }
  
  List<Delivery>? get Deliveries {
    return _Deliveries;
  }
  
  String? get driver_number {
    return _driver_number;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Driver._internal({required this.id, driver_name, Deliveries, driver_number, createdAt, updatedAt}): _driver_name = driver_name, _Deliveries = Deliveries, _driver_number = driver_number, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Driver({String? id, String? driver_name, List<Delivery>? Deliveries, String? driver_number}) {
    return Driver._internal(
      id: id == null ? UUID.getUUID() : id,
      driver_name: driver_name,
      Deliveries: Deliveries != null ? List<Delivery>.unmodifiable(Deliveries) : Deliveries,
      driver_number: driver_number);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Driver &&
      id == other.id &&
      _driver_name == other._driver_name &&
      DeepCollectionEquality().equals(_Deliveries, other._Deliveries) &&
      _driver_number == other._driver_number;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Driver {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("driver_name=" + "$_driver_name" + ", ");
    buffer.write("driver_number=" + "$_driver_number" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Driver copyWith({String? id, String? driver_name, List<Delivery>? Deliveries, String? driver_number}) {
    return Driver._internal(
      id: id ?? this.id,
      driver_name: driver_name ?? this.driver_name,
      Deliveries: Deliveries ?? this.Deliveries,
      driver_number: driver_number ?? this.driver_number);
  }
  
  Driver.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _driver_name = json['driver_name'],
      _Deliveries = json['Deliveries'] is List
        ? (json['Deliveries'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Delivery.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _driver_number = json['driver_number'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'driver_name': _driver_name, 'Deliveries': _Deliveries?.map((Delivery? e) => e?.toJson()).toList(), 'driver_number': _driver_number, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "driver.id");
  static final QueryField DRIVER_NAME = QueryField(fieldName: "driver_name");
  static final QueryField DELIVERIES = QueryField(
    fieldName: "Deliveries",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Delivery).toString()));
  static final QueryField DRIVER_NUMBER = QueryField(fieldName: "driver_number");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Driver";
    modelSchemaDefinition.pluralName = "Drivers";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Driver.DRIVER_NAME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Driver.DELIVERIES,
      isRequired: false,
      ofModelName: (Delivery).toString(),
      associatedKey: Delivery.DRIVERID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Driver.DRIVER_NUMBER,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _DriverModelType extends ModelType<Driver> {
  const _DriverModelType();
  
  @override
  Driver fromJson(Map<String, dynamic> jsonData) {
    return Driver.fromJson(jsonData);
  }
}