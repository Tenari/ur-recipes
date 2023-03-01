/-  *versioned-state, sur=recipes
|%
::
::  random helpers
::

::
::  poke actions
::
++  create-recipe
::recipes &recipes-action [%create-recipe 'bread' .1.0 %hrs .1.0 %hrs 4 [.4.0 %cup 'flour' %.n]~ ~['bake it'] ~ ~]
  |=  [=inputable-recipe:sur state=state-0 =bowl:gall]
  ^-  (quip card state-0)

  ?>  =(src.bowl our.bowl)  :: only you can create a recipe for yourself

  =/  new-rid=rid:sur   [our.bowl next-rid.state]
  =/  new-recipe=recipe:sur   [
    new-rid
    title.inputable-recipe
    prep.inputable-recipe
    prep-unit.inputable-recipe
    cook.inputable-recipe
    cook-unit.inputable-recipe
    servings.inputable-recipe
    ingredients.inputable-recipe
    directions.inputable-recipe
    images.inputable-recipe
    links.inputable-recipe
    now.bowl
    now.bowl
  ]
  =.  recipes.state  (~(put by recipes.state) new-rid new-recipe)
  =.  next-rid.state  +(next-rid.state)

  [~ state]
::
++  edit-recipe
::recipes &recipes-action [%edit-recipe 'bread' .1.0 %hrs .1.0 %hrs 4 [.4.0 %cup 'flour' %.n]~ ~['bake it'] ~ ~]
  |=  [[=rid:sur =inputable-recipe:sur] state=state-0 =bowl:gall]
  ^-  (quip card state-0)

  ?>  =(src.bowl our.bowl)  :: only you can edit your recpies
  [~ state]
::
++  delete-recipe
::recipes &recipes-action [%edit-recipe 'bread' .1.0 %hrs .1.0 %hrs 4 [.4.0 %cup 'flour' %.n]~ ~['bake it'] ~ ~]
  |=  [=rid:sur state=state-0 =bowl:gall]
  ^-  (quip card state-0)

  ?>  =(src.bowl our.bowl)  :: only you can delete your recipes
  [~ state]
::
++  create-comment
::recipes &recipes-action [%create-comment [~zod 0]]
  |=  [=rid:sur state=state-0 =bowl:gall]
  ^-  (quip card state-0)
  [~ state]
::
++  delete-comment
::recipes &recipes-action [%delete-comment 0]
  |=  [=cid:sur state=state-0 =bowl:gall]
  ^-  (quip card state-0)
  [~ state]
::
++  create-rating
::recipes &recipes-action [%create-rating [~zod 0]]
  |=  [=rid:sur state=state-0 =bowl:gall]
  ^-  (quip card state-0)
  [~ state]
::
++  delete-rating
::recipes &recipes-action [%delete-rating [~zod 0]]
  |=  [=rid:sur state=state-0 =bowl:gall]
  ^-  (quip card state-0)
  [~ state]
::
++  toggle-fav
::recipes &recipes-action [%toggle-fav [~zod 0] %.y]
  |=  [[=rid:sur fav=?] state=state-0 =bowl:gall]
  ^-  (quip card state-0)
  ?>  =(src.bowl our.bowl)  :: only you can mess with your favs
  [~ state]
::
++  create-ingredient
::recipes &recipes-action [%create-ingredient ['sour cream' 214 .38.0 .5.0 .1.0]]
  |=  [=ingredient:sur state=state-0 =bowl:gall]
  ^-  (quip card state-0)
  [~ state]
::
++  edit-ingredient
::recipes &recipes-action [%edit-ingredient ['sour cream' 214 .38.0 .5.0 .1.0]]
  |=  [=ingredient:sur state=state-0 =bowl:gall]
  ^-  (quip card state-0)
  [~ state]
::
++  delete-ingredient
::recipes &recipes-action [%delete-ingredient 'sour cream']
  |=  [name=@t state=state-0 =bowl:gall]
  ^-  (quip card state-0)
  [~ state]
::
::  JSON
::
++  enjs
  =,  enjs:format
  |%
    ++  recipes
      |=  =recipes:sur
      ^-  json
      [%a ~(val by (~(run by recipes) recipe))]
    ::
    ++  recipe
      |=  =recipe:sur
      ^-  json
      %-  pairs
      :~  rid+(en-rid rid.recipe)
          title+s+title.recipe
          created-at+(time created-at.recipe)
          updated-at+(time updated-at.recipe)
      ==
    ++  en-rid
      |=  =rid:sur
      ^-  json
      s+(spat [(scot %p ship.rid) (crip (en-json:html (numb num.rid))) ~])
    ++  metadata-to-json
      |=  m=(map cord cord)
      ^-  json
      o+(~(rut by m) |=([k=cord v=cord] s+v))
  --
--
