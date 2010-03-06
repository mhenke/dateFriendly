<cfcomponent output="false">

	<cffunction name="init">
		<cfset this.version = "1.0.2">
		<cfreturn this>
	</cffunction>
	
	<cffunction name="$dateOrTimeSelect" returntype="string" access="public" output="false">
		<cfargument name="objectName" type="any" required="true">
		<cfargument name="property" type="string" required="true">
		<cfargument name="$functionName" type="string" required="true">
		<cfscript>
			var loc = {};
			arguments.label="Date Friendly";
			loc.name = $tagName(arguments.objectName, arguments.property);
			// entry[dateCreated]
			arguments.$id = $tagId(arguments.objectName, arguments.property);
			loc.js = addJS(arguments.$id);
			// entry-dateCreated
			loc.value = $formValue(argumentCollection=arguments);
			// blank
			loc.returnValue = "";
			loc.returnValue = Evaluate('textField(argumentCollection=arguments)');
		</cfscript>
		<cfreturn loc.returnValue>
	</cffunction>
	
	<cffunction name="addJS" returntype="Any" access="public" output="false" hint="" mixin="controller">
		<cfargument name="id" type="any" required="true">
		<!--- TODO: css and js files in a better location locally --->
		<cfsavecontent variable="headJS">
			<script type="text/javascript" src="/plugins/dateFriendly/js/jquery-1.4.2.min.js"></script> 
			<script type="text/javascript" src="/plugins/dateFriendly/js/jquery-ui-1.8rc3.custom.min.js"></script> 
			<!--- TODO: extract only the specific css needed --->
			<link type="text/css" href="http://jqueryui.com/themes/base/jquery.ui.all.css" rel="stylesheet" />
			<link type="text/css" href="http://jqueryui.com/demos/demos.css" rel="stylesheet" />
	
		<!--- TODO: need to loop and set each id for a date field --->
		<cfoutput>
			<script type="text/javascript"> 
			$(function() {
				$("###arguments.id#").datepicker();
			});
			</script> 
		</cfoutput>
		</cfsavecontent>
			
		<cfhtmlhead text="#headJS#" />
	</cffunction>
</cfcomponent>