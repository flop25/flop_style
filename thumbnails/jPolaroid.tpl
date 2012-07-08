{combine_css path="template-extension/flop_style/thumbnails/jPolaroid.css"}
{combine_css path="template-extension/flop_style/mainpage_categories/jPolaroid/jpolaroid.minified.css"}
{combine_script id="jquery.jpolaroid.minified" load="header" path="template-extension/flop_style/mainpage_categories/jPolaroid/jquery.jpolaroid.min.js"}
{combine_script id='jquery.ajaxmanager' path='themes/default/js/plugins/jquery.ajaxmanager.js' load='footer'}
{combine_script id='thumbnails.loader' path='themes/default/js/thumbnails.loader.js' require='jquery.ajaxmanager' load='footer'}
{html_head}
  {literal}
<script type="text/javascript">
$(document).ready(function(){ 
    $('.thumb_jpolaroid').polaroid({ 
        tape:true, 
        shadowPos: "bottom-right", 
        bottom: "33px", 
        top: "22px", 
        left: "27px", 
        right: "27px", 
        shadowColor: "#CCCCCC", 
        backgroundColor: "#FDFDFD" 
    }); 
}); 
</script>
  {/literal}
{/html_head}
{assign var=crop value=$derivative_params->sizing->max_crop}
{if $crop==1}
{assign var=crop value=true}
{assign var=width value=$derivative_params->max_width()}
{else}
{assign var=crop value=false}
{assign var=width value=99999}
{/if}
{define_derivative name='derivative_jPolaroid' width=$width height=$derivative_params->max_height() crop=$crop}

{if !empty($thumbnails)}
{strip}{foreach from=$thumbnails item=thumbnail}
{assign var=derivative value=$pwg->derivative($derivative_jPolaroid, $thumbnail.src_image)}
	<li>
    <a href="{$thumbnail.URL}" title="{if isset($thumbnail.NAME)}{$thumbnail.NAME|truncate:11:" [...]"|@replace:'"':' '}{/if}">
      <img {if $derivative->is_cached()}src="{$derivative->get_url()}"{else}src="{$ROOT_URL}{$themeconf.img_dir}/ajax-loader-big.gif" data-src="{$derivative->get_url()}"{/if} class="thumb_jpolaroid" alt="{$thumbnail.TN_ALT}" title="{$thumbnail.TN_TITLE}" >
    </a>
	</li>
{/foreach}{/strip}
{/if}
