module Pverify
  module Resources
    class ClaimStatusInquiry < RestfulResource
      public :post_list

      PROVIDER_INFO = {
        "payerCode": "00001",   
        "ProviderLastName": "lastname",
        "ProviderNPI": "1234567890", 
        "ProviderFederalTaxId": "",
        "payerClaimNumber": "",
        "chargeAmount": 732.87,
        "serviceStartDate": "04/01/2020",
        "serviceEndDate": "04/01/2020",
        "subscriber": {
            "FirstName": "",
            "lastName": "lastname",
            "dob": "07/07/2010",        
            "memberID": "memberID"       
        },
        "isPatientDependent": false
      }
    end
  end
end
