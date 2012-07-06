{combine_css path="template-extension/flop_style/mainpage_categories/polaroid.css"}
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
  <li>
			<a href="{$cat.URL}" title="{$cat.NAME|truncate:20:" [...]"|@replace:'"':' '}">
				<img src="{$pwg->derivative_url($derivative_polaroid, $cat.representative.src_image)}"  alt="{$cat.TN_ALT}" title="{$cat.NAME|@replace:'"':' '} - {'display this album'|@translate}" >
			</a>
	</li>
{/foreach}
</ul>
