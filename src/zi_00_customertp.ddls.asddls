@AbapCatalog.sqlViewName: 'ZI00CUSTTP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Transactional Interface-View: Customer'
@VDM.viewType: #TRANSACTIONAL
@ObjectModel: {
   transactionalProcessingEnabled: true,
   compositionRoot: true,
   writeActivePersistence: 'SCUSTOM',

   modelCategory: #BUSINESS_OBJECT,
   semanticKey: ['ID'],
   representativeKey: 'Name',

   createEnabled: true,
   updateEnabled: true,
   deleteEnabled: true
}
define view ZI_00_CustomerTP
  as select from ZI_00_Customer
{
  key ID,
      @ObjectModel.mandatory: true
      Name,
      Form,
      Street,
      Postcode,
      @ObjectModel.mandatory: true
      City,
      Country,
      Discount
}
