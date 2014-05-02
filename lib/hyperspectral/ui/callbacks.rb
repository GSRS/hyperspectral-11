module Callbacks
  
  def method_missing(m, *args, &block)
    # p "method missing #{m}"
    (@callbacks ||= Hash.new)[m] = block
  end
  
  def callback_exist?(name)
    # p "checking for callback #{name}"
    @callbacks && name && @callbacks.key?(name)
  end
  
  def callback(name, *args)
    # p "calling callback #{name} #{args} -> #{callback_exist?(name)} <-"
    @callbacks[name].call(*args) if callback_exist?(name)
  end
  
end