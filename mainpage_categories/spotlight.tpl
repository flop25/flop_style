{combine_css path="template-extension/flop_style/mainpage_categories/spotlight.css"}
{combine_script id='jquery.ajaxmanager' path='themes/default/js/plugins/jquery.ajaxmanager.js' load='footer'}
{combine_script id='thumbnails.loader' path='themes/default/js/thumbnails.loader.js' require='jquery.ajaxmanager' load='footer'}
{footer_script require='jquery'}{literal}
jQuery(document).ready(function () {
 
    //loop through all the children in #items
    //save title value to a span and then remove the value of the title to avoid tooltips
    jQuery('#items .item').each(function () {
        title = jQuery(this).attr('title');
        jQuery(this).append('<span class="caption">' + title + '</span>');   
        jQuery(this).attr('title','');
    });
 
    jQuery('#items .item').hover(
        function () {
            //set the opacity of all siblings
            jQuery(this).siblings().css({'opacity': '0.1'}); 
             
            //set the opacity of current item to full, and add the effect class
            jQuery(this).css({'opacity': '1.0'}).addClass('effect');
             
            //show the caption
            jQuery(this).children('.caption').show();    
        },
        function () {
            //hide the caption
            jQuery(this).children('.caption').hide();        
        }
    );
     
    jQuery('#items').mouseleave(function () {
        //reset all the opacity to full and remove effect class
        jQuery(this).children().fadeTo('100', '1.0').removeClass('effect');      
    });
     
});

{/literal}{/footer_script}
{define_derivative name='spotlight' width=$derivative_params->max_width() height=$derivative_params->max_height() crop=true}

<div id="items">
{foreach from=$category_thumbnails item=cat}
{assign var=derivative value=$pwg->derivative($spotlight, $cat.representative.src_image)}
  <a href="{$cat.URL}" class="item" title="{$cat.NAME|@replace:'"':' '}{if not empty($cat.DESCRIPTION)} - {$cat.DESCRIPTION|@replace:'"':' '}{/if}" style="{assign var=sz value=$derivative->get_size()}width:{$sz[0]}px;height:{$sz[1]}px">
    <img {if $derivative->is_cached()}src="{$derivative->get_url()}"{else}src="{$ROOT_URL}{$themeconf.img_dir}/ajax-loader-big.gif" data-src="{$derivative->get_url()}"{/if} alt="{$cat.TN_ALT}" {$derivative->get_size_htm()}>
  </a>
{/foreach}
</div>
