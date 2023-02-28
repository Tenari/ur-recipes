|%
+$  card  card:agent:gall
+$  versioned-state
  $%  state-0
  ==
+$  state-0
  $:  [%0 =recipies =comments =ratings =favs =ingredients]
  ==
::
:: tables
::
+$  recipes   (map rid recipe)      :: recipes you have created
+$  comments  (map cid comment)     :: comments on your recipes
+$  ratings   (map rate-id rating)  :: ratings on your recipes
+$  favs      (list rid)            :: just a personal list of your favorite recipes
+$  ingredients  (map cord ingredient) :: for filling out nutrition information, if you care about that. unique by name of the ingredient
                                    :: this is just a personal db, but would be cool to be able to import entries from others
::
:: id types
::
+$  rid   [=ship num=@ud]     :: recipie id
+$  cid   [=rid num=@ud]      :: comment id
+$  rate-id   [=rid =ship]    :: rating id (one rating per recipe per ship)
::
:: enums
::
+$  time-unit  ?(%mins %hrs)
+$  quantity-unit  ?(%g %ml %oz %lb %l %gal %cup %tsp %tbsp %whole %pint %gal)
::
:: core data types
::
+$  recipe  [=rid title=@t prep=@rs prep-unit=time-unit cook=@rs cook-unit=time-unit servings=@ud ingredients=(list r-ing) directions=(list cord) images=(list cord) links=(list cord) created-at=@da updated-at=@da]
+$  r-ing  [amt=@rs unit=quantity-unit name=@t optional=?]

+$  action
  $%  [%create-recipe =recipe]
      [%edit-recipe =recipe]
      [%delete-recipe =rid]
  ==
--
