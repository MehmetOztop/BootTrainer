@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View for ZR_RD0_ACONN1'
define root view entity ZC_RD0_ACONN1
  provider contract transactional_query
  as projection on ZR_RD0_ACONN1
{
  key UUID,
  CarrierID,
  ConnectionID,
  AirportFromID,
  CityFrom,
  CountryFrom,
  AirportToID,
  CityTo,
  CountryTo,
  LocalLastChangedAt
  
}
