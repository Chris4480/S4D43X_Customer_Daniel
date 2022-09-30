@AbapCatalog.sqlViewName: 'ZI00BOOKTP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Transactional Interface-View: Booking'
@VDM.viewType: #TRANSACTIONAL
define view ZI_00_BookingTP
  as select from ZI_00_Booking
{
  key CarrierID,
  key ConnectionID,
  key FlightDate,
  key BookingID,
      CustomerID,
      LuggageWeight,
      LuggageWeightUnit,
      FlightClass,
      Amount,
      CurrencyCode,
      OrderDate,
      CounterID,
      AgencyNumber
}
