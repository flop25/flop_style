{combine_css path="template-extension/flop_style/mainpage_categories/picpile_cat.css"}
{if $themeconf.name == "Sylvia"}
{html_head}
  {literal}
  <style>
  #theCategoryPage .content {
      margin: 21px 10px 0 290px !important;
  }
	</style>
  {/literal}
{/html_head}
{/if}
<ul class="thumbnailCategories">
  {foreach from=$category_thumbnails item=cat}
  <li>
  <span class="wrap1"><div class="albumHolder">
    <div class="picRotated"></div>
    <div class="album"> <a class="ajax" href="{$cat.URL}"> <span title="Browse Album" class="highlight"></span> <img width="160" height="120" title="{$cat.NAME|@replace:'"':' '} - {'display this album'|@translate}" alt="{$cat.TN_ALT}" src="{$cat.TN_SRC}"> <span title="Contains {$cat.CAPTION_NB_IMAGES} images" class="albumCnt">{$cat.CAPTION_NB_IMAGES}</span> </a> </div>
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
