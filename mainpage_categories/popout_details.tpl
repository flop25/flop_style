{combine_css path="template-extension/flop_style/mainpage_categories/popout_details.css"}
{footer_script require='jquery'}
{literal} 
var max_dim_width = 0;
var max_dim_height = 0;
jQuery(window).load(function() {
  $(".columns a img").each(function () {
    if (jQuery(this).height() > max_dim_height)
      max_dim_height = jQuery(this).height() + 10;
    if (jQuery(this).width() > max_dim_width)
      max_dim_width = jQuery(this).width() + 10;

    jQuery(".columns a img")
      .css('width', max_dim_width+'px')
      .css('height', max_dim_height+'px');
    jQuery(".columns li, .columns .info")
      .css('width', max_dim_width+'px');
    jQuery(".columns .info")
      .css('padding-top', max_dim_height+'px')
      .css('max-height', max_dim_height+'px');
  });
});
{/literal}
{/footer_script}
<ul class="columns">
{foreach from=$category_thumbnails item=cat}
  <li>
      <a href="{$cat.URL}">
        <img src="{$pwg->derivative_url($derivative_params, $cat.representative.src_image)}" alt="{$cat.TN_ALT}" title="{$cat.NAME|@replace:'"':' '} - {'display this album'|@translate}">
      </a>
      <div class="info">
        <h6>
          <a href="{$cat.URL}">{$cat.NAME}</a>
          {if !empty($cat.icon_ts)}
          <img title="{$cat.icon_ts.TITLE}" src="{$ROOT_URL}{$themeconf.icon_dir}/recent{if $cat.icon_ts.IS_CHILD_DATE}_by_child{/if}.png" alt="(!)">
          {/if}
        </h6>
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
  </li>
{/foreach}
</ul>
<div style="clear:left" > </div>
