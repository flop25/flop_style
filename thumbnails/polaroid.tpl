{combine_css path="template-extension/flop_style/thumbnails/polaroid.css"}
{combine_script id='jquery.ajaxmanager' path='themes/default/js/plugins/jquery.ajaxmanager.js' load='footer'}
{combine_script id='thumbnails.loader' path='themes/default/js/thumbnails.loader.js' require='jquery.ajaxmanager' load='footer'}
{html_style}{literal}
ul.thumbnails a {
	height:{/literal}{$derivative_params->max_height()+30}{literal}px;
}
ul.thumbnails li
{
	height:{/literal}{$derivative_params->max_height()+70}{literal}px;
}
{/literal}{/html_style}

{define_derivative name='derivative_polaroid' width=$derivative_params->max_width() height=$derivative_params->max_height() crop=true}

{if !empty($thumbnails)}
{strip}{foreach from=$thumbnails item=thumbnail}
{assign var=derivative value=$pwg->derivative($derivative_polaroid, $thumbnail.src_image)}
	<li>
			<a href="{$thumbnail.URL}" title="{if isset($thumbnail.NAME)}{$thumbnail.NAME|truncate:20:" [...]"|@replace:'"':' '}{/if}">
				<img {if $derivative->is_cached()}src="{$derivative->get_url()}"{else}src="{$ROOT_URL}{$themeconf.img_dir}/ajax-loader-big.gif" data-src="{$derivative->get_url()}"{/if}  alt="{$thumbnail.TN_ALT}" title="{$thumbnail.TN_TITLE}" >
			</a>
	</li>
{/foreach}{/strip}
{/if}
