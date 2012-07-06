{combine_css path="template-extension/flop_style/mainpage_categories/spotlight.css"}
{footer_script require='jquery'}{literal}
$(document).ready(function () {
 
    //loop through all the children in #items
    //save title value to a span and then remove the value of the title to avoid tooltips
    $('#items .item').each(function () {
        title = $(this).attr('title');
        $(this).append('<span class="caption">' + title + '</span>');   
        $(this).attr('title','');
    });
 
    $('#items .item').hover(
        function () {
            //set the opacity of all siblings
            $(this).siblings().css({'opacity': '0.1'}); 
             
            //set the opacity of current item to full, and add the effect class
            $(this).css({'opacity': '1.0'}).addClass('effect');
             
            //show the caption
            $(this).children('.caption').show();    
        },
        function () {
            //hide the caption
            $(this).children('.caption').hide();        
        }
    );
     
    $('#items').mouseleave(function () {
        //reset all the opacity to full and remove effect class
        $(this).children().fadeTo('100', '1.0').removeClass('effect');      
    });
     
});
$(document).ready(function() {
var max_dim_width = 0;
var max_dim_height = 0;
  $(".item img").each(function () {
    if (jQuery(this).height() > max_dim_height)
      max_dim_height = jQuery(this).height() + 10;
    if (jQuery(this).width() > max_dim_width)
      max_dim_width = jQuery(this).width() + 10;

    jQuery(".item, .item img")
      .css('width', max_dim_width+'px')
      .css('height', max_dim_height+'px');
  });
});

{/literal}{/footer_script}
<div id="items">
{foreach from=$category_thumbnails item=cat}
			<a href="{$cat.URL}" class="item" title="{$cat.NAME|@replace:'"':' '}{if not empty($cat.DESCRIPTION)} - {$cat.DESCRIPTION|@replace:'"':' '}{/if}">
				<img src="{$pwg->derivative_url($derivative_params, $cat.representative.src_image)}" alt="{$cat.TN_ALT}" >
			</a>
{/foreach}
</div>
