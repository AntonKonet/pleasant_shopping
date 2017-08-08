jQuery('#product_information').html("<%= escape_javascript render(:partial => 'detailed_view', :layout=>false) %>");
jQuery("#product_information").dialog('open');
