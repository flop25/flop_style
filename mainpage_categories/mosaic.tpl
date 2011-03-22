{combine_css path="template-extension/flop_style/mainpage_categories/mosaic/mosaic.css"}
{combine_css path="template-extension/flop_style/mainpage_categories/mosaic.css"}
{combine_script id="jquery.mosaic" load="header" path="template-extension/flop_style/mainpage_categories/mosaic/mosaic.1.0.1.min.js"}
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
<div id="mosaic-content"> {foreach from=$category_thumbnails item=cat}
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
    <div class="mosaic-backdrop"> <img src="{$cat.TN_SRC}" alt="{$cat.TN_ALT}" title="{$cat.NAME|@replace:'"':' '} - {'display this album'|@translate}"> </div>
  </div>
  {/foreach}
</div>
