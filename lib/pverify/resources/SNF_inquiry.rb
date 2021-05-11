module Pverify
  module Resources
    class SNFInquiry < RestfulResource
      public :post_list

      INFO = {
        "PayerCode":"00007",
        "MemberId":"123456789A",
        "PatientFirstName":"firstName",
        "PatientLastName":"lastName",
        "PatientDOB":"01/02/1983",
        "PatientStateCode":"TX",
        "DOS":"07/22/2020",
        "RequestSource":"API",
        "Location":"",
        "CallbackURL":"",
        "MRN":""
      }
    end
  end
end
