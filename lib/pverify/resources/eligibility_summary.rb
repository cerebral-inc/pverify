
module Pverify
  module Resources
    class EligibilitySummary < RestfulResource
      public :post_list

      CONTS_DATA = {
        "payerCode": "00192",
        "payerName": "UHC",
        "provider": {
            "firstName": "",
            "middleName": "",
            "lastName": " test name",
            "npi": "1234567890"
        },
    
        "subscriber": {
            "firstName": "Test",
            "dob": "01/01/1950",
            "lastName": "Test1",
            "memberID": "1234567890"
        },
    
        "dependent": nil,
        "isSubscriberPatient": "True",
        "doS_StartDate": "04/21/2020",
        "doS_EndDate": "04/21/2020",
    
        "PracticeTypeCode":"3",
        "referenceId":"Pat MRN",
        "Location":"Any location Name",
        "IncludeTextResponse":"false",
        "RequestSource":"TestAPI" 
      }
    end
  end
end
