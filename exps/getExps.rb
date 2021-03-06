
def GetSimpleExps(defaults, initCaOption, changes, description, numChanges, topo, links, demands, repetitions, extraProperties, info)
    
  exps=Array.new
  
    new_exp_defaults = "--initialAlgo MA --initialAlgoOption #{initCaOption},S"
    topoName=topo.split("/")[-1]


  waiting_times = case numChanges
    when 1 then 100
    when 2 then 140
    when 3 then 170
    when 4 then 190
    when 5 then 220
  end

  
  #max_duration = numChanges * 2 * waiting_times * 60 + 7
  max_duration=80
  
  exp = { "value" => "#{defaults} #{new_exp_defaults} --demands #{demands}", "id" => "#{topoName}_descr_#{description}_numChanges_#{numChanges}_", "topo" => topo, "links" => links, "repetitions" => repetitions, "extraProperties" => extraProperties, "info" => info, "olsrdebuglevel" => 4, "max_duration" => max_duration  }
  
  caOptions = ""
  
  changes[2..-1].each do |change|
      
      caOption="#{change},S"
   
      exp_new = exp.clone()
      
      exp_new["value"] = "#{exp["value"]} --caOption #{caOption} --waiting_times #{waiting_times}"
      exp_new["id"] = "#{exp["description"]}caOption_#{change}"
      
      puts "caOption: #{caOption}"
      
      exps << exp_new

  end
  
  
  return exps
  
end

def GetExp(defaults, initCaOption, changes, description, numChanges, topo, links, demands, repetitions, extraProperties, info)

  new_exp_defaults = "--initialAlgo MA --initialAlgoOption #{initCaOption},S"
  topoName=topo.split("/")[-1]


  waiting_times = case numChanges
    when 1 then 100
    when 2 then 140
    when 3 then 170
    when 4 then 190
    when 5 then 220
  end

  
  #max_duration = numChanges * 2 * waiting_times * 60 + 7
  max_duration=80
  
  exp = { "value" => "#{defaults} #{new_exp_defaults} --demands #{demands}", "id" => "#{topoName}_descr_#{description}_numChanges_#{numChanges}", "topo" => topo, "links" => links, "repetitions" => repetitions, "extraProperties" => extraProperties, "info" => info, "olsrdebuglevel" => 4, "max_duration" => max_duration  }
  
  caOptions = ""
  
  changes.each do |change|
      
      caOptions="#{caOptions}#{change},S:"
   
  end
  
  puts "caOption: #{caOptions}"
  
  exp["value"] = "#{exp["value"]} --caOption #{caOptions.chomp(":")} --waiting_times #{waiting_times}"
  
  return exp
  
    
end


def GetExp(defaults, initCaOption, changes, description, numChanges, topo, links, demands, repetitions, extraProperties, info)

  new_exp_defaults = "--initialAlgo MA --initialAlgoOption #{initCaOption},S"
  topoName=topo.split("/")[-1]


  waiting_times = case numChanges
    when 1 then 100
    when 2 then 140
    when 3 then 170
    when 4 then 190
    when 5 then 220
  end

  
  #max_duration = numChanges * 2 * waiting_times * 60 + 7
  max_duration=80
  
  exp = { "value" => "#{defaults} #{new_exp_defaults} --demands #{demands}", "id" => "#{topoName}_descr_#{description}_numChanges_#{numChanges}", "topo" => topo, "links" => links, "repetitions" => repetitions, "extraProperties" => extraProperties, "info" => info, "olsrdebuglevel" => 4, "max_duration" => max_duration  }
  
  caOptions = ""
  
  changes.each do |change|
      
      caOptions="#{caOptions}#{change},S:"
   
  end
  
  puts "caOption: #{caOptions}"
  
  exp["value"] = "#{exp["value"]} --caOption #{caOptions.chomp(":")} --waiting_times #{waiting_times}"
  
  return exp
  
    
end


def GetExps(defaults, initCaOption,  changes, description, topo, links, demands, repetitions, extraProperties, info)
  
  exps=Array.new
  
  new_exp_defaults = "--initialAlgo MA --initialAlgoOption #{initCaOption},S"
  
  for i in 1..changes.size()
  
    
    caOption = ""
    
    for k in  2..(i-1)
      
      caOption="#{caOption}#{changes[k]},"
  
    end
    
    caOption="#{caOption}S"
   
    topoName=topo.split("/")[-1]
    
    exp = { "value" => "#{defaults} #{new_exp_defaults} --caOption #{caOption} --demands #{demands}", "id" => "#{topoName}_descr_#{description}_numChanges_#{i}", "topo" => topo, "links" => links, "repetitions" => repetitions, "extraProperties" => extraProperties, "info" => info, "max_duration" => 14,   "olsrdebuglevel" => 4 }
    
    #puts exp["value"]
    
    exps << exp
    
  end
  
  return exps
    
end


def GetComplexExpAllInOne(defaults, initCaOption,  series, description, topo, links, demands, repetitions, extraProperties, info)
 
  new_exp_defaults = "--initialAlgo MA --initialAlgoOption #{initCaOption},S"
  topoName=topo.split("/")[-1]

  exp = { "value" => "#{defaults} #{new_exp_defaults} --demands #{demands} --waiting_times 50.0,70.0,100.0,140.0,150.0", "id" => "#{topoName}_descr_#{description}_numChanges_-1", "topo" => topo, "links" => links, "repetitions" => repetitions, "extraProperties" => extraProperties, "info" => info, "olsrdebuglevel" => 4, "max_duration" => 100  }
  
  caOptions = ""
  
  series.each do |serie|
  
    changes = serie["values"]
    
    for i in 1..changes.size()
      
      caOption = ""
    
      for k in  0..(i-1)
      
	caOption="#{caOption}#{changes[k]},"
  
      end
    
      caOption="#{caOption}S"
   
      caOptions = "#{caOptions}#{caOption}:"
    
    
    end
  
  end
  
  puts "caOption: #{caOptions}"
  
  exp["value"] = "#{exp["value"]} --caOption #{caOptions.chomp(":")}"
  
  return exp
end




def GetExpL2R(defaults, initCaOption, description, topo, links, demands, repetitions, extraProperties, info)
    
  exps=Array.new
  
    new_exp_defaults = "--initialAlgo MA --initialAlgoOption #{initCaOption},S"
    topoName=topo.split("/")[-1]

  
  #max_duration = numChanges * 2 * waiting_times * 60 + 7
  max_duration=80
  
  exp = { "value" => "#{defaults} #{new_exp_defaults} --demands #{demands}", "id" => "#{topoName}_descr_#{description}_numChanges_#{numChanges}_", "topo" => topo, "links" => links, "repetitions" => repetitions, "extraProperties" => extraProperties, "info" => info, "olsrdebuglevel" => 4, "max_duration" => max_duration  }
  
  caOptions = ""
  
  changes[2..-1].each do |change|
      
      caOption="#{change},S"
   
      exp_new = exp.clone()
      
      exp_new["value"] = "#{exp["value"]} --caOption #{caOption} --waiting_times #{waiting_times}"
      exp_new["id"] = "#{exp["description"]}caOption_#{change}"
      
      puts "caOption: #{caOption}"
      
      exps << exp_new

  end
  
  
  return exps
  
end



