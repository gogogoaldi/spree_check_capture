SpreeCheckCapture
=============

SpreeCheckCapture adds a capture button to admin/order/payments for payments made via PaymentMethod::Check.
Might be useful if you accept payments made by check or bank transfer (common in Germany).

Install
=======

Install in the usual way by adding gem to your Gemfile

  gem 'spree_check_capture',  :git => 'git://github.com/gogogoaldi/spree_check_capture.git'
  
and run 

  bundle install

That´s it!

Workaround
====

This extension doesn´t make use of an own class as payment source! Instead it uses two decorators payment_decorator.rb and payment_method/check_decorator_.rb:
- payment_decorator.rb adds PaymentMethod::Check as source for payment and PaymentMethod::Check´s actions
- payment_method/check_decorator_.rb adds actions to capture the payment

Works fine with spree 0.40.3. As far as I can see it should work with versions down to 0.30.

Hack it!
========

For further needs add missing actions to payment_method/check_decorator_.rb.

Copyright (c) 2011 [Olaf Tiemann]