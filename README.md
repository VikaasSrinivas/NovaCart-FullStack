# NovaCart — Full-stack e-commerce starter

A responsive demo store with **React + Vite**, an **AngularJS 1.x admin dashboard**, **Node.js + Express**, and a persistent **SQLite** database.

> Learning/demo project: checkout creates a demo order only. No payment is collected. The admin page has no authentication and must not be exposed publicly.

## Requirements
- Windows 10/11 and VS Code
- Node.js 20 LTS or newer (npm included)
- Internet for npm installs and AngularJS CDN

Check `node --version` and `npm --version` in the VS Code terminal. Extract this ZIP, open the `NovaCart-FullStack` folder in VS Code, then run from the project root:

```powershell
npm install
npm install --prefix server
npm install --prefix client
npm run dev
```

Open **storefront** at http://localhost:5173, **AngularJS admin** at http://localhost:4000/admin, and **API health** at http://localhost:4000/api/health. Keep the terminal open; press Ctrl+C to stop. Alternatively, double-click `start-novacart.bat` to install dependencies and launch.

Product photos load from Unsplash image URLs, so the storefront needs an internet connection to display those images. Product prices, specifications, ratings, and review counts are illustrative demo content, not verified offers or real customer reviews.

## Included features
- Expanded catalogue across audio, accessories, beauty, fashion, home, lifestyle, shoes, sports, and tech
- Product cards with illustrative sample ratings/review counts and optional crossed-out compare-at pricing
- Product detail panel with long description, features, specifications, image gallery, stock status, and add-to-bag action
- AngularJS admin fields for product details, features, specs, image gallery URLs, ratings, reviews, and compare-at prices
- Automatic SQLite migration that adds the new product-detail columns to existing databases and enriches the original starter products
- Product search and category filters
- Responsive product cards, cart drawer and quantity controls
- Demo checkout that writes an order and decrements stock in SQLite
- AngularJS admin: create/edit/delete products and inspect orders
- Express REST API with basic input validation
- Database and starter catalogue created automatically on first server start

## API endpoints
| Method | Endpoint | Purpose |
|---|---|---|
| GET | `/api/health` | Health check |
| GET | `/api/products?q=term&category=Audio` | Search/list products |
| GET | `/api/products/:id` | One product |
| POST/PUT/DELETE | `/api/products` or `/api/products/:id` | Product management |
| GET | `/api/orders` | Recent orders |
| POST | `/api/orders` | Create demo order |

Example product body: `{"name":"Desk Lamp","description":"Warm adjustable light","category":"Home","price":49.99,"image":"https://example.com/lamp.jpg","stock":8,"badge":"New","details":"A longer product description.","features":"Adjustable shade\nCompact footprint","specs":"Material: Metal\nColour: Sage","rating":4.8,"reviews":32,"compare_at_price":59.99,"gallery":"https://example.com/lamp-side.jpg"}`

## Push to GitHub
Create a new **empty** repository on GitHub, then run in the project root (replace the URL):

```powershell
git init
git add .
git commit -m "Initial commit: NovaCart full-stack store"
git branch -M main
git remote add origin https://github.com/YOUR-USERNAME/YOUR-REPOSITORY.git
git push -u origin main
```

If needed, configure Git identity with `git config --global user.name "Your Name"` and `git config --global user.email "you@example.com"`. Or use VS Code Source Control to initialize, stage, commit and push. Do not commit credentials, `node_modules`, or database files.

## Project layout
```text
NovaCart-FullStack/
├─ client/                  # React storefront
│  ├─ src/App.jsx
│  ├─ src/main.jsx
│  ├─ src/styles.css
│  ├─ package.json
│  └─ vite.config.js
├─ server/                  # Express API + SQLite
│  ├─ index.js
│  ├─ public/admin.html     # AngularJS admin
│  └─ data/                 # DB created on first run
├─ package.json
├─ start-novacart.bat
└─ README.md
```

## Troubleshooting
- **node/npm not recognized:** install Node.js LTS, reopen VS Code and retry.
- **Port busy:** change `PORT` in `server/index.js` or Vite port in `client/vite.config.js`.
- **Admin UI missing:** AngularJS loads from Google's CDN, so verify internet access.
- **Reset demo data:** stop server and delete `server/data/novacart.sqlite`; it will be recreated.
- **Native module install error:** use a current Node LTS version and retry `npm install --prefix server`.

Before production, add authentication/authorization, rate limits, stronger validation, tests, secure deployment configuration, and a real payment-provider integration.
