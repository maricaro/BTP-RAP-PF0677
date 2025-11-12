@AbapCatalog.viewEnhancementCategory: [#NONE]

@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Header - Root Entity'
@Metadata.ignorePropagatedAnnotations: true

@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}

define root view entity ZHEADER_R_0677 
as select from ztheader_0677_a

  //composition [1..*] of Z_R_ITEMS_1075        as _Items

  association [1]    to /DMO/I_Overall_Status_VH as _Status on $projection.OrderStatus = _Status.OverallStatus
  association [0..1] to I_Country             as _Country   on $projection.Country = _Country.Country
  
{
   key order_uuid           as OrderUUID,
      id                    as OrderID,
      email                 as Email,
      firstname             as FirstName,
      lastname              as LastName,
      country               as Country,
      createon              as CreateOn,      
      deliverydate          as DeliveryDate,
      orderstatus           as OrderStatus,
      imageurl              as ImageUrl,

      //Campos Administrativos           
      @Semantics.user.createdBy: true
      local_created_by      as LocalCreatedBy,
      
      //Fecha y hora de quien cambio
      @Semantics.systemDateTime.createdAt: true
      local_created_at      as LocalCreatedAt,
      
      @Semantics.user.localInstanceLastChangedBy: true
      local_last_changed_by as LocalLastChangedBy,

      //local ETag field -> OData ETag
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,

      //total ETag field
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt,
      
  // Make association public
    // /_Items,
      _Status,
      _Country
}
