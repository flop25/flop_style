{combine_css path="template-extension/flop_style/mainpage_categories/polaroid.css"}

<ul class="polaroids">
{foreach from=$category_thumbnails item=cat}
  <li>
			<a href="{$cat.URL}" title="{$cat.NAME|truncate:20:" [...]"|@replace:'"':' '}">
				<img src="{$cat.TN_SRC}"  alt="{$cat.TN_ALT}" title="{$cat.NAME|@replace:'"':' '} - {'display this album'|@translate}" >
			</a>
	</li>
{/foreach}
</ul>
<br style="clear:both" />