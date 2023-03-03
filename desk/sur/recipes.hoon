|%
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
+$  cid   @ud                 :: comment id, just counts up from 0 to infinity
+$  rate-id   [=rid =ship]    :: rating id (one rating per recipe per ship)
::
:: enums
::
+$  time-unit  ?(%mins %hrs)
+$  quantity-unit  ?(%g %ml %oz %lb %l %gal %cup %tsp %tbsp %whole %pint)
::
:: core data types
::
+$  recipe    [=rid title=@t prep=@rd prep-unit=time-unit cook=@rd cook-unit=time-unit servings=@ud ingredients=(list r-ing) directions=(list cord) images=(list cord) links=(list cord) created-at=@da updated-at=@da]
+$  r-ing     [amt=@rd unit=quantity-unit name=@t optional=?]
+$  comment   [=cid =rid commenter=ship text=@t created-at=@da updated-at=@da]
+$  rating    @ud  :: 0-5 stars
:: facts are per 100g
+$  ingredient  [name=@t calories=@ud fat=@rd protein=@rd carbs=@rd]

+$  action
  $%  [%create-recipe =inputable-recipe]
      [%edit-recipe =rid =inputable-recipe]
      [%delete-recipe =rid]

      [%create-comment =rid]
      [%delete-comment =cid]

      [%create-rating =rid]     :: always ship is src.bowl, since each ship only gets one rating
      [%delete-rating =rid]     :: always ship is src.bowl

      [%toggle-fav =rid fav=?]

      [%create-ingredient =ingredient]
      [%edit-ingredient =ingredient]
      [%delete-ingredient name=@t]
  ==
+$  inputable-recipe  [title=@t prep=@rd prep-unit=time-unit cook=@rd cook-unit=time-unit servings=@ud ingredients=(list r-ing) directions=(list cord) images=(list cord) links=(list cord)]
--
