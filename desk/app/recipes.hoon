/-  sur=recipes
/+  default-agent, dbug, lib=recipes

%-  agent:dbug
=|  state-0
=*  state  -
^-  agent:gall
|_  =bowl:gall
+*  this     .
    default  ~(. (default-agent this %|) bowl)
++  on-init
  ^-  (quip card _this)
  `this
++  on-save   !>(state)
++  on-load
  |=  old=vase
  ^-  (quip card _this)
  `this(state !<(state-0 old))
++  on-poke
  |=  [=mark =vase]
  ^-  (quip card _this)
  ?>  =(%recipes-action mark)
  =/  act  !<(action:sur vase)
  =^  cards  state
  ?-  -.act
    %create-recipe
      (create-recipe:lib +.act state bowl)
    %edit-recipe
      (edit-recipe:lib +.act state bowl)
    %delete-recipe
      (delete-recipe:lib +.act state bowl)
    %create-comment
      (create-comment:lib +.act state bowl)
    %delete-comment
      (delete-comment:lib +.act state bowl)
    %create-rating
      (create-rating:lib +.act state bowl)
    %delete-rating
      (delete-rating:lib +.act state bowl)
    %toggle-fav
      (toggle-fav:lib +.act state bowl)
    %create-ingredient
      (create-ingredient:lib +.act state bowl)
    %edit-ingredient
      (edit-ingredient:lib +.act state bowl)
    %delete-ingredient
      (delete-ingredient:lib +.act state bowl)
  ==
  [cards this]
::
++  on-peek
  |=  =path
  ^-  (unit (unit cage))
  ?+  path  (on-peek:default path)
    [%x %recipes ~]
      ``recipes+!>(recipes.state)
  ==
++  on-arvo   on-arvo:default
++  on-watch
  |=  =path
  ^-  (quip card _this)
  ?+    path  (on-watch:default path)
    [%http-response *]
      `this
  ==
++  on-leave  on-leave:default
++  on-agent  on-agent:default
++  on-fail   on-fail:default
--
