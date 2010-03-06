<!--- TODO: create a real demo using all date/time helper tags --->

<!doctype html> 
<html lang="en"> 
<head> 
	<title>jQuery UI Datepicker - Default functionality</title> 
	<script type="text/javascript" src="/plugins/dateFriendly/js/jquery-1.4.2.min.js"></script> 
	<script type="text/javascript" src="/plugins/dateFriendly/js/jquery-ui-1.7.2.custom.min.js"></script> 
	<script type="text/javascript" src="/plugins/dateFriendly/js/timepicker.js"></script> 
	<link type="text/css" href="http://jqueryui.com/themes/base/jquery.ui.all.css" rel="stylesheet" />
	<link type="text/css" href="http://jqueryui.com/demos/demos.css" rel="stylesheet" />

	<script type="text/javascript"> 
	$(function() {
		$("#datepicker").datepicker();
	});
	</script> 
	
	 <script type="text/javascript">  
 $(function() {  
     $('#datetime').datepicker({  
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

</head> 
<body> 
 
<div class="demo"> 
 
<p>Date: <input type="text" id="datepicker"></p> 
<p>Date and Time: <input type="text" name="datetime" id="datetime" value="01.06.2009 00:00"> </p> 
</div><!-- End demo --> 
 
<div class="demo-description"> 
 
<p>The datepicker is tied to a standard form input field.  Focus on the input (click, or use the tab key) to open an interactive calendar in a small overlay.  Choose a date, click elsewhere on the page (blur the input), or hit the Esc key to close. If a date is chosen, feedback is shown as the input's value.</p> 
 
</div><!-- End demo-description --> 
 
</body> 
</html> 