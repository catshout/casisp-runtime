# Consumer SalesforceCdc
The SalesforceCdc Consumer registers itself for a salesforce event and receives the corresponding data based on the event.

## Configuration example
````json
        {
            "consumerType": "salesforceCdc",
            "salesforceCdc": {
                "blueprint": {
                    "apiVersion": "48.0"
                },
                "changeDataCaptureEvents": {
                    "changeEvents": "standard",
                    "standardObject": "Task"
                }
            }
        }
````
## Configuration parameters
|Parameter|Mandatory|Description|
|:---|:---:|:---|
|blueprint|X|must be set for blueprint handling|
|blueprint.apiVersion|X|Salesforce API version|
|changeEvents|X|either `standard` or `custom`|
|standardObject| |name of the standard object, values can be `Account`, `AccountContactRole`, `ActionCadence`, `ActionCadenceStep`, `ActionCadenceStepTracker`, `ActionCadenceTracker`, `Asset`, `AssignedResource`, `AuthorizationFormConsent`, `CallTemplate`, `Campaign`, `CampaignMember`, `CampaignMemberStatus`, `Case`, `Contact`, `ContactPointConsent`, `ContactPointEmail`, `ContactPointPhone`, `ContactPointTypeConsent`, `Contract`, `ContractLineItem`, `EmailMessage`, `EmailTemplate`, `Entitlement`, `Event`, `EventRelation`, `Individual`, `LandingPage`, `Lead`, `ListEmail`, `LiveChatTranscript`, `Location`, `Macro`, `MacroInstruction`, `MaintenanceAsset`, `MaintenancePlan`, `MarketingForm`, `MarketingLink`, `Opportunity`, `OpportunityContactRole`, `OpportunitySplit`, `Order`, `OrderItem`, `PartyConsent`, `Pricebook2`, `Product2`, `ProductConsumed`, `ProductItem`, `ProductRequest`, `ProductRequestLineItem`, `ProductTransfer`, `QuickText`, `Recommendation`, `ResourceAbsence`, `ReturnOrder`, `ReturnOrderLineItem`, `ServiceAppointment`, `ServiceCrew`, `ServiceCrewMember`, `ServiceResource`, `ServiceTerritory`, `ServiceTerritoryMember`, `Shipment`, `SocialPost`, `TimeSheet`, `TimeSheetEntry`, `Quote`, `QuoteLineItem`, `ServiceContract`, `Task`, `TaskRelation`, `User`, `VoiceCall`, `VoiceCallRecording`, `WorkOrder`, `WorkOrderLineItem`, `WorkType`|
|customObject| |name of the custom object|

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
- consume Salesforce data based on the standard event `Task`
- the API version is `48.0`
