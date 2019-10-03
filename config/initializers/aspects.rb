# require 'aspector'
#
# watcher = Aspector do
#   around(/.*/, except: Object.methods) do |proxy, *args, &block|
#     puts "before #{proxy.name} on #{proxy.receiver}"
#     proxy.call(*args, &block)
#     puts "after #{proxy.name} on #{proxy.receiver}"
#   end
# end
#
# watcher.apply(Contact)
# watcher.apply(Contact, class_methods: true)

# require 'aquarium'
require 'aquarium/dsl/object_dsl'
include Aquarium::Aspects

puts "Aquarium aspect tracing initialized"
Aspect.new :around, :calls_to => :all_methods,
           :for_types => [Contact],
           :method_options => :exclude_ancestor_methods do |jp, obj, *args|
  begin
    names = "#{jp.target_type.name}##{jp.method_name}"
    p "Entering: #{names}: args = #{args.inspect}"
    jp.proceed
  ensure
    p "Leaving:  #{names}: args = #{args.inspect}"
  end
end