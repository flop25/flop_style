New developer feature in Piwigo 2.x, "template extensions" make customization easier. flop_style is a "template extension" and enable changes of a small part of Piwigo such as categories display

What's in flop_style ?

flop_style contains 9 templates :
flop_style/mainpage_categories/captify_mini.tpl 			
flop_style/mainpage_categories/jPolaroid.tpl 			
flop_style/mainpage_categories/medium_cat.tpl 			
flop_style/mainpage_categories/mosaic.tpl 			
flop_style/mainpage_categories/picpile_cat.tpl 			
flop_style/mainpage_categories/polaroid.tpl 			
flop_style/thumbnails/fancy_hover.tpl 			
flop_style/thumbnails/jPolaroid.tpl 			
flop_style/thumbnails/polaroid.tpl

How to install ?

-download the zip, put the folder flop_style and its content in the folder template-extension/ of your gallery
-in your administration, go to Configuration->Templates or  admin.php?page=extend_for_templates  if you prefer
-in Original templates select the name of the sub-folder of the template of flop_style (e.g. for lop_style/thumbnails/polaroid.tpl select thumbnails.tpl)
-the 2 others parameters are optional : keep them empty to apply the template to all the gallery and all themes

See the screenshot on this page to have an idea of what is inside !

