module Pverify
  module Resources
    class EligibilityInquiry < RestfulResource
      public :post_list

      USER_INFO = {
        "payerCode": "00007",
        "provider": {
          "firstName": "",
          "middleName": "",
          "lastName": " test name",
          "npi": "1122334455"
        },
        "subscriber": {
          "firstName": "first",
          "middleName": "",
          "lastName": "somelast",
          "dob": "12/21/2018",
          "memberID": "1234567890"
        },
        "dependent": {
          "patient": {
            "firstName": "",
            "middleName": "",
            "lastName": "",
            "dob": "",
            "gender": ""
          },
          "relationWithSubscriber": ""
        },
        "isSubscriberPatient": "true",
        "doS_StartDate": "12/21/2018",
        "doS_EndDate": "12/21/2018",
        "serviceCodes": [
          "30"
        ],
        "requestSource": "RestAPI",
        "isHMOplan": true,
        "IncludeTextResponse": true,
        "referenceId": "1234",
        "Location": "Nowhere"
      }
    end
  end
end
