#!/bin/bash

ENV=$1
EXP=$2
EXPOPT=$3
END=$4


if [[ $ENV == "ORBIT" ]]; then
  
  host=orbit

else

  echo "ENV ${ENV} not recognized!"
  exit 1
  
fi
echo "export ENV=$ENV; cd l2routing/orbit;  \
                       ./scripts/exit_at.sh $END; \
		                              (./scripts/check.sh &) ; \
					                             screen -d -m ruby $EXP "
								     
ssh gdistasi@$host "export ENV=$ENV; cd l2routing/orbit;  \
		       screen -d -m ruby $EXP ${EXPOPT} "

	
#		       ./scripts/exit_at.sh $END; \
#		       (ruby ./scripts/check.rb 50 &) ; \
