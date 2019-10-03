require 'aquarium'
# require 'aquarium/dsl/object_dsl'
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