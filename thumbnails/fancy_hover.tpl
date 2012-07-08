{combine_css path="template-extension/flop_style/thumbnails/fancy_hover.css"}
{combine_script id='jquery' path='themes/default/js/jquery.min.js'}
{combine_script id='jquery.ajaxmanager' path='themes/default/js/plugins/jquery.ajaxmanager.js' load='footer'}
{combine_script id='thumbnails.loader' path='themes/default/js/thumbnails.loader.js' require='jquery.ajaxmanager' load='footer'}
{define_derivative name='derivative_fh' width=$derivative_params->max_width() height=$derivative_params->max_height() crop=true}
{html_head}
  {literal}
<script type="text/javascript">
jQuery(document).ready(function(){ 
$("ul.thumbnails li").hover(function() {
	$(this).css({'z-index' : '10'}); /*Add a higher z-index value so this image stays on top*/ 
	$(this).find('img').addClass("hover").stop() /* Add class of "hover", then stop animation queue buildup*/
		.animate({
			marginTop: '-{/literal}{$derivative_fh->max_width()*1.25}{literal}px', /* The next 4 lines will vertically align this image */ 
			marginLeft: '-{/literal}{$derivative_fh->max_height()*1.25}{literal}px',
			top: '{/literal}{$derivative_fh->max_width()}{literal}px',
			left: '{/literal}{$derivative_fh->max_height()}{literal}px',
			width: '{/literal}{$derivative_fh->max_width()+70}{literal}px', /* Set new width */
			height: '{/literal}{$derivative_fh->max_height()+70}{literal}px', /* Set new height */
			padding: '15px'
		}, 200); /* this value of "200" is the speed of how fast/slow this hover animates */

	} , function() {
	$(this).css({'z-index' : '0'}); /* Set z-index back to 0 */
	$(this).find('img').removeClass("hover").stop()  /* Remove the "hover" class , then stop animation queue buildup*/
		.animate({
			marginTop: '0', /* Set alignment back to default */
			marginLeft: '0',
			top: '0',
			left: '0',
			width: '{/literal}{$derivative_fh->max_width()}{literal}px', /* Set width back to default */
			height: '{/literal}{$derivative_fh->max_height()}{literal}px', /* Set height back to default */
			padding: '5px'
		}, 400);
});

}); </script>
  {/literal}
{/html_head}

{html_style}{literal}
ul.thumbnails li img {
	height:{/literal}{$derivative_fh->max_height()}{literal}px;
	width:{/literal}{$derivative_fh->max_width()}{literal}px;
}
ul.thumbnails li
{
	width:{/literal}{$derivative_fh->max_width()+10}{literal}px;
	height:{/literal}{$derivative_fh->max_height()+10}{literal}px;
}
{/literal}{/html_style}
{if !empty($thumbnails)}
{strip}{foreach from=$thumbnails item=thumbnail}
{assign var=derivative value=$pwg->derivative($derivative_fh, $thumbnail.src_image)}
	<li>
    <a href="{$thumbnail.URL}" title="{if isset($thumbnail.NAME)}{$thumbnail.NAME|truncate:11:" [...]"|@replace:'"':' '}{/if}">
      <img {if $derivative->is_cached()}src="{$derivative->get_url()}"{else}src="{$ROOT_URL}{$themeconf.img_dir}/ajax-loader-big.gif" data-src="{$derivative->get_url()}"{/if} class="thumb_jpolaroid" alt="{$thumbnail.TN_ALT}" title="{$thumbnail.TN_TITLE}" >
    </a>
	</li>
{/foreach}{/strip}
{/if}
