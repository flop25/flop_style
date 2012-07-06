{combine_css path="template-extension/flop_style/thumbnails/polaroid.css"}
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
	<li>
			<a href="{$thumbnail.URL}" title="{if isset($thumbnail.NAME)}{$thumbnail.NAME|truncate:11:" [...]"|@replace:'"':' '}{/if}">
				<img src="{$pwg->derivative_url($derivative_polaroid, $thumbnail.src_image)}"  alt="{$thumbnail.TN_ALT}" title="{$thumbnail.TN_TITLE}" >
			</a>
	</li>
{/foreach}{/strip}
{/if}
