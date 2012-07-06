{combine_css path="template-extension/flop_style/mainpage_categories/picpile_cat.css"}
{if $themeconf.name == "Sylvia"}
{html_style}
  {literal}
  #theCategoryPage .content {
      margin: 21px 10px 0 290px !important;
  }
  {/literal}
{/html_style}
{/if}
{define_derivative name='derivative_picpile_cat' width=160 height=120 crop=true}
{html_style}
  {literal}
  .picRotated {
    width:{/literal}{$derivative_picpile_cat->max_width()+18}{literal}px;
    height:{/literal}{$derivative_picpile_cat->max_height()+18}{literal}px;
  }
  .albumHolder {
    width:{/literal}{$derivative_picpile_cat->max_width()+10}{literal}px;
    height:{/literal}{$derivative_picpile_cat->max_height()+10}{literal}px;
  }
  .wrap1 {
    width:{/literal}{$derivative_picpile_cat->max_width()+30}{literal}px;
    height:{/literal}{$derivative_picpile_cat->max_height()+60}{literal}px;
  }
  
  {/literal}
{/html_style}

<ul class="thumbnailCategories">
  {foreach from=$category_thumbnails item=cat}
  {assign var=der_picpile_cat value=$pwg->derivative($derivative_picpile_cat, $cat.representative.src_image)}
  <li>
  <span class="wrap1"><div class="albumHolder">
    <div class="picRotated"></div>
    <div class="album"> <a class="ajax" href="{$cat.URL}"> <span title="Browse Album" class="highlight"></span> <img {$der_picpile_cat->get_size_htm()} title="{$cat.NAME|@replace:'"':' '} - {'display this album'|@translate}" alt="{$cat.TN_ALT}" src="{$der_picpile_cat->get_url()}"> <span title="Contains {$cat.CAPTION_NB_IMAGES} images" class="albumCnt">{$cat.CAPTION_NB_IMAGES}</span> </a> </div>
    <div title="{$cat.NAME}" class="albumTitle">{$cat.NAME}</div>
    <div class="clear"></div>
  </div>
  {*
		<div class="thumbnailCategory">
			<div class="illustration">
			<a href="{$cat.URL}">
				<img src="{$cat.TN_SRC}" alt="{$cat.TN_ALT}" title="{$cat.NAME|@replace:'"':' '} - {'display this album'|@translate}">
			</a>
			</div>
			<div class="description">
				<h3>
					<a href="{$cat.URL}">{$cat.NAME}</a>
					{if !empty($cat.icon_ts)}
					<img title="{$cat.icon_ts.TITLE}" src="{$ROOT_URL}{$themeconf.icon_dir}/recent{if $cat.icon_ts.IS_CHILD_DATE}_by_child{/if}.png" alt="(!)">
					{/if}
				</h3>
		<div class="text">
				{if isset($cat.INFO_DATES) }
				<p class="dates">{$cat.INFO_DATES}</p>
				{/if}
				<p class="Nb_images">{$cat.CAPTION_NB_IMAGES}</p>
				{if not empty($cat.DESCRIPTION)}
				<p>{$cat.DESCRIPTION}</p>
				{/if}
		</div>
			</div>
		</div>
  *}
  </span>
  </li>
  {/foreach}
</ul>
