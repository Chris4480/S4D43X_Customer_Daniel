@AbapCatalog.sqlViewName: 'ZC00CUSTTP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Customer'
@VDM.viewType: #CONSUMPTION
@OData.publish: true
@Search.searchable: true
@Metadata.allowExtensions: true
@ObjectModel: {
   transactionalProcessingDelegated: true,

   createEnabled: true,
   updateEnabled: true,
   deleteEnabled: true
}
define view ZC_00_CustomerTP
  as select from ZI_00_CustomerTP
  association [0..*] to ZC_00_BookingTP as _Bookings on  _Bookings.CustomerID = ZI_00_CustomerTP.ID
  association [1..1] to ZC_00_CityVH    as _City     on  ZI_00_CustomerTP.City    = _City.City
                                                     and ZI_00_CustomerTP.Country = _City.Country
{
  key ID,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      Name,
      Form,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      Street,
      Postcode,
      @Consumption.valueHelp: '_City'
      City,
      Country,
      Discount,
      _Bookings,
      _City
}
