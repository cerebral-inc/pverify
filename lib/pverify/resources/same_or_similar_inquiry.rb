module Pverify
  module Resources
    class SameOrSimilarInquiry < RestfulResource
      public :post_list

      MEMBER_INFO = {
        "memberId": "1231234567",
        "patientFirstName": "Test1",
        "patientLastName": "Test2",
        "patientDOB": "01/02/2020",
        "patientStateCode": "NJ",
        "hcpcsCodes": "L3960,L3982,L3995",
        "dosStart": "04/21/2020",
        "dosEnd": "04/21/2020",
        "requestSource": "API",
        "location": "location Name",
        "callBackUrl": ""
      }
    end
  end
end
