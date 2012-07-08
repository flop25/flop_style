{combine_css path="template-extension/flop_style/mainpage_categories/mosaic/mosaic.css"}
{combine_css path="template-extension/flop_style/mainpage_categories/mosaic.css"}
{combine_script id="jquery.mosaic" load="header" path="template-extension/flop_style/mainpage_categories/mosaic/mosaic.1.0.1.min.js"}
{combine_script id='jquery.ajaxmanager' path='themes/default/js/plugins/jquery.ajaxmanager.js' load='footer'}
{combine_script id='thumbnails.loader' path='themes/default/js/thumbnails.loader.js' require='jquery.ajaxmanager' load='footer'}
{html_head}
  {literal} 
<script type="text/javascript">
			jQuery(function($){
				$('.bar').mosaic({
					animation	:	'slide'
				});
		    });
</script> 
{/literal}
{/html_head}
{html_style}{literal}
.mosaic-block, .mosaic-backdrop img  {
	width:{/literal}{$derivative_params->max_width()}{literal}px;
	height:{/literal}{$derivative_params->max_height()}{literal}px;
}
{/literal}{/html_style}

{define_derivative name='derivative_mosaic' width=$derivative_params->max_width() height=$derivative_params->max_height() crop=true}
<div id="mosaic-content"> {foreach from=$category_thumbnails item=cat}
{assign var=derivative value=$pwg->derivative($derivative_mosaic, $cat.representative.src_image)}
  <div class="mosaic-block bar"> <a href="{$cat.URL}" class="mosaic-overlay">
    <div class="details">
      <h4> {$cat.NAME}
        {if !empty($cat.icon_ts)} <img title="{$cat.icon_ts.TITLE}" src="{$ROOT_URL}{$themeconf.icon_dir}/recent{if $cat.icon_ts.IS_CHILD_DATE}_by_child{/if}.png" alt="(!)"> {/if} </h4>
      <p>{if isset($cat.INFO_DATES) }
        {$cat.INFO_DATES}
        {/if}
        {$cat.CAPTION_NB_IMAGES}
        {if not empty($cat.DESCRIPTION)}
        {$cat.DESCRIPTION}
        {/if} </p>
    </div>
    </a>
    <div class="mosaic-backdrop"> <img {if $derivative->is_cached()}src="{$derivative->get_url()}"{else}src="{$ROOT_URL}{$themeconf.img_dir}/ajax-loader-big.gif" data-src="{$derivative->get_url()}"{/if} alt="{$cat.TN_ALT}" title="{$cat.NAME|@replace:'"':' '} - {'display this album'|@translate}"> </div>
  </div>
  {/foreach}
</div>
