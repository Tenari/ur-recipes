import React, { useEffect, useState } from 'react';
import Urbit from '@urbit/http-api';
import { AppTile } from './components/AppTile';

const api = new Urbit('', '', window.desk);
api.ship = window.ship;

async function getRecipes(setRecipes) {
  const response = (await api.scry({
    app: 'recipes',
    path: `/recipes`,
  }));
  setRecipes(response);
}

async function createRecipe(recipe) {
  const response = (await api.poke({
    app: 'recipes',
    mark: 'recipes-action',
    json: {
      'create-recipe': recipe,
    },
  }));
  console.log(response);
}

const fakeRecipe = {
  title: 'Bread',
  prep: 20,
  'prep-unit': 'mins',
  cook: 3,
  'cook-unit': 'hrs',
  servings: 3,
  ingredients: [
    {
      amt: 300,
      unit: 'g',
      name: 'flour',
      optional: false,
    }
  ],
  directions: ['bake it'],
  images: [],
  links: []
};

export function App() {
  const [recipes, setRecipes] = useState([]);

  useEffect(() => {
    getRecipes(setRecipes);
  }, []);

  return (
    <main className="flex items-center justify-center min-h-screen">
      <header>
        <button>Add</button>
        <button>Browse</button>
        <button>Search</button>
        <button>Favs</button>
        <button>Ingredients</button>
        <button>Shopping List</button>
        <button>Settings</button>
      </header>
      <div className="max-w-md space-y-6 py-20">
        <button onClick={()=>createRecipe(fakeRecipe)}>add recipe</button>
        <ul>
        {recipes.map(r=> {
          return <li key={r.rid}>{r.title}</li>
        })}
        </ul>
      </div>
    </main>
  );
}
