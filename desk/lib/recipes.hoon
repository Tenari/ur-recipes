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
++  dejs
  =,  dejs:format
  |%
  ++  action
    |=  jon=json
    ^-  action:sur
    =<  (decode jon)
    |%
    ++  decode
      %-  of
      :~  [%create-recipe inputable-recipe]
          [%edit-recipe (ot ~[rid+rid recipe+inputable-recipe])]
          [%delete-recipe rid]

          [%create-comment rid]
          [%delete-comment ni]
          ::[%create-rating =rid]
          ::[%delete-rating =rid]

          ::[%toggle-fav =rid fav=?]

          ::[%create-ingredient =ingredient]
          ::[%edit-ingredient =ingredient]
          ::[%delete-ingredient name=@t]
      ==
    ::
    ++  inputable-recipe
      %-  ot
      :~  [%title so]
          [%prep ne]
          [%prep-unit se-tu]
          [%cook ne]
          [%cook-unit se-tu]
          [%servings ni]
          [%ingredients (ar ing)]
          [%directions (ar so)]
          [%images (ar so)]
          [%links (ar so)]
      ==
    ::
    ++  ing
      %-  ot
      :~  [%amt ne]
          [%unit se-qu]
          [%name so]
          [%optional bo]
      ==
    ::
    ++  rid
      %+  cu
        path-to-rid
      pa
    ::
    ++  path-to-rid
      |=  p=path
      ^-  rid:sur
      [`@p`(slav %p +2:p) `@ud`(slav %ud +6:p)]
    ::
    ++  se-tu
      %+  cu
        |=  t=@tas
        ^-  time-unit:sur
        ?+  t  !!
          %mins  %mins
          %hrs  %hrs
        ==
      (se %tas)
    ::
    ++  se-qu
      %+  cu
        |=  t=@tas
        ^-  quantity-unit:sur
        ?+  t  !!
          %g    %g
          %ml   %ml
          %oz   %oz
          %lb   %lb
          %l    %l
          %gal  %gal
          %cup  %cup
          %tsp  %tsp
          %tbsp   %tbsp
          %whole  %whole
          %pint   %pint
        ==
      (se %tas)
    ::
    ++  dri   :: specify in integer milliseconds, returns a @dr
      (cu |=(t=@ud ^-(@dr (div (mul ~s1 t) 1.000))) ni)
    ::
    ++  null-or-dri   :: specify in integer milliseconds, returns a @dr
      (cu |=(t=@ud ^-(@dr (div (mul ~s1 t) 1.000))) null-or-ni)
    ::
    ++  null-or-ni  :: accepts either a null or a n+'123', and converts nulls to 0, non-null to the appropriate number
      |=  jon=json
      ^-  @ud
      ?+  jon  !!
        [%n *]  (rash p.jon dem)
        ~       0
      ==
    --
  --
--
