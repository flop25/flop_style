{combine_css path="template-extension/flop_style/mainpage_categories/medium_cat.css"}
{html_style}{literal}
.thumbnailCategory .illustration {
	width:{/literal}{$derivative_params->max_width()+5}{literal}px;
}

.thumbnailCategory {
	height:{/literal}{$derivative_params->max_width()+60}{literal}px;
	width:{/literal}{$derivative_params->max_width()+10}{literal}px;
  overflow:hidden;
}
{/literal}{/html_style}

<ul class="thumbnailCategories">
{foreach from=$category_thumbnails item=cat}
  <li class="{cycle values="cat_1,cat_2,cat_3,cat_4"}" >
		<div class="thumbnailCategory">
			<div class="illustration">
			<a href="{$cat.URL}">
				<img src="{$pwg->derivative_url($derivative_params, $cat.representative.src_image)}" alt="{$cat.TN_ALT}" title="{$cat.NAME|@replace:'"':' '} - {'display this album'|@translate}">
			</a>
			</div>
			<div class="description">
				<h3>
					<a href="{$cat.URL}">{$cat.NAME|truncate:38:" [...]"}</a>
					{if !empty($cat.icon_ts)}
					<img title="{$cat.icon_ts.TITLE}" src="{$ROOT_URL}{$themeconf.icon_dir}/recent{if $cat.icon_ts.IS_CHILD_DATE}_by_child{/if}.png" alt="(!)">
					{/if}
				</h3>
		<div class="text">
				{if isset($cat.INFO_DATES) }
				<p class="dates">{$cat.INFO_DATES}</p>
				{/if}
				<p class="Nb_images">{$cat.CAPTION_NB_IMAGES}</p>
		</div>
			</div>
		</div>
	</li>
{/foreach}
</ul>
