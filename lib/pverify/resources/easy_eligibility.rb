module Pverify
  module Resources
    class EasyEligibility < RestfulResource
      public :post_list

      INFO = {
        "payerCode": "00001",
        "provider_lastname": "test",
        "provider_npi": "1234567890",
        "memberID": "123456789A",
        "patient_DOB": "10/02/2010",
        "patient_first": "John",
        "patient_last": "Deo",
        "date_Of_Service": "07/17/2020",
        "serviceCodes": "30",
        "referenceId": "",
        "location": ""
      }
    end
  end
end
