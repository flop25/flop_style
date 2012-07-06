{combine_css path="template-extension/flop_style/mainpage_categories/captify_mini.css"}
{combine_script id="jquery.captify" load="header" path="template-extension/flop_style/mainpage_categories/captify/captify.tiny.js"}
{html_head}
  {literal}
<script type="text/javascript">
$(function(){
	$('img.captify').captify({
		// all of these options are... optional
		// ---
		// speed of the mouseover effect
		speedOver: 'fast',
		// speed of the mouseout effect
		speedOut: 'normal',
		// how long to delay the hiding of the caption after mouseout (ms)
		hideDelay: 500,	
		// 'fade', 'slide', 'always-on'
		animation: 'slide',		
		// text/html to be placed at the beginning of every caption
		prefix: '',		
		// opacity of the caption on mouse over
		opacity: '0.7',					
		// the name of the CSS class to apply to the caption box
		className: 'caption-bottom',	
		// position of the caption (top or bottom)
		position: 'bottom',
		// caption span % of the image
		spanWidth: '100%'
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
{define_derivative name='derivative_captify_mini' width=$width height=$derivative_params->max_height() crop=$crop}

<ul class="thumbnailCategories">
{foreach from=$category_thumbnails item=cat}
  <li class="{cycle values="cat_1,cat_2,cat_3,cat_4"}" >
			<span class="wrap1"><a href="{$cat.URL}">
				<img src="{$pwg->derivative_url($derivative_captify_mini, $cat.representative.src_image)}" class="captify" alt="{$cat.NAME|truncate:38:" [...]"}" title="{$cat.NAME|@replace:'"':' '} - {'display this album'|@translate}" >
			</a></span>
	</li>
{/foreach}
</ul>
