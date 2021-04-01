import 'package:get/state_manager.dart';

class Items extends GetxController {
  String medicationId;
  String form;
  String strength;
  String referenceDrug;
  String drugName;
  String activeIngredient;
  String referenceStandard;

  Items({
    this.medicationId,
    this.form,
    this.strength,
    this.referenceDrug,
    this.drugName,
    this.activeIngredient,
    this.referenceStandard,
  });

  Items.fromMap(Map<String, dynamic> map) {
    medicationId = map['medicationId'];
    form = map['form'];
    strength = map['strength'];
    referenceDrug = map['referenceDrug'];
    drugName = map['drugName'];
    activeIngredient = map['activeIngredient'];
    referenceStandard = map['referenceStandard'];
  }

  Map<String, dynamic> toMap() {
    return {
      medicationId: 'medicationId',
      form: 'form',
      strength: 'strength',
      referenceDrug: 'referenceDrug',
      drugName: 'drugName',
      activeIngredient: 'activeIngredient',
      referenceStandard: 'referenceStandard',
    };
  }
}