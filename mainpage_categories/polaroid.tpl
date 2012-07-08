{combine_css path="template-extension/flop_style/mainpage_categories/polaroid.css"}
{combine_script id='jquery.ajaxmanager' path='themes/default/js/plugins/jquery.ajaxmanager.js' load='footer'}
{combine_script id='thumbnails.loader' path='themes/default/js/thumbnails.loader.js' require='jquery.ajaxmanager' load='footer'}
{html_style}{literal}
ul.polaroids a {
	height:{/literal}{$derivative_params->max_height()+30}{literal}px;
}
ul.polaroids li
{
	height:{/literal}{$derivative_params->max_height()+70}{literal}px;
}
{/literal}{/html_style}

{define_derivative name='derivative_polaroid' width=$derivative_params->max_width() height=$derivative_params->max_height() crop=true}
<ul class="polaroids">
{foreach from=$category_thumbnails item=cat}
 {assign var=derivative value=$pwg->derivative($derivative_polaroid, $cat.representative.src_image)}
 <li>
			<a href="{$cat.URL}" title="{$cat.NAME|truncate:20:" [...]"|@replace:'"':' '}">
				<img {if $derivative->is_cached()}src="{$derivative->get_url()}"{else}src="{$ROOT_URL}{$themeconf.img_dir}/ajax-loader-big.gif" data-src="{$derivative->get_url()}"{/if}  alt="{$cat.TN_ALT}" title="{$cat.NAME|@replace:'"':' '} - {'display this album'|@translate}" >
			</a>
	</li>
{/foreach}
</ul>
