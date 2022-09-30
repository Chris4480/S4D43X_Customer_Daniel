@AbapCatalog.sqlViewName: 'ZI00CUST'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Basic Interface-View: Customer'
@VDM.viewType: #BASIC
define view ZI_00_Customer
  as select from scustom
{
  key id       as ID,
      name     as Name,
      form     as Form,
      street   as Street,
      postcode as Postcode,
      city     as City,
      country  as Country,
      discount as Discount
}
