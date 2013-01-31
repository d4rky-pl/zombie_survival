module LivingObject
  def self.included(base)
    base.class_eval do
      attr_accessor :hp, :x, :y
    end

  end
end