module Pverify
  module Resources
    class EasyEligibilitySummary < RestfulResource
      public :post_list

      INFO = {
        "payerCode": "00001",
        "payerName": "Aetna",
        "Provider_LastName": "SAM MD",
        "Provider_NPI": "1234567890",
        "Patient_First": "John",
        "Patient_DOB": "10/02/2010",
        "Patient_Last": "Deo",
        "memberID": "123456789A",
        "Date_Of_Service": "07/17/2020",
        "referenceId": "",
        "Location": "",
        "PracticeTypeCode": "18",
        "IncludeTextResponse": false
      }
    end
  end
end
