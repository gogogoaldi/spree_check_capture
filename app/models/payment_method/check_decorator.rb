PaymentMethod::Check.class_eval do
  
     def actions
       %w{balance}
     end
     
     def balance(payment)
       payment.started_processing
       payment.complete
     end
     
     def can_balance?(payment)
       payment.state == "checkout"
     end   
end