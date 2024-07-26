@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Active objects by day'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
  serviceQuality: #X,
  sizeCategory: #S,
  dataClass: #MIXED
}
define view entity Zc_Activeobjectsbyday as select from I_CustABAPObjDirectoryEntry
inner join I_BusinessUserBasic as busUser on I_CustABAPObjDirectoryEntry.ABAPObjectResponsibleUser = busUser.UserID 
{
//  key ABAPObjectCategory,
//  key ABAPObjectType,
//  key ABAPObject,
  I_CustABAPObjDirectoryEntry.ABAPObjectResponsibleUser,
  I_CustABAPObjDirectoryEntry.ABAPPackage,
  busUser.PersonFullName,
  /* Associations */
  I_CustABAPObjDirectoryEntry._CustABAPPackage.CreationDate as creationDate
  
} where I_CustABAPObjDirectoryEntry._CustABAPPackage.CreationDate >= dats_add_days($session.system_date, -8, 'NULL' )  
group by I_CustABAPObjDirectoryEntry.ABAPObjectResponsibleUser, I_CustABAPObjDirectoryEntry.ABAPPackage, I_CustABAPObjDirectoryEntry._CustABAPPackage.CreationDate,
  busUser.PersonFullName
//,ABAPObjectCategory, ABAPObjectType, ABAPObject 
