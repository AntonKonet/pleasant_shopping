jQuery(document).ready(function(){
  console.log(jQuery("#product_information"));
  jQuery("#product_information").dialog({autoOpen : false, modal : true, show : 'blind', hide: 'blind', width : 600, my : 'center', at : 'center', of : window });
});
