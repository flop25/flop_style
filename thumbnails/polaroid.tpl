{combine_css path="template-extension/flop_style/thumbnails/polaroid.css"}

{if !empty($thumbnails)}
{strip}{foreach from=$thumbnails item=thumbnail}
	<li>
			<a href="{$thumbnail.URL}" title="{if isset($thumbnail.NAME)}{$thumbnail.NAME|truncate:11:" [...]"|@replace:'"':' '}{/if}">
				<img src="{$thumbnail.TN_SRC}"  alt="{$thumbnail.TN_ALT}" title="{$thumbnail.TN_TITLE}" >
			</a>
	</li>
{/foreach}{/strip}
{/if}
