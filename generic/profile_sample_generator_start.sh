#!/bin/bash

#Script Name:  Profile Sample Generator Start
#Script Author:  Alex Meadows
#Author Date:  Oct 12 2012
#Purpose:  Built to simplify use of the profiling tool.  The job takes four variables:
#	   1) The job type needing to be run. Valid values:  process_custom, process_auto, analyze
#	   2) Name of the source needing to be profiled
#	   3) Name of the table needing to be profiled
#	   4) The type of query that needs to be run (Valid query types:  profiling, custom, sanity)
#	The other variables are NOT required for running the job.  If no variables are set, all queries will be run at run time.
#
#Revision 1
#
#Author:  Alex Meadows
#Author Date: Oct 18 2012
#Purpose: Added PROCESS_TYPE variable and included capability of running automated query processor and custom query processor from script. 
#
#



#standard params
source /opt/pentaho/bash_defaults


#parameters that can be passed from command line
PROCESS_TYPE=$1
SOURCE_NAME=$2
TABLE_NAME=$3
QUERY_TYPE=$4
ANALYZER_OPTS=" "


if [ "$SOURCE_NAME" ] 

then 

ANALYZER_OPTS=$ANALYZER_OPTS"-param:profile_source_name_par=$SOURCE_NAME"
fi

if [ "$TABLE_NAME" ] 

then 

ANALYZER_OPTS=$ANALYZER_OPTS" -param:profile_source_table_name_par=$TABLE_NAME"
fi

if [ "$QUERY_TYPE" ] 

then 

ANALYZER_OPTS=$ANALYZER_OPTS" -param:profile_query_type_par=$QUERY_TYPE"
fi


if [ "$PROCESS_TYPE" == "" ]

then

	echo 'Process type must be declared.  Valid values are:'
	echo '	PROCESS_CUSTOM : Process custom queries and sources stored in profile_customization.'
	echo '	PROCESS_AUTO   : Process sources automatically and build table profiling queries.'
	echo '	ANALYZE	       : Analyze sources as determined by using other variables.'
	echo '    SOURCE_NAME  : What source to analyze.'
        echo '    TABLE_NAME   : What table in the source to analyze.'
        echo '    QUERY_TYPE   : What type of query to run on the table from the source.'
	echo '  MART_LOAD      : Manually load the profile data mart.'

fi

if [ "$PROCESS_TYPE" == "process_custom" ] 

then
	echo 'Starting to Load Custom Sources and Queries...'
	sh $PDI_BASE_DIR/kitchen.sh /file:$PDI_CODE_BASE/quality/generic/process_custom_queries/process_custom_queries_jb.kjb

fi

if [ "$PROCESS_TYPE" == "process_auto" ] 

then
	echo 'Starting to Run Automated Profiling Query Builder...'
	sh $PDI_BASE_DIR/kitchen.sh /file:$PDI_CODE_BASE/quality/generic/process_automated_queries/process_automated_queries_jb.kjb

fi

if [ "$PROCESS_TYPE" == "analyze" ] 

then
	echo 'Starting to Analyze Data.'
	
        sh $PDI_BASE_DIR/kitchen.sh /file:$PDI_CODE_BASE/quality/generic/profile_sample_generator_jb.kjb$ANALYZER_OPTS
fi

if [ "$PROCESS_TYPE" == "mart_load"]

then

       echo 'Starting to Load Profile Data Mart.'

       sh $PDI_BASE_DIR/kitchen.sh /file:$PDI_CODE_BASE/quality/data_mart/profiling_data_mart_jb.kjb
fi
