{combine_css path="template-extension/flop_style/mainpage_categories/picpile_cat.css"}
{combine_script id='jquery.ajaxmanager' path='themes/default/js/plugins/jquery.ajaxmanager.js' load='footer'}
{combine_script id='thumbnails.loader' path='themes/default/js/thumbnails.loader.js' require='jquery.ajaxmanager' load='footer'}
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
    <div class="album"> <a class="ajax" href="{$cat.URL}"> <span title="Browse Album" class="highlight"></span> <img {if $der_picpile_cat->is_cached()}src="{$der_picpile_cat->get_url()}"{else}src="{$ROOT_URL}{$themeconf.img_dir}/ajax-loader-big.gif" data-src="{$der_picpile_cat->get_url()}"{/if}  {$der_picpile_cat->get_size_htm()} title="{$cat.NAME|@replace:'"':' '} - {'display this album'|@translate}" alt="{$cat.TN_ALT}" > <span title="Contains {$cat.CAPTION_NB_IMAGES} images" class="albumCnt">{$cat.CAPTION_NB_IMAGES}</span> </a> </div>
    <div title="{$cat.NAME}" class="albumTitle">{$cat.NAME}</div>
    <div class="clear"></div>
  </div>
  </span>
  </li>
  {/foreach}
</ul>
