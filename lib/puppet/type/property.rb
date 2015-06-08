Puppet::Type.newtype(:property) do

  newproperty(:value) do
    desc "The value the property should have"
  end

  def value do
  end

  def value=(var) do
  end

  newparam(:get_command) do
    desc "The command to run to determine the current value"
  end

  newparam(:set_command) do
    desc "The command to run to set the desired value"
  end

end
