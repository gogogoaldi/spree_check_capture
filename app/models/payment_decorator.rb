Payment.class_eval do
  def actions
    if payment_method.type == "PaymentMethod::Check"
      payment_method.actions.select { |action| !payment_method.respond_to?("can_#{action}?") or payment_method.send("can_#{action}?", self) }
    else
      return [] unless payment_source and payment_source.respond_to? :actions
      payment_source.actions.select { |action| !payment_source.respond_to?("can_#{action}?") or payment_source.send("can_#{action}?", self) }
    end
  end

  def payment_source
    if payment_method.type == "PaymentMethod::Check"
      payment_method
    else
      source.is_a?(Payment) ? source.source : source
    end
  end
end