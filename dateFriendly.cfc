<cfcomponent output="false">

	<cffunction name="init">
		<cfset this.version = "1.0.2">
		<cfreturn this>
	</cffunction>
	
	<cffunction name="$dateOrTimeSelect" returntype="string" access="public" output="false">
		<cfargument name="objectName" type="any" required="true">
		<cfargument name="property" type="string" required="true">
		<cfargument name="$functionName" type="string" required="true">
		<cfargument name="include" type="string" default="date">
		<cfscript>
			var loc = {};
			loc.name = $tagName(arguments.objectName, arguments.property);
			arguments.$id = $tagId(arguments.objectName, arguments.property);
			// TODO: need to make this a list of date/time ids and then do once
			loc.js = addJS(arguments.$id,arguments.include);
			loc.value = $formValue(argumentCollection=arguments);
			loc.returnValue = "";
			loc.returnValue = Evaluate('textField(argumentCollection=arguments)');
		</cfscript>
		<cfreturn loc.returnValue>
	</cffunction>
	
	<cffunction name="addJS" returntype="Any" access="public" output="false" hint="" mixin="controller">
		<cfargument name="id" type="any" required="true">
		<cfargument name="include" type="any" hint="will decide what js to include date, time, or both" required="true">
		<!--- TODO: css and js files in a better location locally --->
		<cfsavecontent variable="headJS">
		<script type="text/javascript" src="/plugins/dateFriendly/js/jquery-1.4.2.min.js"></script> 
		<script type="text/javascript" src="/plugins/dateFriendly/js/jquery-ui-1.7.2.custom.min.js"></script> 
		<script type="text/javascript" src="/plugins/dateFriendly/js/timepicker.js"></script>  
		
		<!--- TODO: extract only the specific css needed --->
		<link type="text/css" href="http://jqueryui.com/themes/base/jquery.ui.all.css" rel="stylesheet" />
		<link type="text/css" href="http://jqueryui.com/demos/demos.css" rel="stylesheet" />
		
		<cfoutput>
			<!--- if date/time --->
			 <script type="text/javascript">  
			 $(function() {  
			     $('###arguments.id#').datepicker({  
			         duration: '',  
			         showTime: true,  
			         constrainInput: false,  
			         stepMinutes: 1,  
			         stepHours: 1,  
			         altTimeField: '',  
			         time24h: false  
			      });  
			 });  
			 </script>
		</cfoutput>
		</cfsavecontent>
			
		<cfhtmlhead text="#headJS#" />
	</cffunction>
</cfcomponent>