{combine_css path="template-extension/flop_style/thumbnails/jPolaroid.css"}
{combine_css path="template-extension/flop_style/mainpage_categories/jPolaroid/jpolaroid.minified.css"}
{combine_script id="jquery.jpolaroid.minified" load="header" path="template-extension/flop_style/mainpage_categories/jPolaroid/jquery.jpolaroid.min.js"}
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

{if !empty($thumbnails)}
{strip}{foreach from=$thumbnails item=thumbnail}
	<li>
			<a href="{$thumbnail.URL}" title="{if isset($thumbnail.NAME)}{$thumbnail.NAME|truncate:11:" [...]"|@replace:'"':' '}{/if}">
				<img src="{$thumbnail.TN_SRC}" class="thumb_jpolaroid" alt="{$thumbnail.TN_ALT}" title="{$thumbnail.TN_TITLE}" >
			</a>
	</li>
{/foreach}{/strip}
{/if}
