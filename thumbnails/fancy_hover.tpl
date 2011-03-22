{combine_css path="template-extension/flop_style/thumbnails/fancy_hover.css"}
{combine_script id='jquery' path='themes/default/js/jquery.min.js'}
{html_head}
  {literal}
<script type="text/javascript">
$(document).ready(function(){ 
$("ul.thumbnails li").hover(function() {
	$(this).css({'z-index' : '10'}); /*Add a higher z-index value so this image stays on top*/ 
	$(this).find('img').addClass("hover").stop() /* Add class of "hover", then stop animation queue buildup*/
		.animate({
			marginTop: '-110px', /* The next 4 lines will vertically align this image */ 
			marginLeft: '-110px',
			top: '50%',
			left: '50%',
			width: '174px', /* Set new width */
			height: '174px', /* Set new height */
			padding: '20px'
		}, 200); /* this value of "200" is the speed of how fast/slow this hover animates */

	} , function() {
	$(this).css({'z-index' : '0'}); /* Set z-index back to 0 */
	$(this).find('img').removeClass("hover").stop()  /* Remove the "hover" class , then stop animation queue buildup*/
		.animate({
			marginTop: '0', /* Set alignment back to default */
			marginLeft: '0',
			top: '0',
			left: '0',
			width: '100px', /* Set width back to default */
			height: '100px', /* Set height back to default */
			padding: '5px'
		}, 400);
});

}); </script>
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
