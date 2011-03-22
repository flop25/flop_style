{if !empty($thumbnails)}
{strip}{foreach from=$thumbnails item=thumbnail}
	<li>
			<a href="{$thumbnail.URL}" title="{if isset($thumbnail.NAME)}{$thumbnail.NAME}{elseif}{$thumbnail.TN_TITLE}{/if}">
				<img src="{$thumbnail.TN_SRC}"  alt="{$thumbnail.TN_ALT}" title="{$thumbnail.TN_TITLE}" >
			</a>
	</li>
{/foreach}{/strip}
{/if}
