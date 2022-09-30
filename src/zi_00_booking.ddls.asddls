@AbapCatalog.sqlViewName: 'ZI00BOOK'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Basic Interface-View: Booking'
@VDM.viewType: #BASIC
define view ZI_00_Booking
  as select from sbook
{
  key carrid     as CarrierID,
  key connid     as ConnectionID,
  key fldate     as FlightDate,
  key bookid     as BookingID,
      customid   as CustomerID,
      luggweight as LuggageWeight,
      wunit      as LuggageWeightUnit,
      class      as FlightClass,
      forcuram   as Amount,
      forcurkey  as CurrencyCode,
      order_date as OrderDate,
      counter    as CounterID,
      agencynum  as AgencyNumber
}
