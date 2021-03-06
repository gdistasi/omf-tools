

def GetSimpleExps(defaults, qdiscs, description, bottleneckRates, rates, topo, demands, repetitions, extraProperties, protocols, info, max_duration, rttm, txqueuelens)

    exps = Array.new    
    
    qdiscs.each  {|qdisc|
        bottleneckRates.each {|bottleneckRate|
            rates.each {|rate|
                protocols.each { |protocol|
                    demands.each   { |demand|
                        rttm.each { |meter|
                            txqueuelens.each { |queuelen|
                                (1..repetitions).each { |repetition|
                                exp = { "scriptFile" => "bufferbloat/TestBufferbloat.rb",   "demands" => demand,  "qdisc" => qdisc, "topo" => topo,  "repetition" => repetition, "info" => info, "olsrdebuglevel" => 4, "max_duration" => max_duration, "bottleneckRate" =>  bottleneckRate, "rate" => rate, "protocol" => protocol, "defaults" => defaults, "rttm" => meter, "txqueuelen" => queuelen}
                                exps << exp unless (bottleneckRate>rate or demand<bottleneckRate)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
        
    
    return exps
end
    

info="firstBufferbloat"
defaults="--stabilizeDelay 2 --channels 1,6,11"
protocols=["TCP"]
topo="bufferbloat/topology.xml"
#demands="0.05,0.05,0.05,0.05,0.05,0.05"
demands=[1000,5000,10000,24000,54000]
extraProperties=""
#"--setAp 00:11:22:33:44:55"
qdiscs=["fq_codel", "pfifo_fast", "pie"]
description="Bb exps"
bottleneckRates=[1000,5000,24000]
rates=[1000,5000,11000,24000,54000]
max_duration=14
rttm=["yes"]
txqueuelens=[1,10,100,1000]
repetitions = 3


exps=GetSimpleExps(defaults, qdiscs, description, bottleneckRates, rates, topo, demands, repetitions, extraProperties, protocols, info, max_duration, rttm, txqueuelens)

exps.each{ |exp|
        $EXPS << exp
}


