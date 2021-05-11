module Pverify
  module Resources
    class CancelTransaction < RestfulResource
      public :post_list

      TRANSACTION_ID = { "transactionId":12345455 }
    end
  end
end
