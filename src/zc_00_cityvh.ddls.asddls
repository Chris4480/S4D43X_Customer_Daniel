@AbapCatalog.sqlViewName: 'ZC00CITYVH'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Value Help: City'
define view ZC_00_CityVH
  as select from sgeocity
{
  key city    as City,
  key country as Country
}
