# Consumer Salesforce CDC
The Salesforce CDC Consumer registers itself for a salesforce event and receives the corresponding data based on the events.

## Configuration example
````json
{
    "consumerType": "salesforceCdc",
    "salesforceCdc": {
        "changeDataCaptureEvents": {
            "changeEvents": "standard",
            "standardObject": "Task"
        },
        "blueprint": {
            "apiVersion": "48.0"
        }
    }
}
````
## Configuration parameters
|Parameter|Mandatory|Description|
|:---|:---:|:---|
|changeDataCaptureEvents.changeEvents|X|either `standard` or `custom`|
|changeDataCaptureEvents.standardObject| |name of the standard object, values can be `Account`, `AccountContactRole`, `ActionCadence`, `ActionCadenceStep`, `ActionCadenceStepTracker`, `ActionCadenceTracker`, `Asset`, `AssignedResource`, `AuthorizationFormConsent`, `CallTemplate`, `Campaign`, `CampaignMember`, `CampaignMemberStatus`, `Case`, `Contact`, `ContactPointConsent`, `ContactPointEmail`, `ContactPointPhone`, `ContactPointTypeConsent`, `Contract`, `ContractLineItem`, `EmailMessage`, `EmailTemplate`, `Entitlement`, `Event`, `EventRelation`, `Individual`, `LandingPage`, `Lead`, `ListEmail`, `LiveChatTranscript`, `Location`, `Macro`, `MacroInstruction`, `MaintenanceAsset`, `MaintenancePlan`, `MarketingForm`, `MarketingLink`, `Opportunity`, `OpportunityContactRole`, `OpportunitySplit`, `Order`, `OrderItem`, `PartyConsent`, `Pricebook2`, `Product2`, `ProductConsumed`, `ProductItem`, `ProductRequest`, `ProductRequestLineItem`, `ProductTransfer`, `QuickText`, `Recommendation`, `ResourceAbsence`, `ReturnOrder`, `ReturnOrderLineItem`, `ServiceAppointment`, `ServiceCrew`, `ServiceCrewMember`, `ServiceResource`, `ServiceTerritory`, `ServiceTerritoryMember`, `Shipment`, `SocialPost`, `TimeSheet`, `TimeSheetEntry`, `Quote`, `QuoteLineItem`, `ServiceContract`, `Task`, `TaskRelation`, `User`, `VoiceCall`, `VoiceCallRecording`, `WorkOrder`, `WorkOrderLineItem`, `WorkType`|
|changeDataCaptureEvents.customObject| |name of the custom object|
|blueprint|X|must be set for blueprint handling|
|blueprint.apiVersion|X|Salesforce API version|

The file `etc/casisp.cfg` must contain the values for the Salesforce access as following

````
################################################################################
#
# salesforce environment parameters
#
################################################################################

salesforce.loginUrl=
salesforce.clientId=
salesforce.clientSecret=
salesforce.userName=
salesforce.password=
````

The configuration above will be
- consuming Salesforce data based on the standard event `Task`
- based on the API version `48.0`
