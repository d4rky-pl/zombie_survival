module LivingObject
  def included(base)
    base.class_eval do
      attr_accessor :hp, :x, :y
    end

  end
end