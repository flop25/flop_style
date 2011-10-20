{combine_css path="template-extension/flop_style/mainpage_categories/jPolaroid.css"}
{combine_css path="template-extension/flop_style/mainpage_categories/jPolaroid/jpolaroid.minified.css"}
{combine_script id="jquery.jpolaroid.minified" load="header" path="template-extension/flop_style/mainpage_categories/jpolaroid/jquery.jpolaroid.min.js"}
{html_head}
  {literal}
<script type="text/javascript">
$(document).ready(function(){ 
    $('.jpolaroid img').polaroid({ 
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

<ul class="jpolaroid">
{foreach from=$category_thumbnails item=cat}
  <li>
			<a href="{$cat.URL}" title="{$cat.NAME|@replace:'"':' '}">
				<img src="{$cat.TN_SRC}"  alt="{$cat.TN_ALT}" title="{$cat.NAME|@replace:'"':' '} - {'display this album'|@translate}" >
			</a>
	</li>
{/foreach}
</ul>
