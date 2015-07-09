

# Assign the channels to network nodes' interfaces based on the given initialDemands and using the initialAlgo and numChannels.
# Supported algorithms are FCPRA and OneChannel.
class StaticChannelAssignment 

  def initialize(orbit)
    @orbit=orbit
  end
  
  
  def InstallApplications
   
  end


  def Start

  @orbit.GetNodes().each |node| do 
      node.GetInterfaces().each |ifn|
	if (ifn.IsWifi()) then
	      @orbit.AssignChannel(node, ifn, ifn.GetChannel())
	end
	
      end
      
    end
    
  end

end 


