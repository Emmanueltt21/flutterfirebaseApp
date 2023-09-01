
  import 'dart:convert';

class AgenciesModel{

          String dco = '',
              etat_site = '',
              CODE_AGENCE = '',
              LIBELLE = '',
              dco2 = '',
              nom_court = '',
              etat_age = '';

          AgenciesModel(this.LIBELLE, this.CODE_AGENCE);


          AgenciesModel.fromJSON(Map<String, dynamic> jsonMap) {
            dco = jsonMap['dco']!=null? jsonMap['dco'].toString() : '';
            etat_site = jsonMap['etat_site']!=null?jsonMap['etat_site'].toString() : '';
            CODE_AGENCE = jsonMap['CODE_AGENCE'] !=null? jsonMap['CODE_AGENCE'].toString() : '';
            LIBELLE = jsonMap['LIBELLE'] !=null? jsonMap['LIBELLE'].toString() : '';
            etat_age = jsonMap['etat_age'] !=null? jsonMap['etat_age'].toString() : '';
            dco2 = jsonMap['dco2'] !=null? jsonMap['dco2'].toString() : '';
            nom_court = jsonMap['nom_court'] !=null? jsonMap['nom_court'].toString() : '';

          }

        }

   class ResponseAgencies{

     String success = '', message = '';
     List<AgenciesModel> listAgencies = [];

     ResponseAgencies.fromJSON(Map<String, dynamic> jsonMap) {
       success = jsonMap['success']!=null? jsonMap['success'].toString() : '';
       message = jsonMap['message']!=null?jsonMap['message'].toString() : '';
       listAgencies = jsonMap['data'] != null
           ? List.from(jsonDecode(jsonMap['data'])).map((element) => AgenciesModel.fromJSON(element)).toList()
           : [];

     }

   }


   class RegionModel{
  String regionName = '', regionCode = "";

  RegionModel(this.regionName,this.regionCode);

   }