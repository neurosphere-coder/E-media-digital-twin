#!/bin/bash

echo "🔮 INITIATING NEUROSPHERE PROTOCOL..."
echo "📂 Creating Directories..."
mkdir -p components services

# 1. CREATE LICENSE (Solusi Konflik)
echo "📜 Generating MIT License..."
cat << 'EOF' > LICENSE
MIT License

Copyright (c) 2024 neurosphere-coder

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOF

# 2. CONFIG FILES
echo "⚙️  Writing Config Files..."

cat << 'EOF' > package.json
{
  "name": "emedia-neurosphere",
  "version": "1.0.0",
  "type": "module",
  "scripts": {
    "dev": "vite --host 0.0.0.0",
    "build": "vite build",
    "preview": "vite preview"
  },
  "dependencies": {
    "@google/genai": "^1.30.0",
    "lucide-react": "^0.344.0",
    "react": "^18.2.0",
    "react-dom": "^18.2.0",
    "recharts": "^2.12.0",
    "three": "^0.161.0"
  },
  "devDependencies": {
    "@types/react": "^18.2.56",
    "@types/react-dom": "^18.2.19",
    "@types/three": "^0.161.0",
    "@vitejs/plugin-react": "^4.2.1",
    "autoprefixer": "^10.4.18",
    "postcss": "^8.4.35",
    "tailwindcss": "^3.4.1",
    "typescript": "^5.2.2",
    "vite": "^5.1.4"
  }
}
EOF

cat << 'EOF' > vite.config.ts
import { defineConfig, loadEnv } from 'vite';
import react from '@vitejs/plugin-react';

export default defineConfig(({ mode }) => {
  const env = loadEnv(mode, (process as any).cwd(), '');
  return {
    plugins: [react()],
    define: {
      'process.env.API_KEY': JSON.stringify(env.API_KEY),
      'process.env': {} 
    },
    server: {
      host: '0.0.0.0',
      port: 5173,
      watch: { usePolling: true }
    }
  };
});
EOF

cat << 'EOF' > vercel.json
{
  "rewrites": [{ "source": "/(.*)", "destination": "/index.html" }]
}
EOF

cat << 'EOF' > index.html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title>E-MEDIA — NeuroSphere Social Network</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;500;700;900&family=Rajdhani:wght@300;400;500;600;700&family=Share+Tech+Mono&display=swap" rel="stylesheet">
    <style>
      body { font-family: 'Rajdhani', sans-serif; background-color: #020617; color: #e2e8f0; overflow: hidden; margin: 0; padding: 0; }
      h1, h2, h3, h4, h5, h6, .font-cyber { font-family: 'Orbitron', sans-serif; }
      .font-mono-tech { font-family: 'Share Tech Mono', monospace; }
      ::-webkit-scrollbar { width: 4px; height: 4px; }
      ::-webkit-scrollbar-track { background: #0f172a; }
      ::-webkit-scrollbar-thumb { background: #6366f1; border-radius: 2px; }
      .glass-panel { background: rgba(15, 23, 42, 0.7); backdrop-filter: blur(12px); border: 1px solid rgba(148, 163, 184, 0.1); box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1); }
      .neon-glow { box-shadow: 0 0 10px rgba(139, 92, 246, 0.3), inset 0 0 5px rgba(139, 92, 246, 0.1); }
      .clip-corner { clip-path: polygon(10px 0, 100% 0, 100% calc(100% - 10px), calc(100% - 10px) 100%, 0 100%, 0 10px); }
      .scanline { width: 100%; height: 100px; z-index: 9999; background: linear-gradient(0deg, rgba(0,0,0,0) 0%, rgba(6, 182, 212, 0.1) 50%, rgba(0,0,0,0) 100%); opacity: 0.1; position: absolute; bottom: 100%; animation: scanline 10s linear infinite; pointer-events: none; }
      @keyframes scanline { 0% { bottom: 100%; } 80% { bottom: -100%; } 100% { bottom: -100%; } }
    </style>
  </head>
  <body>
    <div id="root"></div>
    <script type="module" src="/index.tsx"></script>
  </body>
</html>
EOF

# 3. GIT OPERATIONS
echo "🚀 INITIALIZING GIT..."
rm -rf .git
git init
git add .
git commit -m "Final System Deploy: E-MEDIA NeuroSphere (Auto-Script)"
git branch -M main
git remote add origin https://github.com/neurosphere-coder/E-media-digital-twin.git

echo "🔥 FORCE PUSHING TO GITHUB (Overwriting Remote License)..."
git push -u origin main --force

echo "✅ DEPLOYMENT COMPLETE."
echo "Visit Vercel to see your live NeuroSphere."
