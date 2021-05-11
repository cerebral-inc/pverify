module Pverify
  module Resources
    class MBIInquiry < RestfulResource
      public :post_list

      PATIENT_INFO = {
        "patientSSN": "123456789",
        "patientFirstName": "First Name",
        "patientLastName": "Last Name",
        "patientDOB": "04/21/2020",
        "location": "location Name",
        "MRN":"1234",
        "CallbackURL":"http://www.test.com/api/PostData"
      }
    end
  end
end
