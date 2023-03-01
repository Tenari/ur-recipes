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
      </div>
    </main>
  );
}
